window.fbAsyncInit = function () {
    console.log("ok1");
    FB.init({
        appId: '{your_app_id}',
        cookie: true,
        xfbml: true,
        version: 'v2.0'
    });
};

(function (d, s, id) {
    console.log("ok2");
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s);
    js.id = id;
    js.src = "//connect.facebook.net/ja_JP/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));