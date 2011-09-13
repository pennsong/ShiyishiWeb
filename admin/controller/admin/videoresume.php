<?php

class videoresume_Controller extends Controller{

	function init(){
		$this->resume = Load::model('resume_vod');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$status = (isset($_GET['status'])||isset($_POST['status'])) ? (int)$this->_get('status') : 0;
		$url = $this->getPageUrl().'/list.do';
		$s['uid'] = intval($this->_get('uid'));
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$orderby = 'a.id DESC';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='uid'){
				$wheres[] = "a.uid = '$val'";
			}else{
				$wheres[] = "a.$key LIKE '%".$val."%'";
			}
		}
		if($s['uid']<=0){
			$wheres[] = "a.status = '".$status."'";
			$s['status'] = $status;
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->resume->pageUnionAll($page, 20, $url,'user','a.uid=b.id',$wheres,$orderby,'a.*,b.email,b.mobile');
		if($s['uid']>0&&empty($rows)){
			$this->showmsg('该用户还没有上传视频简历',1);
		}
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->display();
	}

	function viewAction(){
		$id = (int)$this->_get('id',0);
		if($id>0){
			$resume = $this->resume->fetchRow("id = ".$id );
		}else{
			$resume = array('error'=>"参数错误");
		}
		$this->assign('info',$resume);
		$this->display();
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$status = (int)$this->_get('status',0);
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		$this->resume->update(array('status'=>$status),"id IN (".implode(',',$ids).")");
		$this->wajaxmsg('操作成功',1);
	}
}
?>