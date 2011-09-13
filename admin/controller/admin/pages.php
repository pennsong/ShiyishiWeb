<?php
class pages_Controller extends Controller{

	function init(){
		$this->pages = Load::model('pages');
		$this->editor = Load::lib('editor');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$page = $this->_get('page',1);
		$rows = $this->pages->pageAll($page, 20, $url,null,'id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['status'] = F::getcnName($val['status']);
		}	
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$content = $this->editor->create();
		$this->assign('info', array('status'=>'show','content'=>$content));
		$this->display('pages_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->pages->find($id)){
			$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$info['content'] = $this->editor->create($info['content']);
		$this->assign('info', $info);
		$this->display('pages_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$content = $this->_get('content');
		if(!$content){
			$this->showmsg('内容不能为空！',1);
		}
		$info['content'] = $content;
		if($this->pages->save($info) === false){
			$this->showmsg($this->pages->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->pages->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->pages->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
    	$this->showmsg('操作成功',F::refererto());
	}
}
?>