<?php
function db_con(){
    //DB接続情報定義
    $dbinfo = array(
        //ローカルDB
        "host"=>'mysql:dbname=hirorosu;charset=utf8;host=localhost', "id" => 'root',"pw" => ''

        //本番DB
        // "host"=>'',
        // "id" => '',
        // "pw" => ''

    );

    //DB接続
    try {
        $pdo = new PDO($dbinfo["host"],$dbinfo["id"],$dbinfo["pw"]);
    } catch (PDOException $e) {
        exit('DbConnectError(データベースに接続できませんでした。):'.$e->getMessage());
    }
    return $pdo;
}

//SQL処理エラー
function qerror($stmt){
    $error = $stmt->errorInfo();
    exit("ErrorQuery(クエリーエラーです。):".$error[2]);
}

//サインイン認証チェック、SESSION
function singInCheck() {
    if (
        !isset($_SESSION["chk_ssid"]) ||
        $_SESSION["chk_ssid"] != session_id()
    )
    {
        header("Location: index.php");
        exit();
    } else {
        session_regenerate_id(true);
        $_SESSION["chk_ssid"] = session_id();
    }
}

/**
* XSS
* @Param:  $str(string) 表示する文字列
* @Return: (string)     サニタイジングした文字列
*/
function h($str){
    return htmlspecialchars($str, ENT_QUOTES, "UTF-8");
}

?>
