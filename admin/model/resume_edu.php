<?php
class resume_edu_Model extends Model{
	function init(){
		$this->resume_edu = Load::table('resume_edu');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_edu->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_edu->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume_edu->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_edu->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_edu->save($info);
	}

	function update($info,$where=null){
		return $this->resume_edu->update($info,$where);
	}
}
?>