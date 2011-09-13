<?php
class rule_Controller extends Controller{

	function init(){
		if(F::islogin('enterp')){
			$this->logininfo = F::logininfo("enterp");
		}
	}
	
	function indexAction(){
		$this->assign('pagetitle','奖励规则');
		$this->display('rule.tpl');
	}
}
?>