<?php
class getJobTitleForSWF_Controller extends Controller{

	function init(){
		$this->myjob_int = Load::model('myjob_int');
		$this->jobs = Load::model('jobs');
	}
	
	function indexAction(){
		$aid = (int)$this->_get('aid',0);
		$uid = (int)$this->_get('uid',0);
		
		$tmpJob = $this->myjob_int->fetchRow("aid=$aid AND uid=$uid", null, "jobId");
		$tmpJobTitle = $this->jobs->getJobName($tmpJob['jobId']);
		echo $tmpJobTitle;
	}
}
?>