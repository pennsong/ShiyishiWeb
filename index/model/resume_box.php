<?php
class resume_box_Model extends Model{
	
	function init(){
		$this->resume_box = Load::table('resume_box');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->resume_box->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_box->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function find($id){
		return $this->resume_box->find($id);
	}

	function remove($id){
		return $this->resume_box->delete($id);
	}

	function save($info){
		return $this->resume_box->save($info);
	}

	function update($info,$where=null){
		return $this->resume_box->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function queryAll($sql){
		return $this->resume_box->queryAll($sql);
	}

	function count($where=null){
		return $this->resume_box->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->resume_box->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>