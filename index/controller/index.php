<?php
class index_Controller extends Controller{
	
	function init(){
		$this->area = Load::model('area');
		$this->e_user = Load::model('e_user');
		$this->resume = Load::model('resume');
		$this->relinks = Load::model('relink');
		$this->job = Load::model('jobs');
		if(F::islogin('enterp')){
			$this->logininfo = F::logininfo("enterp");
		}
	}
	
	function indexAction()
	{
		$today_s = strtotime("today");
		$today_e = $today_s+86400;
		if($this->cityinfo){
			$cityid = $this->cityinfo['id'];
			$where = $this->cityinfo['parent_id']<0 ? "work_gnd LIKE '".$cityid.",%'" : "work_gnd LIKE '%,".$cityid."%'";
//			$resumenum = $this->resume->count($where);
			$resumenumArray = $this->resume->queryAll("select count(distinct uid) as num from zp_resume where $where");
			$resumenum = $resumenumArray[0][num];			
			//			$resumenum_t = $this->resume->count($where." AND modifydate>'".$today_s."' AND modifydate<='".$today_e."'");
			$resumenum_t = $this->resume->count($where." AND createdate > FROM_UNIXTIME($today_s) AND createdate < FROM_UNIXTIME($today_e)");
			$where = $this->cityinfo['parent_id']<0 ? "live_gnd_p = '".$cityid."'" : "live_gnd_c = '".$cityid."'";
			$jobnum = $this->job->count($where."AND status=1 AND enddate > $today_e");
			$jobnum_t = $this->job->count($where." AND createtime>'".$today_s."' AND createtime<='".$today_e."'"." AND status=1 AND enddate > $today_e");
			//热点招聘
			$hotjobs = $this->job->fetchAll($where." AND status=1 AND enddate > $today_e",'createtime DESC','id,title',6);
		}else{
			unset($_COOKIE['sys_cookie_city']);
			$zdcitys = $this->area->fetchAll("parent_id <= 0","order_id ASC",null,null);
			foreach($zdcitys as $k=>$c){
				$where = $c['parent_id']<0 ? "work_gnd LIKE '".$c['id'].",%'" : "work_gnd LIKE '".$c['id'].",%'";
				$tmpArray = $this->resume->queryAll("select count(distinct uid) as num from zp_resume where $where");
//				$c['rnum'] = $this->resume->count($where);
				$c['rnum'] = $tmpArray[0][num];
				$c['jnum'] = $this->job->count("status=1 AND live_gnd_p=".$c['id']);
				$zdcitys[$k] = $c;
			}
			$cityid = 0;
			//$resumenum_t = $this->resume->count("modifydate>'".$today_s."' AND modifydate<='".$today_e."'");
			$resumenum_t = $this->resume->count("createdate > FROM_UNIXTIME($today_s) AND createdate < FROM_UNIXTIME($today_e)");
			//$resumenum = $this->resume->count();
			$resumenumArray = $this->resume->queryAll("select count(distinct uid) as num from zp_resume");
			$resumenum = $resumenumArray[0][num];
			//$jobnum = $this->job->count("status=1 AND enddate > $today_e");
			$jobnum = $this->job->count("status=1");
			$jobnum_t = $this->job->count("createtime>'".$today_s."' AND createtime<='".$today_e."'"." AND status=1 AND enddate > $today_e");
			$this->assign('zdcitys',$zdcitys);
			//热点招聘
			//$hotjobs = $this->job->getHotJobs(6);
			$hotjobs = $this->job->fetchAll("status=1 AND enddate > $today_e",'createtime DESC','id,title');
		}
		$relinks =$this->relinks->pageAll(1,8,'','',' orid');
		foreach ($relinks as &$item) {
			$tmpCompanyInfo = $this->e_user->find($item[id]);
			$item['companyLogo'] = $tmpCompanyInfo['logo'];
			$item['companyUrl'] = BASE_URL.'/company/view/'.$item[id].'.html';
		}
		$company = $this->e_user->fetchAll(" username!='' and password!='' "," createtime desc "," id,company,logo",8);

		$this->assign('jobnum',$jobnum);
		$this->assign('resumenum',$resumenum);
		$this->assign('relinks',$relinks);
		$this->assign('jobnum_t',$jobnum_t);
		$this->assign('resumenum_t',$resumenum_t);
		$this->assign('hotjobs',$hotjobs);
		$this->assign('company',$company);
		$this->assign('pagetitle',$this->cityinfo['area_name'].'首页');
		$this->display('index.tpl');
	}
}
?>
