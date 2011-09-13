<?php
class p_user_Model extends Model{
	
	function init(){
		$this->p_user = Load::table('p_user');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->p_user->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->p_user->find($id);
	}

	function remove($id){
		return $this->p_user->delete($id);
	}

	function save($info){
		return $this->p_user->save($info);
	}

	function update($info,$where=null){
		return $this->p_user->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function count($where=null){
		return $this->p_user->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->p_user->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}
}
?>