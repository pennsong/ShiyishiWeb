<?php
class app_video_interview_mans_Model extends Model{
	
	function init(){
		$this->app_video_interview_mans = Load::table('app_video_interview_mans');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->app_video_interview_mans->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->app_video_interview_mans->fetchAll($where, $order, $fields, $limit,$groupby);
	}
	
	function find($id){
		return $this->app_video_interview_mans->find($id);
	}

	function remove($id){
		return $this->app_video_interview_mans->delete($id);
	}

	function save($info){
		return $this->app_video_interview_mans->save($info);
	}

	function update($info,$where=null){
		return $this->app_video_interview_mans->update($info,$where);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->app_video_interview_mans->fetchRow($where, $order, $fields);
	}

	function queryAll($sql){
		return $this->app_video_interview_mans->queryAll($sql);
	}

	function count($where=null){
		return $this->app_video_interview_mans->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->app_video_interview_mans->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>