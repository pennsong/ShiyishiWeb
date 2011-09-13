<?php
//会员中心 修改密码
class profile_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
	}
	
	function indexAction()
	{
		$myinfo = $this->user->find($this->logininfo['uid']);
		$this->assign('pagetitle','修改密码');
		$this->assign('myinfo',$myinfo);
		$this->display();
	}
}
?>
