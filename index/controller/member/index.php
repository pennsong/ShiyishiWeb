<?php
//会员中心 首页
class index_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
		$this->resume = Load::model('resume');
		$this->myjob_pos = Load::model('myjob_pos');
		$this->myjob_int = Load::model('myjob_int');
		$this->myjob_rviewd = Load::model('myjob_rviewd');
		$this->enrolllog = Load::model('enrolllog');
		$this->config = Load::model('config');
	}
	
	function indexAction()
	{
		$uid = $this->logininfo['uid'];
		$myinfo = $this->user->find($uid);

		$cnresume = $enresume = array();
		$rows = $this->resume->fetchAll("uid='".$uid."'","rtype ASC");
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
		$resume_vod = Load::model('resume_vod');
		$vodresume = $resume_vod->fetchRow("uid='".$uid."'");
		
		$hadlq = 0;
		//判断是否录用
		$check = $this->enrolllog->fetchRow("uid = ".$uid,'id desc');
		if($check&&$check['status']==1){
			$lqtime = strtotime($check['createdate']);
			if(time() - $lqtime < 30*86400){
				$hadlq = 1;
				if($this->logininfo['resume_status']!=2){
					$this->user->update(array('id'=>$uid,'resume_status'=>2,'eid'=>$check['eid'],'edatetime'=>$lqtime));
					F::setlogininfo('resume_status',2);
				}
			}
		}

		$this->assign('hadlq',$hadlq);

		$posnum = $this->myjob_pos->count("uid=".$uid." AND status=1");
		$posnum_e = $this->myjob_pos->count("uid=".$uid." AND status=1 AND job_expiry_date<".time());
		$intnum = $this->myjob_int->count("uid=".$uid." AND status=1");
		$intnum_n = $this->myjob_int->count("uid=".$uid." AND status=1 AND isnew=1");
		$viewdnum = $this->myjob_rviewd->count("uid=".$uid." AND status=1");
		$web = $this->config->find(1);

		$this->assign('web',$web);
		$this->assign('cnresume',$cnresume);
		$this->assign('enresume',$enresume);
		$this->assign('vodresume',$vodresume);
		$this->assign('posnum',$posnum);
		$this->assign('posnum_e',$posnum_e);
		$this->assign('intnum',$intnum);
		$this->assign('intnum_n',$intnum_n);
		$this->assign('viewdnum',$viewdnum);
		
		$this->assign('pagetitle','用户中心首页');
		$this->assign('myinfo',$myinfo);
		$this->display();
	}
}
?>
