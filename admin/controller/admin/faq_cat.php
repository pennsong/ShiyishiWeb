<?php
class faq_cat_Controller extends Controller{

	function init(){
		$this->faq_cat = Load::model('faq_cat');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$rows = $this->faq_cat->all();
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->faq_cat->order($orderid) === false){
			$this->showmsg($this->faq_cat->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$cats = $this->faq_cat->children(0,2);
		$this->assign('cats', $cats);
		$this->display('faq_cat_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->faq_cat->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$cats = $this->faq_cat->children(0,2);
		$this->assign('cats', $cats);
		$this->assign('info', $info);
		$this->display('faq_cat_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->faq_cat->save($info) === false){
			$this->showmsg($this->faq_cat->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}
	
	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->faq_cat->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->faq_cat->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>