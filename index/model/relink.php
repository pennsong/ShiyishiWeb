<?php
class relink_Model extends Model{
	
	function init(){
		$this->relink = Load::table('relink');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->relink->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->relink->find($id);
	}

	function fetchAll($where,$order=""){
		return $this->relink->fetchAll($where,$order);
	}

	function fetchRow($where,$order=""){
		return $this->relink->fetchRow($where,$order);
	}

	function remove($id){
		return $this->relink->delete($id);
	}

	function save($info){
		return $this->relink->save($info);
	}

	function update($info,$where=null){
		return $this->relink->update($info,$where);
	}

	function count($where=null){
		return $this->relink->count($where);
	}
}
?>