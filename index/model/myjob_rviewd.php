<?php
class myjob_rviewd_Model extends Model{
	function init(){
		$this->myjob_rviewd = Load::table('myjob_rviewd');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->myjob_rviewd->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->myjob_rviewd->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->myjob_rviewd->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->myjob_rviewd->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->myjob_rviewd->save($info);
	}

	function update($info,$where=null){
		return $this->myjob_rviewd->update($info,$where);
	}

	function count($where=null){
		return $this->myjob_rviewd->count($where);
	}
}
?>