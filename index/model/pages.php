<?php
class pages_Model extends Model{
	
	function init(){
		$this->pages = Load::table('pages');
	}
	
	function fetchRow($where){
		return $this->pages->fetchRow($where);
	}

	function find($id){
		return $this->pages->find($id);
	}

	function fetchAll($where,$order=null){
		return $this->pages->fetchAll($where, $order);
	}
}
?>