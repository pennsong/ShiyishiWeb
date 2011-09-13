<?php
//注册/登录页面
class auth_Controller extends Controller{
	
	function init(){
		$this->user = Load::model('user');
		$this->pn = $this->getControllerUName();
		unset($_COOKIE['sys_cookie_city']);
	}
	
	function indexAction(){
		$this->show404("页面不存在");
	}

	function loginAction()
	{
		if(F::islogin()){
			$this->_header(BASE_URL."/my/");
		}
		if($this->_get('email')){
			$this->ajaxmsg($this->user->checkinfo('email',$this->_get('email')) ? 'fail' : 'success');
		}
		$backurl = $this->_get('r',$_SERVER['HTTP_REFERER']);
		$this->assign('backurl',$backurl);
		$this->assign('pagetitle','用户登录');
		$this->assign('crumb','用户登录');
		$this->display('login.tpl');
	}

	function getpwdAction()
	{
		if(F::islogin()){
			$this->_header(BASE_URL."/my/");
		}
		$this->assign('pagetitle','找回密码');
		$this->assign('crumb','找回密码');
		$this->display('getpwd.tpl');
	}

	function registerAction()
	{
		if(F::islogin()){
			$this->_header(BASE_URL."/my/");
		}
		if($this->_get('email')){
			$this->ajaxmsg($this->user->checkinfo('email',$this->_get('email')) ? 'fail' : 'success');
		}
		if($this->_get('usercard')){
			$this->ajaxmsg($this->user->checkinfo('usercard',$this->_get('usercard')) ? 'fail' : 'success');
		}
		if($this->_get('username')){
			$this->ajaxmsg($this->user->checkinfo('username',$this->_get('username')) ? 'fail' : 'success');
		}
		$backurl = $this->_get('r',$_SERVER['HTTP_REFERER']);
		$this->assign('backurl',$backurl);
		$this->assign('pagetitle','新用户注册');
		$this->assign('crumb','新用户注册');
		$this->display('register.tpl');
	}
}
?>
