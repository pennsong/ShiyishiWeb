<?php
//招聘
class job_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$this->display('joblist.tpl');
	}

	function infoAction(){
		$this->display('jobxx.tpl');
	}
}
?>
