<?php
class resume_vod_Model extends Model{
	function init(){
		$this->resume_vod = Load::table('resume_vod');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_vod->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function pageUnionAll($page, $count, $url,$rtable,$on, $where = null, $order = null,$field=null){
		return $this->resume_vod->pageUnionAll($page, $count, $url,$rtable,$on, $where, $order,$field);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_vod->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume_vod->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_vod->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_vod->save($info);
	}

	function update($info,$where=null){
		return $this->resume_vod->update($info,$where);
	}
}
?>