<?php
/*
* 网银 直连银行设置
*/
class netbank_Controller extends Controller{

	function init(){
		$this->netbank = Load::model('netbank');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$paytype = $this->_get('paytype','99bill');
		$rows = $this->netbank->fetchAll("paytype='".$paytype."'","displayorder asc");
		$this->assign('paytype', $paytype);
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('displayorder');
		if($this->netbank->order($orderid) === false){
			$this->showmsg($this->netbank->getError(),1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}

	function addAction(){
		$this->display('netbank_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->netbank->find($id)){
			$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$this->assign('info', $info);
		$this->display('netbank_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->netbank->save($info) === false){
			$this->showmsg($this->netbank->getError(),1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}

	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->netbank->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->netbank->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}
}
?>