<?php
//会员中心 简历
class resume_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->funtype=Load::model('funtype');
		$this->user = Load::model('user');
		$this->resume = Load::model('resume');
		$this->resume_ctf = Load::model('resume_ctf');
		$this->resume_it = Load::model('resume_it');
		$this->resume_work = Load::model('resume_work');
		$this->resume_lang = Load::model('resume_lang');
		$this->resume_edu = Load::model('resume_edu');
		$this->myjob_rviewd = Load::model('myjob_rviewd');
		$this->conf = Load::conf('conf');
		$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->ftdata = $this->cache->getFuntypeDatas('funtype_level1');//一级职位
		$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业
		$this->mjdata = $this->cache->getMajorDatas('major_level1');//一级专业
		$this->degrees = $this->conf['degrees'];
		$this->entrytimes = $this->conf['entrytimes'];
		$this->salarys = $this->conf['salarys'];
		$this->companytypes = $this->conf['companytypes'];
		$this->languages = $this->conf['languages'];
		$this->uid = $this->logininfo['uid'];
	}
	
	function indexAction()
	{
		$this->_forward('doc');
	}

	function docAction()
	{
		$cnresume = $enresume = array();
		$rows = $this->resume->fetchAll("uid='".$this->uid."'","rtype ASC");
		if(!empty($rows)){
			foreach($rows as $row){
				$row['modifydate'] = date('Y-m-d',$row['modifydate']);
				if($row['rtype']=='cn'){
					$cnresume = $row;
				}else{
					$enresume = $row;
				}
			}
		}
		$cnresume['views'] = $this->myjob_rviewd->count("uid=".$this->uid." AND status=1");
		$this->assign('cnresume',$cnresume);
		$this->assign('enresume',$enresume);
		$this->assign('pagetitle','我的文字简历');
		$this->display();
	}

	function vodAction()
	{
		$resume_vod = Load::model('resume_vod');
		$resume = $resume_vod->fetchRow("uid='".$this->uid."'");
		$this->assign('info',$resume);
		$this->assign('pagetitle','我的视频简历');
		$this->display();
	}

	function addAction()
	{
		if($this->_get('mobile')){
			$this->ajaxmsg($this->user->checkinfo('mobile',$this->_get('mobile')) ? 'fail' : 'success');
		}
		$rtype = trim($this->_get('rtype','cn'));
		if($rtype!='cn')$rtype='en';
		$works = $edus = $langs = $its = $ctfs = array();
		$actname = '新添';
		$resume = $this->resume->fetchRow("uid='".$this->uid."' AND rtype='".$rtype."'");

		$citydatas = $this->cache->getAreaDatas('area_citys');
		if(!empty($resume) && $resume['id']>0){
			$works = $this->resume_work->fetchAll("uid='".$this->uid."' AND rtype='".$rtype."'");
			$edus = $this->resume_edu->fetchAll("uid='".$this->uid."' AND rtype='".$rtype."'");
			$langs = $this->resume_lang->fetchAll("uid='".$this->uid."' AND rtype='".$rtype."'");
			$its = $this->resume_it->fetchAll("uid='".$this->uid."' AND rtype='".$rtype."'");
			$ctfs = $this->resume_ctf->fetchAll("uid='".$this->uid."' AND rtype='".$rtype."'");
			$actname = '更新';
			if($resume['birth_gnd']){
				$birth_gnd = explode(",",$resume['birth_gnd']);
				$resume['birth_gnd_p'] = $birth_gnd[0];
				$resume['birth_gnd_c'] = $birth_gnd[1];
				$resume['abdatas'] = $citydatas[$birth_gnd[0]];
			}
			if($resume['live_gnd']){
				$live_gnd = explode(",",$resume['live_gnd']);
				$resume['live_gnd_p'] = $live_gnd[0];
				$resume['live_gnd_c'] = $live_gnd[1];
				$resume['aldatas'] = $citydatas[$live_gnd[0]];
			}
			if($resume['speciality']){
				$submjdatas = $this->cache->getMajorDatas('major_level2');
//				$tmp = explode(",",$resume['speciality']);
//				$resume['speciality_1'] = $tmp[0];
//				$resume['speciality_2'] = $tmp[1];
				$resume['submjdatas'] = $submjdatas[$tmp[0]];
			}
			if($resume['funtype']){
				$subftdatas = $this->cache->getFuntypeDatas('funtype_level2');
				$tmp = explode(",",$resume['funtype']);
				$resume['funtype_1'] = $tmp[0];
				$resume['funtype_2'] = $tmp[1];
				$resume['subftdatas'] = $submjdatas[$tmp[0]];
			}
			if($resume['dustrytype']){
				$subdtdatas = $this->cache->getFuntypeDatas('dustrytype_level2');
				$tmp = explode(",",$resume['dustrytype']);
				$resume['dustrytype_1'] = $tmp[0];
				$resume['dustrytype_2'] = $tmp[1];
				$resume['subdtdatas'] = $subdtdatas[$tmp[0]];
			}
			if($resume['work_gnd']){
				$work_gnd = explode(",",$resume['work_gnd']);
				$resume['work_gnd_p'] = $work_gnd[0];
				$resume['work_gnd_c'] = $work_gnd[1];
				$resume['awdatas'] = $citydatas[$work_gnd[0]];
			}
		}else{
			$resume['idcard'] = $this->logininfo['idcard'];
			$resume['phone'] = $this->logininfo['phone'];
			$resume['email'] = $this->logininfo['email'];
			$resume['abdatas'] = $resume['aldatas'] = $resume['awdatas'] = $citydatas[$this->adata[1]['id']];
		}
		if(empty($works)){
			$works[] = array('to_year'=>'至今');
		}else{
			foreach($works as $k=>$row){
				$tmp = explode("-",$row['fromdate']);
				$row['from_year'] = $tmp[0];
				$row['from_month'] = $tmp[1];
				$row['from_day'] = $tmp[2];
				$tmp1 = explode("-",$row['todate']);
				$row['to_year'] = $tmp1[0];
				$row['to_month'] = $tmp1[1];
				$row['to_day'] = $tmp1[2];
				$works[$k] = $row;
			}
		}
		if(empty($edus)){
			$edus[] = array('to_year'=>'至今');
		}else{
			if(empty($submjdatas))$submjdatas = $this->cache->getMajorDatas('major_level2');
			foreach($edus as $k=>$row){
				$tmp = explode("-",$row['fromdate']);
				$row['from_year'] = $tmp[0];
				$row['from_month'] = $tmp[1];
				$row['from_day'] = $tmp[2];
				$tmp1 = explode("-",$row['todate']);
				$row['to_year'] = $tmp1[0];
				$row['to_month'] = $tmp1[1];
				$row['to_day'] = $tmp1[2];
//				$tmp2 = explode(",",$row['major']);
//				$row['major_1'] = $tmp2[0];
//				$row['major_2'] = $tmp2[1];
//				$row['major'] = $submjdatas[$tmp2[0]];
				$edus[$k] = $row;
			}
		}
		if(empty($langs)){
			$langs[] = array();
		}
		if(empty($its)){
			$its[] = array('usetime'=>6);
		}
		if(empty($ctfs)){
			$ctfs[] = array();
		}else{
			foreach($ctfs as $k=>$row){
				$tmp = explode("-",$row['awarddate']);
				$row['award_year'] = $tmp[0];
				$row['award_month'] = $tmp[1];
				$row['award_day'] = $tmp[2];
				$ctfs[$k] = $row;
			}
		}
		$funtype = $this->funtype->fetchAll('parent_id = 0');

		$this->assign('funtype', $funtype);

		$this->assign('years',F::getYears());//年
		$this->assign('months',F::getMonths());//月
		$this->assign('days',F::getDays());//日
		$this->assign('adatas',$this->adata);//省份
		$this->assign('ftdatas',$this->ftdata);//一级职位
		$this->assign('dtdatas',$this->dtdata);//一级行业
		$this->assign('mjdatas',$this->mjdata);//一级专业
		$this->assign('degrees',$this->degrees[$rtype]);
		$this->assign('entrytimes',$this->entrytimes[$rtype]);
		$this->assign('salarys',$this->salarys[$rtype]);
		$this->assign('companytypes',$this->companytypes[$rtype]);
		$this->assign('languages',$this->languages[$rtype]);
		
		$this->assign('info',$resume);
		$this->assign('works',$works);
		$this->assign('edus',$edus);
		$this->assign('its',$its);
		$this->assign('ctfs',$ctfs);
		$this->assign('langs',$langs);
		$this->assign('worknum',count($works));
		$this->assign('edunum',count($edus));
		$this->assign('itnum',count($its));
		$this->assign('ctfnum',count($ctfs));
		$this->assign('langnum',count($langs));
		$this->assign('pagetitle',$actname.($rtype=='cn' ? '中文简历' : '英文简历'));
		$this->display('resume_add'.$rtype.'.tpl');
	}
}
?>
