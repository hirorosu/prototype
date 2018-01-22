'use strict';

// /* eslint-disable require-jsdoc */
// $(function () {
//   // Peer object
//   const peer = new Peer({
//     key: window.__SKYWAY_KEY__ = '2a9dceca-b7fe-43d6-8772-c08b6c4b4860',
//     debug: 3,
//   });

//   let localStream;
//   let room;
//   peer.on('open', () => {
//     $('#my-id').text(peer.id);
//     // Get things started
//     step1();
//   });

//   peer.on('error', err => {
//     alert(err.message);
//     // Return to step 2 if error occurs
//     step2();
//   });

//   $('#make-call').on('submit', e => {
//     e.preventDefault();
//     // Initiate a call!
//     const roomName = $('#join-room').val();
//     if (!roomName) {
//       return;
//     }
//     room = peer.joinRoom('sfu_video_' + roomName, {
//       mode: 'sfu',
//       stream: localStream
//     });

//     $('#room-id').text(roomName);
//     step3(room);
//   });

//   $('#end-call').on('click', () => {
//     room.close();
//     step2();
//   });

//   // Retry if getUserMedia fails
//   $('#step1-retry').on('click', () => {
//     $('#step1-error').hide();
//     step1();
//   });

//   // set up audio and video input selectors
//   const audioSelect = $('#audioSource');
//   const videoSelect = $('#videoSource');
//   const selectors = [audioSelect, videoSelect];

//   navigator.mediaDevices.enumerateDevices()
//     .then(deviceInfos => {
//       const values = selectors.map(select => select.val() || '');
//       selectors.forEach(select => {
//         const children = select.children(':first');
//         while (children.length) {
//           select.remove(children);
//         }
//       });

//       for (let i = 0; i !== deviceInfos.length; ++i) {
//         const deviceInfo = deviceInfos[i];
//         const option = $('<option>').val(deviceInfo.deviceId);

//         if (deviceInfo.kind === 'audioinput') {
//           option.text(deviceInfo.label ||
//             'Microphone ' + (audioSelect.children().length + 1));
//           audioSelect.append(option);
//         } else if (deviceInfo.kind === 'videoinput') {
//           option.text(deviceInfo.label ||
//             'Camera ' + (videoSelect.children().length + 1));
//           videoSelect.append(option);
//         }
//       }

//       selectors.forEach((select, selectorIndex) => {
//         if (Array.prototype.slice.call(select.children()).some(n => {
//             return n.value === values[selectorIndex];
//           })) {
//           select.val(values[selectorIndex]);
//         }
//       });

//       videoSelect.on('change', step1);
//       audioSelect.on('change', step1);
//     });

//   function step1() {
//     // Get audio/video stream
//     const audioSource = $('#audioSource').val();
//     const videoSource = $('#videoSource').val();
//     const constraints = {
//       audio: {
//         deviceId: audioSource ? {
//           exact: audioSource
//         } : undefined
//       },
//       video: {
//         deviceId: videoSource ? {
//           exact: videoSource
//         } : undefined
//       },
//     };

//     navigator.mediaDevices.getUserMedia(constraints).then(stream => {
//       $('#my-video').get(0).srcObject = stream;
//       localStream = stream;

//       if (room) {
//         room.replaceStream(stream);
//         return;
//       }

//       step2();
//     }).catch(err => {
//       $('#step1-error').show();
//       console.error(err);
//     });
//   }

//   function step2() {
//     $('#step1, #step3').hide();
//     $('#step2').show();
//     $('#join-room').focus();
//   }

//   function step3(room) {
//     // Wait for stream on the call, then set peer video display
//     room.on('stream', stream => {
//       const peerId = stream.peerId;
//       const id = 'video_' + peerId + '_' + stream.id.replace('{', '').replace('}', '');

//       $('#their-videos').append($(
//         '<div class="video_' + peerId + '" id="' + id + '">' +
//         '<label>' + stream.peerId + ':' + stream.id + '</label>' +
//         '<video class="remoteVideos" autoplay playsinline>' +
//         '</div>'));
//       const el = $('#' + id).find('video').get(0);
//       el.srcObject = stream;
//       el.play();
//     });

//     room.on('removeStream', stream => {
//       const peerId = stream.peerId;
//       $('#video_' + peerId + '_' + stream.id.replace('{', '').replace('}', '')).remove();
//     });

//     // UI stuff
//     room.on('close', step2);
//     room.on('peerLeave', peerId => {
//       $('.video_' + peerId).remove();
//     });
//     $('#step1, #step2').hide();
//     $('#step3').show();
//   }
// });













let localStream = null;
let peer = null;
let existingCall = null;

// カメラ映像・マイク音声を取得する処理（getUserMediaというAPI）
navigator.mediaDevices.getUserMedia({
    video: true,
    audio: true
  })
  .then(function (stream) {
    // Success Streamオブジェクト（自分のカメラ映像）を表示用のvideo要素にセット
    $('#my-video').get(0).srcObject = stream;
    localStream = stream;
  }).catch(function (error) {
    // Error
    console.error('mediaDevice.getUserMedia() error:', error);
    return;
  });

// APIの定義（peerオブジェクトの作成）Peer（相手）
peer = new Peer({
  key: '2a9dceca-b7fe-43d6-8772-c08b6c4b4860',
  debug: 3
});

// PeerIDが発行されたら、その情報をUIに表示する処理
peer.on('open', function () {
  $('#my-id').text(peer.id);
});

// エラーを表示させる処理
peer.on('error', function (err) {
  alert(err.message);
})

// 発信ボタンをクリックした場合に相手に発信する
$('#make-call').submit(function (e) {
  e.preventDefault();
  const call = peer.call($('#callto-id').val(), localStream);
  setupCallEventHandlers(call);
});
// 切断ボタンをクリックした場合に、相手との接続を切断する
$('#end-call').click(function () {
  existingCall.close();
});

// 着信処理
peer.on('call', function (call) {
  call.answer(localStream);
  setupCallEventHandlers(call);
});

// 今回作るアプリでは既に接続中の場合は一旦既存の接続を切断し、後からきた接続要求を優先する
function setupCallEventHandlers(call) {
  if (existingCall) {
    existingCall.close();
  };
  existingCall = call;
  call.on('stream', function (stream) {
    addVideo(call, stream);
    setupEndCallUI();
    $('#their-id').text(call.remoteId);
  });
  call.on('close', function () {
    removeVideo(call.remoteId);
    setupMakeCallUI();
  });
}

// VIDEOを再生するための処理
function addVideo(call, stream) {
  $('#their-video').get(0).srcObject = stream;
}

// 切断された（した）相手のvideo要素を削除するための処理
function removeVideo(peerId) {
  $('#' + peerId).remove();
}

// 発信ボタン、切断ボタンの表示を切り替えるための処理
function setupMakeCallUI() {
  $('#make-call').show();
  $('#end-call').hide();
}

function setupEndCallUI() {
  $('#make-call').hide();
  $('#end-call').show();
}






// // Peer（相手）との接続が切れた時の処理
// // peer.on('close', function () {});
// // 
// // サーバとの接続が切れた時の処理
// // peer.on('disconnected', function () {});