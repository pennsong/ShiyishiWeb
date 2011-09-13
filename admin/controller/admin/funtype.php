<?php
//职位
class funtype_Controller extends Controller{

	function init(){
		$this->funtype = Load::model('funtype');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$id = 0;
		if ($this->_get('id')){
			$id = $this->_get('id');
		}
		$rows = $this->funtype->children($id,1);
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->funtype->order($orderid) === false){
			$this->showmsg($this->funtype->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$funtypes = $this->funtype->children(0,1);
		$this->assign('funtypes', $funtypes);
		$this->display('funtype_info.tpl');
	}

	function editAction(){		
		$id = $this->_get('id');
		if(!$info = $this->funtype->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$funtypes = $this->funtype->children(0,1);
		$this->assign('funtypes', $funtypes);
		$this->assign('info', $info);
		$this->display('funtype_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if ($info['parent_id'] === ''){
			unset($info['parent_id']);
		}
		if($this->funtype->save($info) === false){
			$this->showmsg($this->funtype->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		if(count($this->funtype->children($id,1))>0){
			$this->showmsg('不能删除包含子类别的分类',1);
		}
		if(!$rowCount = $this->funtype->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->funtype->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>