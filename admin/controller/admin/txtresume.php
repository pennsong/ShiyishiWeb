<?php

class txtresume_Controller extends Controller{

	function init(){
		$this->conf_db = Load::conf('db');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->resume = Load::model('resume');
		$this->area = Load::model('area');
		$this->conf = Load::conf('conf');
		$this->degrees = $this->conf['degrees'];
		$this->majors = $this->cache->getMajorDatas('major');
		$this->major = Load::model('major');
		$this->resume_work = Load::model('resume_work');
		$this->resume_ctf = Load::model('resume_ctf');
		$this->resume_it = Load::model('resume_it');
		$this->resume_lang = Load::model('resume_lang');
		$this->resume_edu = Load::model('resume_edu');
		$this->salarys = $this->conf['salarys'];
		$this->companytypes = $this->conf['companytypes'];
		$this->mtype = $this->getControllerUName();
		$this->languages = $this->conf['languages'];
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['uid'] = intval($this->_get('uid'));
		$s['uname'] = trim($this->_get('uname'));
		$s['rtype'] = $this->_get('rtype','cn');
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		//get filter condition
		$con = $this->_get('con');
		if ($con == 'qz')
		{
			$wheres[] = "a.status = 1";
		}
		else if ($con == 'mdr')
		{
			$wheres[] = "a.status = 0";			
		}
		else if ($con == 'ylq')
		{
			$wheres[] = "exists (select * from ".$this->dbpre."enrolllog c where c.status = 1 and uid = a.uid)";
		}
		
		$sdate = 'a.modifydate';
		$orderby = 'a.id DESC';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='uname'){
				$wheres[] = "a.".$key." LIKE '%".$val."%'";
			}elseif($key=='s_date'){
				$wheres[] = $sdate." >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = $sdate." <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "a.".$key." = '$val'";
			}
		}

		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->resume->pageUnionAll($page, 20, $url,'user','a.uid=b.id',$wheres,$orderby,'a.*');
		foreach($rows as $k=>$v){
			if($v['live_gnd']){
				$tmp = explode(",",$v['live_gnd']);
				$v['live_gnd_name'] = $this->area->getName($tmp[0]).($tmp[1] ? '-'.$this->area->getName($tmp[1]) : '');
			}else{
				$v['live_gnd_name'] = '保密';
			}
			$v['degree'] = $v['degree'] ? $this->degrees[$v['rtype']][$v['degree']] : '保密';
			if($v['speciality']){
				//$tmp1 = explode(",",$v['speciality']);
				//$v['speciality_name'] = $this->majors[$tmp[0]]['name'].($tmp[1] ? '-'.$this->majors[$tmp[1]]['name'] : '');
				$v['speciality_name'] = $v['speciality'];
			}else{
				$v['speciality_name'] = '保密';
			}
			$rows[$k] = $v;
		}
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->display('txtresume_list.tpl');
	}

	function viewAction(){
		$id = (int)$this->_get('id',0);
		$uid = (int)$this->_get('uid',0);
		$rtype = $this->_get('t','cn');
		if($id>0){
			$resume = $this->resume->fetchRow("id = ".$id );
			$rtype = $resume['rtype'];
		}elseif($uid>0){
			$resume = $this->resume->fetchRow(" rtype='".$rtype."' and uid = ".$uid );
		}else{
			$resume = array();
		}

		if($resume && $resume['uid']>0){
			$works = $this->resume_work->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$edus = $this->resume_edu->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$langs = $this->resume_lang->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$its = $this->resume_it->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");
			$ctfs = $this->resume_ctf->fetchAll("uid='".$resume['uid']."' AND rtype='".$rtype."'");

			$citydatas = $this->cache->getAreaDatas('area_citys');


			if($resume['speciality']){
//				$submjdatas = $this->cache->getMajorDatas('major_level2');
//				$tmp = explode(",",$resume['speciality']);
//				$resume['speciality_1_name'] = $this->mjdata[$tmp[0]]['name'];
//				$resume['speciality_1'] = $tmp[0];
//				$resume['speciality_2'] = $tmp[1];
//				foreach($submjdatas[$tmp[0]] as $k => $v){
//					if($v['id'] == $tmp[1])
//						$resume['speciality_2_name'] = $v['name'];
//				}
				$resume['speciality_1_name'] = $resume['speciality'];
				$resume['speciality_2_name'] = '';
			}
			if($resume['funtype']){
				//$resume['funtype_name'] = $this->funtype->getNameByIds($resume['funtype']);
				$subftdatas = $this->cache->getFuntypeDatas('funtype_level2');
				$tmp = explode(",",$resume['funtype']);
				$resume['funtype_1'] = $tmp[0];
				$resume['funtype_2'] = $tmp[1];
				$resume['funtype_1_name'] = $this->ftdata[$tmp[0]]['name'];
				if(!empty($subftdatas[$tmp[0]])){
					foreach($subftdatas[$tmp[0]] as $k => $v){
						if($v['id'] == $tmp[1])
							$resume['funtype_2_name'] = $v['name'];
					}
				}
				$topftdatas = $this->cache->getFuntypeDatas('funtype_level1');
				foreach($topftdatas as $k => $v){
					if($v['id'] == $tmp[0])
						$resume['funtype_1_name'] = $v['name'];
				}				
				
			}
			if($resume['dustrytype']){
				$subdtdatas = $this->cache->getFuntypeDatas('dustrytype_level2');
				$tmp = explode(",",$resume['dustrytype']);
				$resume['dustrytype_1_name'] = $this->dtdata[$tmp[0]]['name'];
				$resume['dustrytype_1'] = $tmp[0];
				$resume['dustrytype_2'] = $tmp[1];
				foreach($subdtdatas[$tmp[0]] as $k => $v){
					if($v['id'] == $tmp[1])
						$resume['dustrytype_2_name'] = $v['name'];
				}
			}

			$resume['birth_gnd_name'] = $this->area->getNameByIds($resume['birth_gnd']);
			$resume['live_gnd_name'] = $this->area->getNameByIds($resume['live_gnd']);

			$resume['work_gnd_name'] = $this->area->getNameByIds($resume['work_gnd']);
			
			if(empty($works)){
				$works = array();
			}else{
				$tmp = array();
				foreach($works as $k=>$row){
					//$tmp[] = $row['fromdate']." - ".$row['todate']."  ".$row['company']." ".$row['position']." ".$this->companytypes[$rtype][$row['companytype']]." ".$this->salarys[$rtype][$row['income']]." ".$row['responsiblity'];
					$tmp[] = '<tr><td align="center" width=200px>'.$row['fromdate'].' - '.$row['todate'].' </td><td>'.$row['company'].'</td></tr><tr><td align="center">&nbsp;</td><td>'.$row['position'].'</td></tr><tr><td align="center">&nbsp;</td><td>'.$this->companytypes[$rtype][$row['companytype']].'</td></tr><tr><td align="center">&nbsp;</td><td>'.$row['responsiblity'].'</td></tr><tr><td colspan="2" align="center">&nbsp;</td></tr>';

				}
				$works = $tmp;
			}

			if(empty($edus)){
				$edus = array();
			}else{
				$tmp = array();
				foreach($edus as $k=>$row){
					$tmp[] = $row['fromdate']." - ".$row['todate']."  ".$row['schoolname']." ".$row['major']." ".$this->degrees[$rtype][$row['degree']];
				}
				$edus = $tmp;
			}

			if(empty($langs)){
				$langs = array();
			}else{

			}

			if(empty($its)){
				$its = array();
			}else{
				$tmp = array();
				foreach($its as $k=>$row){
					$tmp[] = $row['skillname'] ." ".$row['ability']." ".$row['usetime']."月";
				}
				$its = $tmp;
			}

			if(empty($ctfs)){
				$ctfs = array();
			}else{
				$tmp = array();
				foreach($ctfs as $k=>$row){
					$tmp[] = $row['awarddate'] ." ".$row['ctfname']." ".$row['awardorg'];
				}
				$ctfs = $tmp;
			}

			$this->assign('info',$resume);
			$this->assign('works',$works);
			$this->assign('edus',$edus);
			$this->assign('its',$its);
			$this->assign('ctfs',$ctfs);
			$this->assign('langs',$langs);
			$this->assign('languages',$this->languages[$rtype]);
			$this->assign('down',$down);
			$this->assign('worknum',count($works));
			$this->assign('edunum',count($edus));
			$this->assign('itnum',count($its));
			$this->assign('ctfnum',count($ctfs));
			$this->assign('langnum',count($langs));
			$this->display('txtresume_view.tpl');
		}else{
			if($id>0){
				$this->showmsg('查看简历ID错误',1);
			}else{
				$tn = $rtype=='cn' ? '中文' : '英文';
				$this->showmsg('该用户还没有'.$tn.'简历',1);
			}
		}
	}
}
?>