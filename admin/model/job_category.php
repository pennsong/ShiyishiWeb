<?php
class job_category_Model extends Model{
	function init(){
		$this->job_category = Load::table('job_category');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->job_category->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->job_category->find($id);
	}

	function remove($id){
		return $this->job_category->delete($id);
	}

	function fetchRow($where){
		return $this->job_category->fetchRow($where);
	}

	function query($sql){
		return $this->job_category->query($sql);
	}

	function fetchAll($where,$order=""){
		return $this->job_category->fetchAll($where,$order);
	}
	
	function removeBy($where){
		return $this->job_category->removeBy($where);
	}

	function save($info){
		if($this->isError())
			return false;
		return $this->job_category->save($info);
	}

	function countN($where){
		return $this->job_category->count($where);
	}

}
?>