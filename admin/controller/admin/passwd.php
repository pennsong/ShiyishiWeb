<?php

class passwd_Controller extends Controller{

	function init(){
		$this->admin = Load::model('admin');
	}
	
	function indexAction(){
		$this->_forward('edit');
	}

	function editAction(){
		$this->assign('admininfo',$_SESSION['admin_info']);
		$this->display('passwd.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['oldpasswd']){
			$this->showmsg('旧密码不能为空',1);
		}

		if($_SESSION['admin_info']['admin_password'] != md5($info['oldpasswd'])){
			$this->showmsg('旧密码输入不正确',1);
		}
		if(!$info['admin_password']){
			$this->showmsg('新密码不能为空',1);
		}

		if($info['admin_password']!=$info['newpasswd1']){
			$this->showmsg('新密码两次输入不一致',1);
		}
		$info['admin_password'] = md5($info['admin_password']);
		if($this->admin->save($info) === false){
			$this->showmsg($this->admin->getError(),1);
		}
		$_SESSION['admin_info']['admin_password'] = $info['admin_password'];
		$this->showmsg('密码修改成功','/admin/passwd.do');
	}
}
?>