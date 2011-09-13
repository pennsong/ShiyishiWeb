<?php

class resume_Controller extends Controller{

	function init(){
		$this->jobs = Load::model('resume');
		$this->e_user = Load::model('e_user');
		$this->job_category = Load::model('job_category');
		$this->editor = Load::lib('editor');
		$job_category = $this->job_category->fetchAll(array());
		$tmp=array();
		if($job_category){
			foreach($job_category as $key => $val){
				$tmp[$val['id']] = $val;
			}
			$this->job_category=$tmp;
			unset($tmp);
		}
		$e_user = $this->e_user->fetchAll(array());
		if($e_user){
			foreach($e_user as $key => $val){
				$tmp[$val['id']] = $val;
			}
			$this->e_user=$tmp;
			unset($tmp);
		}
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['cid'] = trim($this->_get('cid'));
		$s['jid'] = trim($this->_get('jid'));
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$s['title'] = $this->_get('title');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$sdate = 'createtime';
		$orderby = 'id DESC';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "$key LIKE '%".$val."%'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->jobs->pageAll($page, 20, $url,$wheres,$orderby);
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('e_user', $this->e_user);
		$this->assign('job_category', $this->job_category);
		$this->assign('rows', $rows);
		$this->assign('turl',$url.'&page='.$page);
		$this->display('resume_list.tpl');
	}


	function addAction(){
		$this->display('resume_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!($info = $this->jobs->find($id))){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['content'] = $this->editor->create($info['jtext']);
		$this->assign('info', $info);
		$this->assign('e_user', $this->e_user);
		$this->assign('job_category', $this->job_category);
		$this->display('resume_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['id']){
			$info['createtime'] = time();
		}
		$info['starttime'] = strtotime($info['starttime']);
		$info['endtime'] = strtotime($info['endtime']);
		$info['jtext'] = $info['content'];
		if(($uid = $this->jobs->save($info)) === false){
			$this->showmsg($this->jobs->getError(),1,"380");
		}
		$this->showmsg('操作成功','list.do');
	}

	function checkAction(){
		$ids = $this->_get('ids');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		//$this->jobs->update("id IN (".implode(',',$ids).")");
		foreach($ids as $key => $id){
			$this->jobs->remove($id);
		}
		$this->wajaxmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$rowCount = $this->jobs->remove($id);
		if(!$rowCount){
			if($rowCount === false)
				$this->wajaxmsg($this->jobs->getError());
			else
				$this->wajaxmsg('您请求的数据不存在');
		}
    	$this->wajaxmsg('删除成功','list.do');
	}
}
?>