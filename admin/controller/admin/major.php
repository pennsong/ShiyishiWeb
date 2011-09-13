<?php
//专业
class major_Controller extends Controller{

	function init(){
		$this->major = Load::model('major');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$id = 0;
		if ($this->_get('id')){
			$id = $this->_get('id');
		}
		$rows = $this->major->children($id,1);
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->major->order($orderid) === false){
			$this->showmsg($this->major->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$majors = $this->major->children(0,1);
		$this->assign('majors', $majors);
		$this->display('major_info.tpl');
	}

	function editAction(){		
		$id = $this->_get('id');
		if(!$info = $this->major->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$majors = $this->major->children(0,1);
		$this->assign('majors', $majors);
		$this->assign('info', $info);
		$this->display('major_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if ($info['parent_id'] === ''){
			unset($info['parent_id']);
		}
		if($this->major->save($info) === false){
			$this->showmsg($this->major->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		if(count($this->major->children($id,1))>0){
			$this->showmsg('不能删除包含子类别的分类',1);
		}
		if(!$rowCount = $this->major->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->major->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>