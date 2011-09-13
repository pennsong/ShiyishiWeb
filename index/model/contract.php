<?php
class contract_Model extends Model{
	function init(){
		$this->contract = Load::table('contract');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->contract->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->contract->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function remove($id){
		return $this->contract->delete($id);
	}

	function find($id){
		return $this->contract->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->contract->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->contract->save($info);
	}

	function queryAll($sql){
		return $this->contract->queryAll($sql);
	}

	function update($info,$where=null){
		return $this->contract->update($info,$where);
	}

	function count($where=null){
		return $this->contract->count($where);
	}


}
?>