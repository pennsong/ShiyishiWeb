<?php
class job_category_Controller extends Controller{

	function init(){
		$this->job_category = Load::model('job_category');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$where = " ";
		$rows = $this->job_category->fetchAll(array()," rid asc , pid asc ,level asc");
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$id = $this->_get('id',0);
		$cats = $this->job_category->find($id);
		$this->assign('cats', $cats);
		$this->display('job_category_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->job_category->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$cats = $this->job_category->find($info['pid']);
		$this->assign('cats', $cats);
		$this->assign('info', $info);
		$this->display('job_category_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->job_category->save($info) === false){
			$this->showmsg($this->job_category->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}
	
	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->job_category->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->job_category->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}
}
?>