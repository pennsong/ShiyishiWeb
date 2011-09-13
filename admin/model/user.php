<?php
class user_Model extends Model{
	
	function init(){
		$this->user = Load::table('user');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->user->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->user->find($id);
	}

	function remove($id){
		return $this->user->delete($id);
	}

	function save($info){
		return $this->user->save($info);
	}

	function update($info,$where=null){
		return $this->user->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function count($where=null){
		return $this->user->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->user->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>