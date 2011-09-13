<?php

class area_Controller extends Controller{

	function init(){
		$this->area = Load::model('area');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$id = 0;
		if ($this->_get('id')){
			$id = $this->_get('id');
		}
		$zxs = $this->area->getzxs();
		$rows = $this->area->children($id,1);
		$rows = array_merge($zxs,$rows);
		$qita = $this->area->children(10000,1);
		$this->assign('rows', array_merge($rows,$qita));
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->area->order($orderid) === false){
			$this->showmsg($this->area->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$t = (int)$this->_get('t',0);
		$type =0;
		if($t>0){
			$areas = $this->area->children(0,1);
		}elseif($t==-2){
			$areas = $this->area->getzxs();
			$type=-1;
		}
		$this->assign('areas', $areas);
		$this->assign('info', array('parent_id'=>$t,'type'=>$type));
		$this->display('area_info.tpl');
	}

	function editAction(){		
		$id = $this->_get('id');
		if(!$info = $this->area->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		if($info['type']<0){
			$areas = $this->area->getzxs();
		}else{
			$areas = $this->area->children(0,1);
		}
		$this->assign('areas', $areas);
		$this->assign('info', $info);
		$this->display('area_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if ($info['parent_id'] === ''){
			unset($info['parent_id']);
		}
		if($this->area->save($info) === false){
			$this->showmsg($this->area->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		if(count($this->area->children($id,1))>0){
			$this->showmsg('不能删除包含城市的省份。要删除请先解除其所属的城市',1);
		}
		if(!$rowCount = $this->area->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->area->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>