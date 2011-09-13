<?php

class index_Controller extends Controller{
	
	function indexAction(){
		if($_SESSION['admin_info'] && $_SESSION['admin_info']['login']==1)
		{
			$menu = Load::model('menu');
			$rows = $menu->getcache();
			$json = Load::lib('json');
			$this->assign('menus',$rows);
			$this->assign('admininfo',$_SESSION['admin_info']);
			$this->assign('json_menus',$json->encode($rows));
			$this->display();
		}
		else
		{
			$this->showmsg('错误：你还未登录！',"/login.do");
		}
		
	}

	function homeAction(){
		@header('Content-Type:text/html;charset=utf-8');
		echo "页面正在载入中......请稍后！";
	}

	function loginAction(){
		echo "login";
	}

	function logoutAction(){
		echo "logout";
	}
}
?>