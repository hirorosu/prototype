<?php

require_once(__DIR__ . '/config.php');

$fbLogin = new MyApp\FacebookLogin();

try {
	$fbLogin->login();
} catch (Exception $e) {
	echo $e->getMessage();
	exit;
}