<?php
class subcompany_Model extends Model{
	function init(){
		$this->subcompany = Load::table('subcompany');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->subcompany->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->subcompany->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function remove($id){
		return $this->subcompany->delete($id);
	}

	function find($id){
		return $this->subcompany->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->subcompany->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->subcompany->save($info);
	}

	function queryAll($sql){
		return $this->subcompany->queryAll($sql);
	}

	function update($info,$where=null){
		return $this->subcompany->update($info,$where);
	}

	function count($where=null){
		return $this->subcompany->count($where);
	}

	function getName($id){
		$info = $this->subcompany->find($id);
		return $info['name'];
	}

}
?>