<?php
class comment_Model extends Model{
	function init(){
		$this->comment = Load::table('comment');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->comment->pageAll($page, $count, $url, $where, $order);
	}

	function pageUnionAll($page=1, $count, $url,$rtable,$on, $where = null, $order = null,$fields=null){
		return $this->comment->pageUnionAll($page, $count, $url,$rtable,$on,$where, $order, $fields);
	}

	function find($id){
		return $this->comment->find($id);
	}

	function remove($id){
		return $this->comment->delete($id);
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