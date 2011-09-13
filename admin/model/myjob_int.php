<?php
class myjob_int_Model extends Model{
	function init(){
		$this->myjob_int = Load::table('myjob_int');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->myjob_int->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->myjob_int->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->myjob_int->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->myjob_int->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->myjob_int->save($info);
	}

	function update($info,$where=null){
		return $this->myjob_int->update($info,$where);
	}

	function count($where=null){
		return $this->myjob_int->count($where);
	}
}
?>