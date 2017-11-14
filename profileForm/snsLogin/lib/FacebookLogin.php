<?php

namespace MyApp;

class FacebookLogin {
	private $_fb;
	
	public function __construct() {
		$this->_fb = new \Facebook\Facebook([
			'app_id' => APP_ID,
			'app_secret' => APP_SECRET,
			'default_graph_version' => APP_VERSION,
		]);
	}
	
	public function login() {
		$helper = $this->_fb->getRedirectLoginHelper();
		
		// get access token
		try {
			$accessToken = $helper->getAccessToken();
		} catch (\Facebook\Exceptions\FacebookResponseException $e) {
			echo 'Response Error: ' . $e->getMessage();
			exit;
		} catch (\Facebook\Exceptions\FacebookSDKException $e) {
			echo 'SDK Error: ' . $e->getMessage();
			exit;
		}
		
		if (isset($accessToken)) {
			// save user
			// var_dump($accessToken);
			$this->_save($accessToken);
		} elseif ($helper->getError()) {
			header('Location: http://' . $_SERVER['HTTP_HOST']);
		} else {
			$loginUrl = $helper->getLoginUrl(CALLBACK_URL);
			header('Location: ' . $loginUrl);
		}
		exit;
	}
	
	private function _save($accessToken) {
		// get user info
		$fb = new Facebook($accessToken);
		$userNode = $fb->getUserNode();
		// var_dump($userNode); exit;
	
		// save user
		$user = new User();
		$me = $user->save($accessToken, $userNode);
	
		// login
	
	}
}