<?php
class resume_ctf_Model extends Model{
	function init(){
		$this->resume_ctf = Load::table('resume_ctf');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_ctf->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_ctf->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume_ctf->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_ctf->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_ctf->save($info);
	}

	function update($info,$where=null){
		return $this->resume_ctf->update($info,$where);
	}

	function removeBy($where){
		return $this->resume_ctf->removeBy($where);
	}
}
?>