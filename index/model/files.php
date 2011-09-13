<?php
class files_Model extends Model{
	function init(){
		$this->files = Load::table('files');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->files->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->files->find($id);
	}
	
	function all(){		
		return $this->files->fetchAll();
	}

	function getfiles($where=null){
		if(!$where)return array();
		$rows = $this->files->fetchAll($where);
		if(empty($rows))return array();
		foreach($rows as $key=>$val){
			$val['file_small'] = unserialize($val['file_small']);
			$rows[$key] = $val;
		}
		return $rows;
	}
}
?>