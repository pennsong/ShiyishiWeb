<?php
class forget_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
	}	

	function indexAction(){
		$this->display('forget.tpl');
	}
}
?>
