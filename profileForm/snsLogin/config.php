<?php

ini_set('display_errors', 1);

require_once(__DIR__ . '/vendor/autoload.php');

define('APP_ID', '371506216634542');
define('APP_SECRET', '3704756d79983ef7896cc132d9b45f9a');
define('APP_VERSION', 'v2.11');

define('DSN', 'mysql:host=localhost;dbname=dotinstall_fb_connect_php');
define('DB_USERNAME', 'dbuser');
define('DB_PASSWORD', 'chAW6s6B');

define('CALLBACK_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/login.php');

session_start();

require_once(__DIR__ . '/functions.php');