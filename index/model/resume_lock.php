<?php
class resume_lock_Model extends Model{
	function init(){
		$this->resume_lock = Load::table('resume_lock');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_lock->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_lock->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function remove($id){
		return $this->resume_lock->delete($id);
	}

	function find($id){
		return $this->resume_lock->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_lock->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_lock->save($info);
	}

	function queryAll($sql){
		return $this->resume_lock->queryAll($sql);
	}

	function update($info,$where=null){
		return $this->resume_lock->update($info,$where);
	}

	function count($where=null){
		return $this->resume_lock->count($where);
	}


}
?>