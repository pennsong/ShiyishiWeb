<?php
class jobs_Model extends Model{
	
	function init(){
		$this->jobs = Load::table('jobs');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->jobs->pageAll($page, $count, $url, $where, $order);
	}

	function pageUnionAll($page, $count, $url,$rtable,$on, $where = null, $order = null,$field=null){
		return $this->jobs->pageUnionAll($page, $count, $url,$rtable,$on, $where, $order,$field);
	}
	
	function find($id){
		return $this->jobs->find($id);
	}

	function getJobName($id){
		$id = (int)$id;
		if($id<=0)return '';
		$info = $this->find($id);
		return $info['title'];
	}

	function remove($id){
		return $this->jobs->delete($id);
	}

	function save($info){
		return $this->jobs->save($info);
	}

	function update($info,$where=null){
		return $this->jobs->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function queryAll($sql){
		return $this->jobs->queryAll($sql);
	}

	function count($where=null){
		return $this->jobs->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->jobs->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->jobs->fetchRow($where, $order, $fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->jobs->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	//获取热门职位
	function getHotJobs($num=10){
		$posmodel = Load::model('myjob_pos');
		//$where = null, $order = null,$fields=null,$limit=null,$groupby=null
		$jobs = $posmodel->fetchAll('status=1 AND job_expiry_date>'.time(),'jnum desc',"jobid,count(jobid) as jnum",$num*2,'jobid');
		$jobids = $jobrows = array();
		if(!empty($jobs)){
			$i=0;
			foreach($jobs as $job){
				$row = $this->find($job['jobid']);
				if($row['status']==1){
					if($i>=$num)break;
					$jobrows[] = $row;
					$i++;
				}
			}
		}
		return $jobrows;
	}
}
?>