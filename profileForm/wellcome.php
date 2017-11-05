<?php
session_start();

include("db.php");
//トークンがセットされていたらリダイレクト
singInCheck();

$uName = $_SESSION["uName"]


?>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/reset.css">
	<link rel="stylesheet" href="css/index.css">
	<link rel="shortcut icon" href="img/faviconSignIn.jpeg">
    <title>逆求人高専生MyPage</title>
</head>
<body>
    <h1>ようこそ</h1>
    <h2><?= $uName; ?>さん</h2>
    <form action="signOut.php" method="post">
        <input type="submit" name="logout" value="サインアウト"  class="subBtn">
    </form>


    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	    crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
</body>
</html>