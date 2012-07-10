<?php
class thirdPartInterview_Controller extends Controller{	
	function indexAction(){
		$this->assign('pagetitle','第三方面试观看');
		$this->display('thirdPartInterview.tpl');
	}
}
?>