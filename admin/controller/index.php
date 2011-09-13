<?php

class index_Controller extends Controller{

	function init(){
	}
	
	function indexAction(){
		$admin_info = $this->_get('admin_info');
		if($admin_info['login']==1)
		{
			$this->_redirect('/admin.do');
		}
		else
		{
			$this->_forward('login');
		}
	}

	function loginAction(){
		if($_POST['formhash'])
		{
			$admin_name = $this->_get('admin_name');
			$admin_pwd = $this->_get('admin_pwd');
			if(!$admin_name || !$admin_pwd){
				$this->showmsg('登录名或密码不能为空',1);
			}
			if(strlen($admin_pwd)<5){
				$this->showmsg('密码不合法',1);
			}
			$this->admin = Load::model('admin');
			$admin_info = $this->admin->checkadmin_login($admin_name,$admin_pwd);
			if(!$admin_info)
			{
				$this->showmsg('登录名或密码错误，请重新登录！',1);
			}
			$this->admin->update(array('id'=>$admin_info['id'],'admin_lastlogintime'=>time()));
			$admin_info['login'] = 1;
			$duty = Load::model('duty');
			$conf = Load::conf('conf');
			$dutyarr = $duty->getcache();
			$admin_info['admin_zhiwuname'] = $dutyarr[$admin_info['admin_zhiwu']];
			if($admin_info['admin_purview'])
			{
				$admin_info['auth'] = $duty->getDutypurview(unserialize($admin_info['admin_purview']));
			}
			elseif($admin_info['admin_zhiwu'])
			{
				$admin_info['auth'] = $duty->getDuty($admin_info['admin_zhiwu']);
			}else {
				$admin_info['auth'] = array();
			}
			//获取用户IP
			$admin_info['login_ip'] = F::onlineip();
			$_SESSION['admin_info'] = $admin_info;
			$adminlog = Load::model('adminlog');
			$_POST['admin_pwd'] = '******';
			$adminlog->save(array('action'=>'login','model'=>'index'));
			$this->showmsg('成功：登录管理后台',"/admin.do");
		}
		$admin_info = $this->_get('admin_info');
		if($admin_info['login']==1)
		{
			$this->_redirect('/admin.do');
		}
		$this->display();
	}

	function logoutAction(){
		$admin_info = $this->_get('admin_info');
		if(!($admin_info['login']==1))
		{
			$this->_redirect('/login.do');
		}
		$adminlog = Load::model('adminlog');
		$adminlog->save(array('action'=>'logout','model'=>'index'));
		unset($_SESSION['admin_info']);
		$this->showmsg('成功：退出管理后台',"/login.do");
	}
}
?>