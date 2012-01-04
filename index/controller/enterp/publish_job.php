<?php
class publish_job_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
		$this->uid = $this->logininfo['uid'];
		$this->jobs = Load::model('jobs');
		$this->jobs_template = Load::model('jobs_template');
		$this->contract = Load::model('contract');
		$this->user = Load::model('e_user');
		$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->ftdata = $this->cache->getFuntypeDatas('funtype_level1');//一级职位
		$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业
		$this->conf = Load::conf('db');
		$this->dbpre = $this->conf['default']['prefix'];
		$this->subcompany = Load::model('subcompany');
		$this->conf = Load::conf('conf');
		$this->mjdata = $this->cache->getMajorDatas('major_level1');//一级专业
		$this->degrees = $this->conf['degrees'];
		$this->entrytimes = $this->conf['entrytimes'];
		$this->salarys = $this->conf['salarys'];
		$this->companyscales = $this->conf['companyscales'];
		$this->companytypes = $this->conf['companytypes'];
		$this->companyproperties = $this->conf['companyproperties'];
		$this->languages = $this->conf['languages'];
		$this->editor = Load::lib('editor');
	}

	function indexAction(){
		$euser = $this->user->find($this->uid);
		//print_r($euser);
		//dustrytype   company_scale company_type company_properties live_gnd_c postcode address info
		if($euser['dustrytype']=='' || $euser['company_scale']=='' || $euser['company_type']=='' || $euser['company_properties']=='' || $euser['live_gnd_c']=='' || $euser['postcode']=='' || $euser['address']=='' || $euser['info']==''){
			$this->showmsg('请先完善公司信息',BASE_URL."/enterp/company/info.html");
			exit;
		}
		//add by penn use $type to record from witch page(公司职位管理中的页面)
		$type = intval($this->_get('t'));
		$tid = intval($this->_get('tid'));
		$jid = intval($this->_get('jid'));
		if($tid || $jid){
			if($jid){
				$jobs_template = $this->jobs->fetchRow(" id = ".$jid." and cid = ".$this->uid);
				$this->assign('jid',$jid);
			}else{
				$jobs_template = $this->jobs_template->fetchRow(" id = ".$tid." and cid = ".$this->uid);
				unset($jobs_template['id']);
				$this->assign('tid',$tid);
			}
			$jobs_template['startdate'] = date('Y-m-d',$jobs_template['startdate']);
			$jobs_template['enddate'] = date('Y-m-d',$jobs_template['enddate']);
			//$jobs_template = $jobs_template[0];
			$subftdatasall = $this->cache->getFuntypeDatas('funtype_level2');
			$subdtdatasall = $this->cache->getFuntypeDatas('dustrytype_level2');
			$aldatasall = $this->cache->getAreaDatas('area_citys');
			if($jobs_template['funtype_2']>0){
				$subftdatas = $subftdatasall[$jobs_template['funtype_1']];
				$this->assign('subftdatas',$subftdatas);
			}
			if($jobs_template['dustrytype_2']>0){
				$subdtdatas = $subdtdatasall[$jobs_template['dustrytype_1']];
				$this->assign('subdtdatas',$subdtdatas);
			}

			if($jobs_template['live_gnd_c']>0){
				$aldatas = $aldatasall[$jobs_template['live_gnd_p']];
				$this->assign('aldatas',$aldatas);
			}

			$jobs_template['content'] = $this->editor->create($jobs_template['jtext']);
			$this->assign('info',$jobs_template);
		}else{
			$info['content'] = $this->editor->create();
			$info['startdate'] = date("Y-m-d");
			$info['enddate'] = date("Y-m-d",strtotime('+1 month')-86400);
			$this->assign('info',$info);
		}

		$jobstemplate = $this->jobs_template->fetchAll(" cid = ".$this->uid);
		$subcompany = $this->subcompany->fetchAll(" cid = ".$this->uid);
		$this->assign('type',$type);
		$this->assign('adatas',$this->adata);
		$this->assign('ftdatas',$this->ftdata);
		$this->assign('dtdatas',$this->dtdata);
		$this->assign('jobstemplate',$jobstemplate);
		$this->assign('subcompany',$subcompany);
		$this->assign('dustrytype',$this->dtdata);
		$this->assign('salarys',$this->salarys['cn']);
		$this->assign('degrees',$this->degrees['cn']);
		$this->assign('companyscales',$this->companyscales['cn']);
		$this->assign('companytypes',$this->companytypes['cn']);
		$this->assign('companyproperties',$this->companyproperties['cn']);
		$this->assign('languages',$this->languages['cn']);
		$this->display('publish.tpl');
	}

	function saveAction(){
		//error_reporting(E_ALL);
		$type = $this->_get('type');
		$info = $this->_get('info');
		$pnum_x = $this->_get('pnum_x',0);
		$info['jtext'] = $this->_get('content');
		$action = $this->_get('action');

		if(isset($info['pnum']) && !$info['pnum']){
			$info['pnum'] = 0;
		}

		if($pnum_x==1){
			$info['pnum'] = 0;
		}
		if(!$info['scid']){
			$info['scid'] = 0;
		}
		if(!$info['id']){
			$info['createtime'] = time();
		}
		$info['modifydate'] = time();
		$info['startdate'] = strtotime($info['startdate']);
		$info['enddate'] = strtotime($info['enddate']);
		//$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time()." and post>0 ", " enddate asc");
		$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time()." ", " enddate asc");
