<?php
class resume_Model extends Model{
	
	function init(){
		$this->resume = Load::table('resume');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->resume->pageAll($page, $count, $url, $where, $order);
	}

	function pageUnionAll($page, $count, $url,$rtable,$on, $where = null, $order = null,$field=null){
		return $this->resume->pageUnionAll($page, $count, $url,$rtable,$on, $where, $order,$field);
	}
	
	function find($id){
		return $this->resume->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume->fetchRow($where, $order, $fields);
	}

	function remove($id){
		return $this->resume->delete($id);
	}

	function save($info){
		return $this->resume->save($info);
	}

	function update($info,$where=null){
		return $this->resume->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function queryAll($sql){
		return $this->resume->queryAll($sql);
	}

	function count($where=null){
		return $this->resume->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->resume->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>