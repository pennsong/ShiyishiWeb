<?php
//会员中心 我的工作
class myjob_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
		$this->uid = $this->logininfo['uid'];
		$this->e_user = Load::model('e_user');
		$this->jobs = Load::model('jobs');
	}
	
	function indexAction()
	{
		$this->_forward('pos');
	}

	function posAction()
	{
		$url = $this->getPageUrl().'/pos.html';
		$page = (int)$this->_get('page',1);
		$posmodel = Load::model('myjob_pos');
		$rows = $posmodel->pageAll($page, 10, $url,"uid='".$this->uid."' AND status=1",'id desc');
		foreach($rows as $k=>$v){
			$v['ename'] = $this->e_user->getCompanyName($v['eid']);
			$v['jobname'] = $this->jobs->getJobName($v['jobid']);
			$rows[$k] = $v;
		}
		$this->assign('rows',$rows);
		$this->assign('pagetitle','我的职位申请记录');
		$this->display();
	}

	function intAction()
	{
		$url = $this->getPageUrl().'/int.html';
		$page = (int)$this->_get('page',1);
		$intmodel = Load::model('myjob_int');
		$rows = $intmodel->pageAll($page, 10, $url,"uid='".$this->uid."' AND status=1",'id desc');
		foreach($rows as $k=>$v){
			$v['ename'] = $this->e_user->getCompanyName($v['eid']);
			$v['jobname'] = $this->jobs->getJobName($v['jobid']);
			$rows[$k] = $v;
		}
		$this->assign('rows',$rows);
		$this->assign('pagetitle','我的面试机会');
		$this->display();
	}

	function rviewdAction()
	{
		$url = $this->getPageUrl().'/rviewd.html';
		$page = (int)$this->_get('page',1);
		$rviewdmodel = Load::model('myjob_rviewd');
		$rows = $rviewdmodel->pageAll($page, 20, $url,"uid='".$this->uid."' AND status=1",'id desc');
		foreach($rows as $k=>$v){
			$v['ename'] = $this->e_user->getCompanyName($v['eid']);
			$rows[$k] = $v;
		}
		$this->assign('rows',$rows);
		$this->assign('pagetitle','简历被查看记录');
		$this->display();
	}
}
?>