//		if(!isset($contract[0]['post']) || !count($contract) || $contract[0]['post']<1){
//			$str = '你的剩余发布量不足';
//			$this->showmsg($str,BASE_URL."/enterp/");
//			exit();
//		}
		if($action=='push'){
			//$info['ip'] = F::onlineip();
			//$contract = $contract[0];
			//$contract['post'] = $contract['post']-1;
			//$this->contract->save($contract);
			//if($this->contract->save($contract) === false){
			//	$this->showmsg($this->contract->getError(),1);
			//}else{
				$info['status'] = 1;
				if($this->jobs->save($info) === false){
					$this->showmsg($this->jobs->getError(),1);
				}
			//}
			$str = '职位发布成功';
		}else if($action=='save'){
			if($this->jobs_template->save($info) === false){
				$this->showmsg($this->jobs_template->getError(),1);
			}
			$str = '模板保存成功';
		}else if($action=='savejob'){
//			$info['status'] = 1;
			if($this->jobs->save($info) === false){
				$this->showmsg($this->jobs->getError(),1);
			}
			$str = '修改成功';
		}else{

		}
		if ($type != 0)
		{
			$this->showmsg($str,BASE_URL."/enterp/publish_job/list.do?t=".$type);			
		}
		else
		{
			$this->showmsg($str,BASE_URL."/enterp/");
		}
	}

	function listAction(){
		$type = $this->_get('t',1);
		$page = $this->_get('page',1);
		$sub = $this->_get('sub','');
		if($sub){
			$urls[] = 'sub='.$sub;
		}
		$urls[] = 't='.$type;
		$url = $this->getPageUrl().'/list.do';

		$url .= empty($urls) ? '' : '?'.implode('&',$urls);

		$where = " j.cid = ".$this->uid." ";
		if($sub){
			$where .= " and j.scid = ".$sub;
		}

		if($type==1){
			//发布中职位
			$where .= " and startdate <= ".time()." and ".time()." <= enddate and  status = 1 ";
		}else if($type==2){
			//即将到期职位
			$where .= " and ".time()." > enddate and  status = 1 ";
		}else if($type==3){
			//已暂停职位
			$where .= " and status = 0 ";
		}else if($type==4){
			//发布结束职位
			$where .= " and  status = -1 ";
		}else if($type==5){
			//所有职位
			$where .= "";
		}else{

		}
		$orderby = " startdate desc ";
		$sql = "select j.* , s.name as subname from ".$this->dbpre."jobs j 
		left join ".$this->dbpre."subcompany s on s.id = j.scid 
		where ".$where." order by ".$orderby ;
		$rows = $this->jobs->queryAll($sql);
		$where = str_replace("j.","",$where);
		$total = $this->jobs->count($where);
		$totalpage = @ceil($total / 25);
		$city = $this->cache->getAreaDatas('area_citys');
		$subcompany = $this->subcompany->fetchAll(" cid = ".$this->uid);
		$this->assign('jobs',$rows);
		$this->assign('url',$url);
		$this->assign('subcompany',$subcompany);
		$this->assign('city',$city);
		$this->assign('adata',$this->adata);
		$this->assign('t',$type);
		$this->assign('totalpage',$totalpage);
		$this->assign('e_user',$this->logininfo['company']);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('sub',$sub);
		$this->display('publish_list.tpl');
	}

	function tplAction(){
		$subcompany = $this->subcompany->fetchAll(" cid = ".$this->uid);
		$this->assign('subcompany',$subcompany);
		$this->assign('adatas',$this->adata);
		$this->assign('ftdatas',$this->ftdata);
		$this->assign('dtdatas',$this->dtdata);
		$this->assign('salarys',$this->salarys['cn']);
		$this->assign('degrees',$this->degrees['cn']);
		$this->assign('companyscales',$this->companyscales['cn']);
		$this->assign('companytypes',$this->companytypes['cn']);
		$this->assign('companyproperties',$this->companyproperties['cn']);
		$this->assign('languages',$this->languages['cn']);
		$this->display('tpl.tpl');
	}

	function stopAction(){
		$id = $this->_get('id',0);
		$p = intval($this->_get('p',0));
		if($p){
			$p = 1;
		}
		if($id){
			$sql = "update  ".$this->dbpre."jobs  set status = ".$p." where id = ".intval($id)." and cid = ".$this->uid  ;
			$rows = $this->jobs->queryAll($sql);
			$str = "该条职位信息操作完成";
		}else{
			$str = "参数错误";
		}
		$this->showmsg($str,BASE_URL."/enterp/publish_job/list.html");
	}

	function delAction(){
		$id = $this->_get('id',0);
		$p = intval($this->_get('p',-1));
		if($p!=-1){
			$p = 0;
		}
		if($id){
			$sql = "update  ".$this->dbpre."jobs  set status = ".$p." where id = ".intval($id)." and cid = ".$this->uid  ;
			$rows = $this->jobs->queryAll($sql);
			$str = "该条职位信息操作完成";
		}else{
			$str = "参数错误";
		}
		$this->showmsg($str,BASE_URL."/enterp/publish_job/list.html");
	}

}
?>
