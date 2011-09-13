<?php
class app_video_interview_Model extends Model{
	
	function init(){
		$this->app_video_interview = Load::table('app_video_interview');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->app_video_interview->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->app_video_interview->fetchAll($where, $order, $fields, $limit,$groupby);
	}	

	function find($id){
		return $this->app_video_interview->find($id);
	}

	function remove($id){
		return $this->app_video_interview->delete($id);
	}

	function save($info){
		return $this->app_video_interview->save($info);
	}

	function update($info,$where=null){
		return $this->app_video_interview->update($info,$where);
	}

	function fetchRow($where=null){
		return $this->app_video_interview->fetchRow($where);
	}

	function queryAll($sql){
		return $this->app_video_interview->queryAll($sql);
	}

	function count($where=null){
		return $this->app_video_interview->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->app_video_interview->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>