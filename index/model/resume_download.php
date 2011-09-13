<?php
class resume_download_Model extends Model{
	
	function init(){
		$this->resume_download = Load::table('resume_download');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->resume_download->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->resume_download->find($id);
	}

	function remove($id){
		return $this->resume_download->delete($id);
	}

	function save($info){
		return $this->resume_download->save($info);
	}

	function update($info,$where=null){
		return $this->resume_download->update($info,$where);
	}

	function ismember($uid){
		$info = $this->find($uid);
		return $info['ismember'];
	}

	function queryAll($sql){
		return $this->resume_download->queryAll($sql);
	}

	function count($where=null){
		return $this->resume_download->count($where);
	}

	function checkinfo($key,$name){
		$res = $this->resume_download->fetchRow("{$key} ='".$name."'");
		if(!empty($res)){
			return false;
		}else{
			return true;
		}
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_download->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_download->fetchRow($where, $order, $fields);
	}

}
?>