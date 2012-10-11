<?php
class jobs_Controller extends Controller{
	
	function init(){
		//$this->logininfo = F::logininfo("enterp");
		//$this->logincheck("enterp");
		//$this->uid = $this->logininfo['uid'];
		$this->jobs = Load::model('jobs');
		$this->e_user = Load::model('e_user');
		$this->area = Load::model('area');
		$this->funtype=Load::model('funtype');
		$this->subcompany = Load::model('subcompany');
		$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->ftdata = $this->cache->getFuntypeDatas('funtype_level1');//一级职位
		$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业
		$this->mjdata = $this->cache->getMajorDatas('major_level1');//一级专业
		$this->conf = Load::conf('conf');
		$this->salarys = $this->conf['salarys']['cn'];
		$this->degrees = $this->conf['degrees']['cn'];
		$this->entrytimes = $this->conf['entrytimes']['cn'];
		$this->companyscales = $this->conf['companyscales']['cn'];
		$this->companytypes = $this->conf['companytypes']['cn'];
		$this->companyproperties = $this->conf['companyproperties']['cn'];
		$this->languages = $this->conf['languages']['cn'];
		if(F::islogin('enterp')){
			$this->logininfo = F::logininfo("enterp");
		}
	}
	
	function indexAction()
	{
		$cid = (int)$this->_get('cid',$this->cityinfo['id']);
		$dt = (int)$this->_get('dt',0);
		$zhiweishuxin = (int)$this->_get('zhiweishuxin', 0);
		$ft = (int)$this->_get('ft',0);
		$jd = trim($this->_get('jd'));
		$kw = trim($this->_get('kw'));

		$url = '/jobs.html';
		$page = (int)$this->_get('page',1);
		$wheres = $urls = array();
		if($this->cityinfo){
			$cityid = $this->cityinfo['id'];
			$wheres[] = "( a.live_gnd_p=".intval($cityid)." or a.live_gnd_c=".intval($cityid)." )";
		}
		if($cid>0){
			$wheres[] = $cid>4 ? "a.live_gnd_c = $cid" : "a.live_gnd_p = $cid";
			$urls[] = 'cid='.$cid;
		}
		if($dt>0){
			$wheres[] = "a.dustrytype_2  = $dt";

			$urls[] = 'dt='.$dt;
		}
		if($ft>0){
			$wheres[] = "a.funtype_2 = $ft";
			$urls[] = 'ft='.$ft;
		}
/*		if($jd){
			$jobdate = strtotime($jd);
			if($jobdate>0){
				$wheres[] = "a.startdate <= {$jobdate} AND a.enddate>= ".($jobdate+86400)." ";
				$urls[] = 'jd='.$jd;
			}
		}*/
		//区分最近3天，最近1周，最近2周，最近1个月，所有日期
		if($jd)
		{
			$urls[] = 'jd='.$jd;
			switch ($jd)
			{
				case 1: //最近3天
					$wheres[] = "a.createtime <= ".strtotime(now)." AND a.createtime >= ".strtotime("3 days ago")." ";
					break;
				case 2: //最近1周
					$wheres[] = "a.createtime <= ".strtotime(now)." AND a.createtime >= ".strtotime("7 days ago")." ";					
					break;
				case 3: //最近2周
					$wheres[] = "a.createtime <= ".strtotime(now)." AND a.createtime >= ".strtotime("14 days ago")." ";					
					break;
				case 4: //最近1个月
					$wheres[] = "a.createtime <= ".strtotime(now)." AND a.createtime >= ".strtotime("1 month ago")." ";					
					break;
				default://所有日期
					
			}
			
		}
		
		if($kw){
			$wheres[] = "a.title LIKE '%".$kw."%'";
			$urls[] = 'kw='.$kw;
		}
		$wheres[] = "a.status=1";
		$wheres[] = "b.status=2";
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->jobs->pageUnionAll2($page, 20, $url,'e_user','a.cid=b.id',$wheres,'modifydate desc','a.cid, max(modifydate) modifydate', 'a.cid');
		foreach($rows as $k=>$v){
			$v['ename'] = $this->e_user->getCompanyName($v['cid']);
			$v['jobList'] = $this->jobs->fetchAll(" status=1 and cid = ".$v['cid']." ",'modifydate desc');
			$rows[$k] = $v;
		}
//		$rows = $this->jobs->pageUnionAll($page, 20, $url,'e_user','a.cid=b.id',$wheres,'a.id desc','a.*');
//		foreach($rows as $k=>$v){
//			$v['subcompany'] = $this->subcompany->getName($v['scid']);
//			$v['ename'] = $this->e_user->getCompanyName($v['cid']);
//			$v['proname'] = $this->area->getName($v['live_gnd_p']);
//			$v['company_properties'] = $this->companyproperties[$v['company_properties']];
//			$v['company_scale'] = $this->companyscales[$v['company_scale']];
//			$v['cityname'] = $this->area->getName($v['live_gnd_c']);
//			$v['money'] = $this->salarys[$v['money']];
//			$v['degree'] = $this->degrees[$v['degree']];
//			$v['jtext'] = F::getstr(str_replace(array("　",' '),"",strip_tags($v['jtext'])),190,'..');
//			$rows[$k] = $v;
//		}

		if($cid){
			$c = trim($this->_get('s_city'));
			$c = htmlspecialchars($c, ENT_QUOTES);
			$this->assign('c',$c);
		}

		if($dt){
			$d = trim($this->_get('s_dustrytype'));
			$d = htmlspecialchars($d, ENT_QUOTES);
			$this->assign('d',$d);
		}

		if($ft){
			$f = trim($this->_get('s_funtype'));
			$f = htmlspecialchars($f, ENT_QUOTES);
			$this->assign('f',$f);
		}
		$news = $this->jobs->fetchAll(" status=1 ",'modifydate desc', '');
		$funtype = $this->funtype->fetchAll('parent_id = 0');
		$this->assign('funtype', $funtype);
		$this->assign('news',$news);
		$this->assign('dt',$dt);
		$this->assign('zhiweishuxin', $zhiweishuxin);
		$this->assign('ft',$ft);
		$this->assign('cid',$cid);
		$this->assign('jd',$jd);
		$this->assign('kw',$kw);
		$this->assign('rows',$rows);
		$this->display('jobs.tpl');


	}

