<?php
//登录页面
class login_Controller extends Controller{
	
	function init(){
		$this->user = Load::model('user');
		unset($_COOKIE['sys_cookie_city']);
	}
	
	function indexAction(){
		if(F::islogin()){
			$this->_header(BASE_URL."/member/");
		}
		
		$backurl = $this->_get('r',$_SERVER['HTTP_REFERER']);
		$this->assign('backurl',$backurl);
		$this->assign('pagetitle','用户登录');
		$this->display();
	}
}
?>
