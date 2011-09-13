<?php
class leader_Model extends Model{
	function init(){
		$this->leader = Load::table('leader');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->leader->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->leader->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->leader->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->leader->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->leader->save($info);
	}

	function update($info,$where=null){
		return $this->leader->update($info,$where);
	}

	function count($where=null){
		return $this->leader->count($where);
	}
}
?>