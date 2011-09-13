<?php
/*
* 用户系统 @Author Guoli
*/
class jobs_Controller extends Controller{

	function init(){
		$this->jobs = Load::model('jobs');
		$this->e_user = Load::model('e_user');
		$this->editor = Load::lib('editor');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['cid'] = trim($this->_get('cid'));
		//$s['jid'] = trim($this->_get('jid'));
		$s['startdate'] = $this->_get('startdate');
		$s['enddate'] = $this->_get('enddate');
		$s['title'] = $this->_get('title');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$sdate = 'createtime';
		$orderby = 'id DESC';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='startdate'){
				$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
			}elseif($key=='enddate'){
				$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "$key LIKE '%".$val."%'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->jobs->pageAll($page, 20, $url,$wheres,$orderby);

		$company = $this->e_user->fetchAll(" username!='' and password!='' "," createtime desc "," id,company");

		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('company', $company);
		$this->assign('rows', $rows);
		$this->assign('turl',$url.'&page='.$page);
		$this->display('jobs_list.tpl');
	}


	function addAction(){
		$this->display('jobs_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!($info = $this->jobs->find($id))){
			$this->showmsg('您请求的数据不存在',1);
		}
		$company = $this->e_user->fetchAll(" username!='' and password!='' "," createtime desc "," id,company");

		$info['content'] = $this->editor->create($info['jtext']);
		$this->assign('info', $info);
		$this->assign('e_user', $company);
		$this->assign('job_category', $this->job_category);
		$this->display('jobs_info.tpl');
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