<?php
class admit_Model extends Model{
	function init(){
		$this->admit = Load::table('admit');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->admit->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->admit->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function remove($id){
		return $this->admit->delete($id);
	}

	function find($id){
		return $this->admit->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->admit->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->admit->save($info);
	}

	function queryAll($sql){
		return $this->admit->queryAll($sql);
	}

	function update($info,$where=null){
		return $this->admit->update($info,$where);
	}

	function count($where=null){
		return $this->admit->count($where);
	}


}
?>