	function viewAction(){
		if ($this->_get('apply', false))
		{
			$this->logincheck();
		}
		$id=(int)$this->_get('id',0);
		if($id<=0){
			$this->showmsg("非法的URL",1);
		}
		$logininfo = F::logininfo("enterp");
		if(isset($logininfo['company'])){
			$euser = 1;
		}else{
			$euser = 0;
		}
		if($this->cityinfo){
			$cityid = $this->cityinfo['id'];
			$info = $this->jobs->fetchRow(" status=1 and id=".$id." and ( live_gnd_p=".intval($cityid)." or live_gnd_c=".intval($cityid)." )");
		}else{
			$info = $this->jobs->fetchRow(" status=1 and id=".$id);
		}

		if(!$info){
			$this->showmsg("该职位不存在","/");
		}

		//add by penn to get 公司行业
		
		$e_user_info = $this->e_user->find($info['cid']);
		if(!$e_user_info || $e_user_info['username'] == ''){
			$this->showmsg("没有对应的公司","/");
		}
		else
		{
			$info['dustrytype'] = $e_user_info['dustrytype'];
		}
		
		if(strpos($info['dustrytype'],",")===false){
		if($info['dustrytype'])
				$darray[0] = $info['dustrytype'];
		}else{
			$darray = explode(",",$info['dustrytype']);
		}

		if($darray){
			$info['dustrytype'] = "";
			foreach($this->dtdata as $k => $v){
				if(in_array($v['id'],$darray)){
					$info['dustrytype'] .= $v['name']." ";
				}
			}
		}

		$subcompany = $this->subcompany->fetchRow(" cid = ".$info['cid']." and id = ".$info['scid']);

		$info['ename'] = $this->e_user->getCompanyName($info['cid']);
		$info['proname'] = $this->area->getName($info['live_gnd_p']);
		$info['cityname'] = $this->area->getName($info['live_gnd_c']);
		$info['money'] = $this->salarys[$info['money']];
		$info['degree'] = $this->degrees[$info['degree']];
		//$info['dustrytype'] = $this->dtdata[$info['dustrytype_1']];
		$info['company_type'] = $this->companytypes[$info['company_type']];
		$info['company_scale'] = $this->companyscales[$info['company_scale']];
		$info['company_properties'] = $this->companyproperties[$info['company_properties']];
		if($info['language']<10)
			$info['language'] = "0".$info['language'];
		$info['language'] = $this->languages[$info['language']];
		$info['subcompany'] = isset($subcompany['name'])?$subcompany['name']:"无";

		//$v['jtext'] = F::getstr(str_replace(array("　",' '),"",strip_tags($v['jtext'])),268,'..');

//		$rows = $this->jobs->pageAll(1, 10, ''," status=1 and cid = ".$info['cid']." ",'modifydate desc');
		$rows = $this->jobs->fetchAll(" status=1 and cid = ".$info['cid']." ",'modifydate desc');

		$this->assign('euser',$euser);
		$this->assign('item',$info);
		$this->assign('news',$rows);
		$this->display('jobs_detail.tpl');
	}

	
}
?>
