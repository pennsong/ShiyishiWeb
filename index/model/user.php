<?php
class user_Model extends Model{
	
	function init(){
		$this->user = Load::table('user');
	}

	function find($id){
		return $this->user->find($id);
	}

	function getEmail($id){
		$id = (int)$id;
		if($id<=0)return '';
		$info = $this->find($id);
		return $info['email'];
	}

	function fetchRow($where=null){
		return $this->user->fetchRow($where);
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->user->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->user->fetchAll($where, $order, $fields, $limit,$groupby);
	}
	
	function save($info){
		return $this->user->save($info);
	}

	function update($info,$where=null){
		return $this->user->update($info,$where);
	}

	function insert($info){
		return $this->user->save($info);
	}

	function count($where=null){
		return $this->user->count($where);
	}

	function checkuserinfo($data){
		$where = array();
		foreach($data as $key=>$val){
			$where[] = $key."='".$val."'";
		}
		return $this->user->fetchRow(implode(" AND ",$where));
	}

	function checkinfo($key,$name){
		$res = $this->user->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return $res['id'];
		}else{
			return false;
		}
	}
}
?>