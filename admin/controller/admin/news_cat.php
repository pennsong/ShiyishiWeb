<?php
class news_cat_Controller extends Controller{

	function init(){
		$this->news_cat = Load::model('news_cat');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$rows = $this->news_cat->all();
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->news_cat->order($orderid) === false){
			$this->showmsg($this->news_cat->getError(),1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}

	function addAction(){
		$cats = $this->news_cat->children(0,2);
		$this->assign('cats', $cats);
		$this->display('news_cat_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->news_cat->find($id)){
			$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$cats = $this->news_cat->children(0,2);
		$this->assign('cats', $cats);
		$this->assign('info', $info);
		$this->display('news_cat_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->news_cat->save($info) === false){
			$this->showmsg($this->news_cat->getError(),1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}
	
	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->news_cat->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->news_cat->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$this->showmsg('操作成功','list.do');
		exit();
	}
}
?>