<?php
class maillog_Model extends Model{
	function init(){
		$this->maillog = Load::table('maillog');
	}

	function find($id){
		return $this->maillog->find($id);
	}

	function fetchRow($where=null){
		return $this->maillog->fetchRow($where);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->maillog->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function query($sql){
		return $this->maillog->query($sql);
	}

	function save($info){
		return $this->maillog->save($info);
	}
	
	function update($info,$where=null){
		return $this->maillog->update($info,$where);
	}
}
?>