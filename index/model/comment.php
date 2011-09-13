<?php
class comment_Model extends Model{
	function init(){
		$this->comment = Load::table('comment');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->comment->pageAll($page, $count, $url, $where, $order);
	}

	function fetchUnionAll($rtable,$on, $where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->comment->fetchUnionAll($rtable,$on,$where, $order, $fields, $limit,$groupby);
	}

	function find($id){
		return $this->comment->find($id);
	}

	function remove($id){
		return $this->comment->delete($id);
	}
	
	function count($where=null){
		return $this->comment->count($where);
	}

	function fetchRow($where){
		return $this->comment->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->comment->removeBy($where);
	}

	function save($info){
		return $this->comment->save($info);
	}

	function update($info,$where=null){
		return $this->comment->update($info,$where);
	}
}
?>