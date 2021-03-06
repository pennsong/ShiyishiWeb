<?php
class e_user_Model extends Model{
	
	function init(){
		$this->e_user = Load::table('e_user');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->e_user->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->e_user->find($id);
	}

	function getCompanyName($id){
		$id = (int)$id;
		if($id<=0)return '';
		$info = $this->find($id);
		return $info['company'];
	}

	function fetchAll($where = null,$order = null,$field = null,$limit=null){
		return $this->e_user->fetchAll($where,$order,$field,$limit);
	}

	function remove($id){
		return $this->e_user->delete($id);
	}

	function save($info){
		return $this->e_user->save($info);
	}

	function update($info,$where=null){
		return $this->e_user->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function count($where=null){
		return $this->e_user->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->e_user->fetchRow("{$key} ='".$name."'");
		return $res;
	}

	function fetchRow($where=null){
		return $this->e_user->fetchRow($where);
	}

}
?>