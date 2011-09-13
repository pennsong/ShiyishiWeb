<?php
//行业
class dustrytype_Controller extends Controller{

	function init(){
		$this->dustrytype = Load::model('dustrytype');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$id = 0;
		if ($this->_get('id')){
			$id = $this->_get('id');
		}
		$rows = $this->dustrytype->children($id,1);
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->dustrytype->order($orderid) === false){
			$this->showmsg($this->dustrytype->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$dustrytypes = $this->dustrytype->children(0,1);
		$this->assign('dustrytypes', $dustrytypes);
		$this->display('dustrytype_info.tpl');
	}

	function editAction(){		
		$id = $this->_get('id');
		if(!$info = $this->dustrytype->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$dustrytypes = $this->dustrytype->children(0,1);
		$this->assign('dustrytypes', $dustrytypes);
		$this->assign('info', $info);
		$this->display('dustrytype_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if ($info['parent_id'] === ''){
			unset($info['parent_id']);
		}
		if($this->dustrytype->save($info) === false){
			$this->showmsg($this->dustrytype->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		if(count($this->dustrytype->children($id,1))>0){
			$this->showmsg('不能删除包含子行业的分类',1);
		}
		if(!$rowCount = $this->dustrytype->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->dustrytype->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>