<?php
class resume_tmp_Model extends Model{
	
	function init(){
		$this->resume_tmp = Load::table('resume_tmp');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->resume_tmp->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->resume_tmp->find($id);
	}

	function remove($id){
		return $this->resume_tmp->delete($id);
	}

	function save($info){
		return $this->resume_tmp->save($info);
	}

	function update($info,$where=null){
		return $this->resume_tmp->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function queryAll($sql){
		return $this->resume_tmp->queryAll($sql);
	}

	function count($where=null){
		return $this->resume_tmp->count($where);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_tmp->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function checkinfo($key,$name){
		$res = $this->resume_tmp->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_tmp->fetchRow($where, $order, $fields);
	}
}
?>