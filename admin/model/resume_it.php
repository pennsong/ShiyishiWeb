<?php
class resume_it_Model extends Model{
	function init(){
		$this->resume_it = Load::table('resume_it');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_it->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_it->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume_it->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_it->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_it->save($info);
	}

	function update($info,$where=null){
		return $this->resume_it->update($info,$where);
	}
}
?>