<?php
// session_start();
//トークンがセットされていたらリダイレクト
// if (isset($_COOKIE['token'])) {
//     header("HTTP/1.1 301 Moved Permanently");
//     header("Location: logincheck.php");
// }
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
	<title>逆求人高専生にサインアップする</title>
</head>

<body>
	<div class="wrapper">
		<div class="img_left">
			<!-- <img src="img/bg.jpg" alt=""> -->
		</div>
		<div class="item_right">
			<h1 class="wellcome">ようこそ</h1>
			<div class="form">
				<!-- ハンドルネーム、パスワード、確認パスワード -->
				<form method="POST" action="signUp.php">
					<div class="formItems">
						<p>Name</p>
						<input class="aInput" type="text" name="uName" value="">
					</div>
					<div class="formItems">
						<p>Password</p>
						<input class="aInput" type="password" name="uPassword" value="">
					</div>
					<div class="formItems">
						<p>Password(確認)</p>
						<input class="aInput" type="password" name="uPasswordCheck" value="">
					</div>
					<div class="formItems">
						<p>学年</p>
						<select class="aInput" name="uGrade" id="">
							<option value="1nen">1年生</option>
							<option value="2nen">2年生</option>
							<option value="3nen">3年生</option>
							<option value="4nen">4年生</option>
							<option value="5nen">5年生</option>
							<option value="senkouka1">専攻科 1年生</option>
							<option value="senkouka2">専攻科 2年生</option>
						</select>
					</div>
					<div class="formItems">
						<p>高専名</p>
						<input class="aInput" type="text" name="uSchool" value="">
					</div>
					<div class="formItems">
						<input class="chBox" type="checkbox" name="auto" value="false" id="signUp">
						<label for="signUp" class="check_css">サインインしたままにする</label>
					</div>
					<!-- 送信ボタン -->
					<div class="formItems">
						<input type="submit" name="" value="サインアップ" class="subBtn">
						<!-- <input type="reset" value="リセット"> -->
					</div>
				</form>
			</div><!-- form -->
			<a href="signIn.php">
				<p class="urlLink">既にアカウントお持ちの方はこちら</p>
			</a>
			<!-- <fb:login-button scope="public_profile,email" onlogin="checkLoginState();"></fb:login-button> -->
			<!-- <a class="FbBtn" href="https://www.facebook.com/dialog/oauth?client_id={your-app-id}&amp;redirect_uri={redirect-uri}">
				<div class="FbBtnLabel">Facebookでログイン</div>
			</a> -->
		</div>
	</div>
	<!-- .wrapper -->


	<!-- aaaaaaaaaaaaaaaaaaaaaaaaa -->
	<!-- aaaaaaaaaaaaaaaaaaaaaaaaa -->


	<script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	    crossorigin="anonymous"></script>
	<script src="js/index.js"></script>
	<!-- <script src="js/loginFB.js"></script> -->
</body>

</html>