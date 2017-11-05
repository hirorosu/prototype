<?php
session_start();
$old_sessionid = session_id();
session_regenerate_id();
$new_sessionid = session_id();

include("db.php");
$pdo = db_con();

//POSTデータの取得
$uName = $_POST["uName"];
$uPassword = $_POST["uPassword"];

$sql = "SELECT * FROM users_table 
WHERE uName=:uName AND uPassword=:uPassword";
$statement = $pdo->prepare($sql);
$statement->bindValue(':uName', $uName, PDO::PARAM_STR);
$statement->bindValue(':uPassword', $uPassword, PDO::PARAM_STR);
$status = $statement->execute();
if($status==false) {
    qerror($stmt); //SQL処理エラー
}

//今回入力されたname（ID）の$statementレコードを配列で取得、statusがエラーでなければ
$val = $statement->fetch();

//該当レコードがあればSESSIONに値を代入
if( $val["id"] != "" ) {
    //ログイン成功の場合
    $_SESSION["chk_ssid"] = $new_sessionid;
    $_SESSION["uName"] = $val["uName"];
    header("Location: wellcome.php");
} else {
    //ログイン失敗の場合
    header("Location: singIn.php");
}


?>