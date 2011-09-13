<?php
class login_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
	}	

	function indexAction(){
		$this->uid = $this->logininfo['uid'];
		if(!$this->uid){
			$this->display('login.tpl');
		}else{
			$this->_header(BASE_URL."/enterp/");
		}
	}
}
?>
