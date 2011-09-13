<?php
class mailtemplate_Controller extends Controller{

	function init(){
		$this->mailtemplate = Load::model('mailtemplate');
		$this->editor = Load::lib('editor');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$rows = $this->mailtemplate->pageAll($this->_get('page',1), 20, $url,'','id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['status'] = F::getcnName($val['status']);
			$rows[$key]['createdate'] = date("Y-m-d H:i:s",$val['createdate']);
		}	
		$page = $this->_get('page');
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$mailcontent = $this->editor->create();
		$this->assign('info', array('mailcontent'=>$mailcontent));
		$this->display('mailtemplate_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->mailtemplate->find($id)){
			$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$info['mailcontent'] = $this->editor->create($info['mailcontent']);
		$info['createdate'] = date("Y-m-d H:i:s",$info['createdate']);
		$this->assign('info', $info);
		$this->display('mailtemplate_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$content = $this->_get('content');
		if(!$content){
			$this->showmsg('内容不能为空！',1);
		}
		$info['mailcontent'] = $content;
		if(!$info['id'])$info['createdate'] = time();
		if($this->mailtemplate->save($info) === false){
			$this->showmsg($this->mailtemplate->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->mailtemplate->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->mailtemplate->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
    	 $this->showmsg('操作成功',"list.do?page=$page");
	  exit();
	}
}
?>