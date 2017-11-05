<?php
session_start();
$old_sessionid = session_id();
session_regenerate_id();
$new_sessionid = session_id();

include("db.php");
$pdo = db_con();
// //DB変数定義
// const DSN = "mysql:dbname=hirorosu;charset=utf8;host=localhost";
// const USER = "root";
// const PASS = "";
// //DB接続
// try {
//     $pdo = new PDO(DSN, USER, PASS);
// } catch(PDOException $e) {
//     exit('DbConnectError:'. $e->getMessage());
// }

//POSTデータの取得
$uName = $_POST["uName"];
$uPassword = $_POST["uPassword"];
$uPasswordCheck = $_POST["uPasswordCheck"];
$uGrade = $_POST["uGrade"];
$uSchool = $_POST["uSchool"];
// $auto = $_POST["auto"];
// $cookie_token = $_COOKIE['token'];

//データ登録
$sql = "INSERT INTO users_table(
    id, uName, uPassword, uPasswordCheck, uGrade, uSchool, indate
    ) VALUES (
    NULL, :uName, :uPassword, :uPasswordCheck, :uGrade, :uSchool, sysDate())";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(':uName', $uName, PDO::PARAM_STR);
$stmt->bindValue(':uPassword', $uPassword, PDO::PARAM_STR);
$stmt->bindValue(':uPasswordCheck', $uPasswordCheck, PDO::PARAM_STR);
$stmt->bindValue(':uGrade', $uGrade, PDO::PARAM_STR);
$stmt->bindValue(':uSchool', $uSchool, PDO::PARAM_STR);
$status = $stmt->execute();

//データ登録処理後
if($status==false) {
    qerror($stmt); //SQL処理エラー
} else {
    $_SESSION["chk_ssid"] = $new_sessionid;
    $_SESSION["uName"] = $uName;
    header("Location: wellcome.php");
    exit;
}


// //---------------------------------------------------------------------------//
// // 自動ログインについて(https://www.websec-room.com/2015/02/22/2055)
// //---------------------------------------------------------------------------//
// //ログイン判定フラグ
// $normal_result = false;
// $auto_result = false;
// //簡易ログイン
// if (!isset($cookie_token)) {
//     if (check_user($id, $password)) {
//         $normal_result = true;
//     }
// }
// //自動ログイン
// if (isset($cookie_token) ) {
//     if (check_auto_login($cookie_token)) {
//         $auto_result = true;
//         $id = $_SESSION['USER_ID'];
//     }
// }
// //ログイン判定
// if ($normal_result || $auto_result) {
//     //ログイン成功
//     //セッション ID の振り直し
//     session_regenerate_id(true);
    
//     //トークン生成処理
//     if (($normal_result && $auto == true) || $auto_result) {
//         //トークンの作成
//         $token = get_token();
//         //トークンの登録
//         register_token($id, $token);
//         //自動ログインのトークンを２週間の有効期限でCookieにセット
//         setCookie("token", $token, time()+60*60*24*14, "/", null, TRUE, TRUE);
//         if ($auto_result) {
//             //古いトークンの削除
//             delete_old_token($cookie_token);
//         }
//     }

//     //リダイレクト
//     header("HTTP/1.1 301 Moved Permanently");
//     header("Location: welcome.php");
// } else {
//     //ログイン失敗

