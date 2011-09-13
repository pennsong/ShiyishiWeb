<?php
class myjob_pos_Model extends Model{
	function init(){
		$this->myjob_pos = Load::table('myjob_pos');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->myjob_pos->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->myjob_pos->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->myjob_pos->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->myjob_pos->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->myjob_pos->save($info);
	}

	function update($info,$where=null){
		return $this->myjob_pos->update($info,$where);
	}

	function count($where=null){
		return $this->myjob_pos->count($where);
	}
}
?>