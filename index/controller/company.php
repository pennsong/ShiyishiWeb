<?php
class company_Controller extends Controller{
	
	function init(){
		if(F::islogin('enterp')){
			$this->logininfo = F::logininfo("enterp");
		}
		$this->jobs = Load::model('jobs');
		$this->e_user = Load::model('e_user');
		$this->area = Load::model('area');
		$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->ftdata = $this->cache->getFuntypeDatas('funtype_level1');//一级职位
		$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业
		$this->conf = Load::conf('conf');
		$this->companyscales = $this->conf['companyscales']['cn'];
		$this->companytypes = $this->conf['companytypes']['cn'];
		$this->companyproperties = $this->conf['companyproperties']['cn'];
	}
	
	function indexAction()
	{

	}

	function viewAction(){
		//error_reporting(E_ALL);
		$id=(int)$this->_get('id',0);
		if($id<=0){
			$this->showmsg("非法的URL",1);
		}
		$info = $this->e_user->find($id);
		if(!$info || $info['username'] == ''){
			$this->showmsg("该职位不存在","/");
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

		

		$info['proname'] = $this->area->getName($info['live_gnd_p']);
		$info['cityname'] = $this->area->getName($info['live_gnd_c']);
		$info['company_type'] = $this->companytypes[$info['company_type']];
		$info['company_scale'] = $this->companyscales[$info['company_scale']];
		$info['company_properties'] = $this->companyproperties[$info['company_properties']];

		$rows = $this->jobs->pageAll(1, 10, ''," status=1 and cid = ".$this->logininfo['uid']." ",'modifydate desc');
		$this->assign('item',$info);
		$this->assign('news',$rows);
		$this->assign('j',$j);
		$this->assign('is_company',1);
		$this->display('jobs_detail.tpl');
	}

	
}
?>
