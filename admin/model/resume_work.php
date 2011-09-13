<?php
class resume_work_Model extends Model{
	function init(){
		$this->resume_work = Load::table('resume_work');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_work->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_work->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume_work->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_work->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_work->save($info);
	}

	function update($info,$where=null){
		return $this->resume_work->update($info,$where);
	}
}
?>