<?php
class jobs_template_Model extends Model{
	
	function init(){
		$this->jobs_template = Load::table('jobs_template');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->jobs_template->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->jobs_template->find($id);
	}

	function remove($id){
		return $this->jobs_template->delete($id);
	}

	function save($info){
		return $this->jobs_template->save($info);
	}

	function update($info,$where=null){
		return $this->jobs_template->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function queryAll($sql){
		return $this->jobs_template->queryAll($sql);
	}

	function fetchAll($where){
		return $this->jobs_template->fetchAll($where);
	}

	function count($where=null){
		return $this->jobs_template->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->jobs_template->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->jobs_template->fetchRow($where, $order, $fields);
	}

}
?>