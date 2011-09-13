<?php

class menu_Controller extends Controller{

	function init(){
		$this->menu = Load::model('menu');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$rows = $this->menu->all();
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->menu->order($orderid) === false){
			$this->showmsg($this->menu->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$menus = $this->menu->children(0,2);
		$this->assign('menus', $menus);
		$this->display('menu_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->menu->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$menus = $this->menu->children(0,2);
		$this->assign('menus', $menus);
		$this->assign('info', $info);
		$this->display('menu_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->menu->save($info) === false){
			$this->showmsg($this->menu->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->menu->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->menu->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>