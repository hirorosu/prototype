<?php
//ログアウトの処理
//session変数を使えるよう宣言
session_start();

//SESSIONを初期化（空っぽにする）
$_SESSION = array();

//Cookieに保存してある"chk_sessionIdの保存期間を過去にして破棄
//session_name()は、セッションID名を返す関数
if( isset($_COOKIE[session_name()]) ) {
    setcookie(session_name(), '', time()-4200000, '/');
}

//サーバ側での、セッションIDの破棄
session_destroy();

//処理後、index.phpへリダイレクト
header("Location: signIn.php");
exit();


?>