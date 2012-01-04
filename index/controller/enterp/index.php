<?php
class index_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
		$this->uid = $this->logininfo['uid'];
		$this->jobs = Load::model('jobs');
		$this->resume_box = Load::model('resume_box');
		$this->contract = Load::model('contract');
	}
	
	function indexAction()
	{
		$subftdatas = $this->cache->getFuntypeDatas('funtype_level2');
		//print_r($subftdatas);
		$currentTime = time();
		$jnum = $this->jobs->count("status = 1 and startdate <= $currentTime and enddate >= $currentTime and cid = ".$this->uid);

		$rnum = $this->resume_box->count("posttime >= '".strtotime("-3 day")."' and cid = ".$this->uid);

		$rnumall = $this->resume_box->count(" cid = ".$this->uid. " and status = 1");

		$cnum = $this->contract->count("enddate > ".time()." and uid = ".$this->uid);

		$contract_time = $this->contract->fetchRow("enddate > ".time()." and uid = ".$this->uid," enddate desc");

		$dvnum=0;
		$dwnum=0;
		/*
		$contracts = $this->contract->fetchAll("enddate > ".time()," enddate desc");
		if($contracts){
			foreach($contracts  as $k => $v){
				$dvnum+=$v['video'];
				$dwnum+=$v['word'];
			}
		}
		*/

		$contract = $this->contract->fetchAll(" uid = ".$this->uid." and enddate >= ".time()."  ", " enddate asc"," sum(word) as w ,sum(video) as v,sum(post) as p ");

		$dvnum=$contract[0]['v'];
		$dwnum=$contract[0]['w'];
		$pwnum=$contract[0]['p'];

		$resume['funtype_1'] = $tmp[0];
		$resume['funtype_2'] = $tmp[1];
		$resume['subftdatas'] = $submjdatas[$tmp[0]];



		$this->assign('dvnum',$dvnum);
		$this->assign('dwnum',$dwnum);
		$this->assign('jnum',$jnum);
		$this->assign('rnum',$rnum);
		$this->assign('cnum',$cnum);
		$this->assign('pwnum',$pwnum);
		$this->assign('cmaxtime',date("Y-m-d",$contract_time['enddate']));
		$this->assign('rnumall',$rnumall);

		$this->display('index.tpl');
	}

	function forgetAction()
	{
		$this->display('forget.tpl');
	}
}
?>
