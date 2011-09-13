<?php
class enrolllog_Model extends Model{
	
	function init(){
		$this->enrolllog = Load::table('enrolllog');
	}

	function find($id){
		return $this->enrolllog->find($id);
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->enrolllog->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchRow($where=null,$order = null,$fields=null){
		return $this->enrolllog->fetchRow($where,$order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->enrolllog->fetchAll($where, $order, $fields, $limit,$groupby);
	}
	
	function save($info){
		return $this->enrolllog->save($info);
	}

	function update($info,$where=null){
		return $this->enrolllog->update($info,$where);
	}

	function insert($info){
		return $this->enrolllog->save($info);
	}

	function check($eid,$uid){
		return $this->fetchRow("eid=$eid AND uid=$uid AND status=1");
	}

	function count($where=null){
		return $this->enrolllog->count($where);
	}
}
?>