//     //リダイレクト
//     header("HTTP/1.1 301 Moved Permanently");
//     header("Location: login.php");
// }
// //---------------------------------------------------------------------------//
// // ログイン処理
// //---------------------------------------------------------------------------//
// function check_user($id, $password) {
//     //DB接続
//     $db = MDB2::connect($GLOBALS['DNS'] );
//     //プレースホルダで SQL 作成
//     $sql = "SELECT COUNT(*) AS CNT FROM USERS WHERE USER_ID = ? AND PASSWORD = ?;";
//     //パラメーターの型を指定
//     $stmt = $db->prepare($sql, array('text', 'text'));
//     //パラメーターを渡して SQL 実行
//     $rs = $stmt->execute(array($id, $password));
//     while ($row = $rs->fetchRow(MDB2_FETCHMODE_ASSOC)) {
//         $count = $row['cnt'];
//     }
//     $db->disconnect();
//     if ($count == 1) {
//         //ログイン成功
//         return true;
//     } else {
//         //ログイン失敗
//         return false;
//     }
// }
// //---------------------------------------------------------------------------//
// //自動ログイン処理
// //--------------------------------------------------------------------------//
// function check_auto_login($token) {
//     //DB接続
//     $db = MDB2::connect($GLOBALS['DNS'] );
//     //プレースホルダで SQL 作成
//     $sql = "SELECT COUNT(*) AS CNT FROM AUTO_LOGIN WHERE TOKEN = ? AND REGISTRATED_TIME >= ?;";
//     //パラメーターの型を指定
//     $stmt = $db->prepare($sql, array('text', 'timestamp'));
//     //2週間前の日付を取得
//     $date = new DateTime("- 14 days");
//     //パラメーターを渡して SQL 実行
//     $rs = $stmt->execute(array($token, $date->format('Y-m-d H:i:s')));
//     while ($row = $rs->fetchRow(MDB2_FETCHMODE_ASSOC)) {
//         $count = $row['cnt'];
//     }
//     $db->disconnect();
//     if ($count ==1) {
//         //自動ログイン成功
//         //USER_ID を取得する
//         //DB接続
//         $db = MDB2::connect($GLOBALS['DNS'] );
//         //プレースホルダで SQL 作成
//         $sql = "SELECT * FROM AUTO_LOGIN WHERE TOKEN = ? AND REGISTRATED_TIME >= ?;";
//         //パラメーターの型を指定
//         $stmt = $db->prepare($sql, array('text', 'timestamp'));
//         //2週間前の日付を取得
//         $date = new DateTime("- 14 days");
//         //パラメーターを渡して SQL 実行
//         $rs = $stmt->execute(array($token, $date->format('Y-m-d H:i:s')));
//         while ($row = $rs->fetchRow(MDB2_FETCHMODE_ASSOC)) {
//             $_SESSION['USER_ID']  = $row['user_id'];
//         }
//         $db->disconnect();
//         return true;
//     } else {
//         //自動ログイン失敗
//         //Cookie のトークンを削除
//         setCookie("token", '', -1, "/", null, TRUE, TRUE);
//         //古くなったトークンを削除
//         delete_old_token($token);
//         return false;
//     }
// }
// //---------------------------------------------------------------------------//
// //トークンの登録
// //---------------------------------------------------------------------------//
// function register_token($id, $token) {
//     //DB接続
//     $db = MDB2::connect($GLOBALS['DNS'] );
//     //プレースホルダで SQL 作成
//     $sql = "INSERT INTO AUTO_LOGIN ( USER_ID, TOKEN, REGISTRATED_TIME) VALUES (?,?,?);";
//     //パラメーターの型を指定
//     $stmt = $db->prepare($sql, array('text','text','timestamp'));
//     //パラメーターを渡して SQL 実行
//     $stmt->execute(array($id, $token,date('Y-m-d H:i:s')));
//     $db->disconnect();
// }
// //---------------------------------------------------------------------------//
// //トークンの削除
// //---------------------------------------------------------------------------//
// function delete_old_token($token) {
//     //DB接続
//     $db = MDB2::connect($GLOBALS['DNS'] );
//     //プレースホルダで SQL 作成
//     $sql = "DELETE  FROM AUTO_LOGIN WHERE TOKEN = ?";
//     //パラメーターの型を指定
//     $stmt = $db->prepare($sql, array('text'));
//     //パラメーターを渡して SQL 実行
//     $stmt->execute(array($token));
//     $db->disconnect();
// }
// //---------------------------------------------------------------------------//
// // トークンを作成
// //---------------------------------------------------------------------------//
// function get_token() {
//     $TOKEN_LENGTH = 16;//16*2=32桁
//     $bytes = openssl_random_pseudo_bytes($TOKEN_LENGTH);
//     return bin2hex($bytes);
// }


?>