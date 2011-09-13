<?php
//会员中心 账户/优惠券余额
class account_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
	}
	
	function indexAction()
	{
		$myinfo = $this->user->find($this->logininfo['uid']);
		$this->assign('pagetitle','账户/优惠券余额');
		$this->assign('crumb','账户/优惠券余额');
		$this->assign('myinfo',$myinfo);
		$this->display();
	}

	function popAction(){
		$this->display();
	}
}
?>
