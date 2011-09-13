<?php
class jobs_Model extends Model{
	
	function init(){
		$this->jobs = Load::table('jobs');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->jobs->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->jobs->find($id);
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

	function getJobName($id){
		$id = (int)$id;
		if($id<=0)return '';
		$info = $this->find($id);
		return $info['title'];
	}

	function checkinfo($key,$name){
		$res = $this->jobs->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>