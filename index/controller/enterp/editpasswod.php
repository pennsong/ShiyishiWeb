<?php
class editpasswod_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
		$this->uid = $this->logininfo['uid'];
		$this->user = Load::model('e_user');
	}

	function indexAction(){
		$this->display('editpasswod.tpl');
	}

	function editAction(){
		$password_old = $this->_get('password_old');
		$password1 = $this->_get('password1');

		$userinfo = $this->user->find($this->uid);
		if($userinfo['password']!=md5($password_old)){
			$this->showmsg("您的旧密码不正确！",1);
		}
		$userinfo['password'] = md5($password1);
		if($this->user->save($userinfo) === false){
			$this->showmsg($this->user->getError(),1);
		}
		$this->showmsg('恭喜，密码修改成功',BASE_URL."/enterp/");
	}
}
?>
