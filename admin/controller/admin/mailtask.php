<?php
class mailtask_Controller extends Controller{

	function init(){
		$this->mailtask = Load::model('mailtask');
		//$this->mailtemplate = Load::model('mailtemplate');
		$this->mailtemplates = $this->cache->getMailTemplates();
		$this->conf = Load::conf('conf');
		$this->assign('mailtemplates',$this->mailtemplates);
		$this->assign('usertypes',$this->conf['usertypes']);
		$this->assign('taskaction',$this->conf['taskaction']);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$rows = $this->mailtask->pageAll($this->_get('page',1), 20, $url,'','id desc');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['status'] = F::getcnName($val['status']);
			$rows[$key]['action'] = $this->conf['taskaction'][$val['action']];
			$rows[$key]['mailtemplate'] = $this->mailtemplates[$val['templateid']]['name'];
			$rows[$key]['createdate'] = date("Y-m-d H:i:s",$val['createdate']);
		}	
		$page = $this->_get('page');
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$this->display('mailtask_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->mailtask->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}

		$info['createdate'] = date("Y-m-d H:i:s",$info['createdate']);
		$this->assign('info', $info);
		$this->display('mailtask_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['id'])$info['createdate'] = time();
		if($this->mailtask->save($info) === false){
			$this->showmsg($this->mailtask->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->mailtask->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->mailtask->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
    	$this->showmsg('操作成功',"list.do?page=$page");
	}
}
?>