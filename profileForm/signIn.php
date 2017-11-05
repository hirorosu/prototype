<!DOCTYPE html>
<html lang="ja">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/signIn.css">
    <link rel="shortcut icon" href="img/faviconSignIn.jpeg">
    <title>逆求人高専生LogIn</title>
</head>

<body>
    <div class="main_visual">
        <div class="item_center">
			<h1 class="wellcome">サインイン</h1>
			<div class="form">
				<!-- ハンドルネーム、パスワード、ajaxを使う -->
				<form method="POST" action="singInSelect.php">
					<div class="formItems">
						<p>Name</p>
						<input class="aInput" type="text" name="uName" value="">
					</div>
					<div class="formItems">
						<p>Password</p>
						<input class="aInput" type="password" name="uPassword" value="">
					</div>
					<div class="formItems">
						<input class="chBox" type="checkbox" name="auto" value="false" id="signUp">
						<label for="signUp" class="check_css">サインインしたままにする</label>
					</div>
					<!-- 送信ボタン -->
					<div class="formItems">
						<input type="submit" name="" value="サインイン" class="subBtn">
						<!-- <input type="reset" value="リセット"> -->
					</div>
				</form>
            </div><!-- form -->
            <a href="index.php">
				<p class="urlLink">アカウントを新規作成する</p>
			</a>
		</div><!-- item_center -->
    </div><!-- main_visual -->


    <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
        crossorigin="anonymous"></script>
    <script src="js/index.js"></script>
</body>

</html>