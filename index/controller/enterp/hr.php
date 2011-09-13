<?php
//企业
class hr_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$this->display('hrlist.tpl');
	}

	function infoAction(){
		$this->display('hrxx.tpl');
	}

}
?>
