<?php
class mailsummary_Model extends Model{
	function init(){
		$this->mailsummary = Load::table('mailsummary');
	}

	function find($id){
		return $this->mailsummary->find($id);
	}

	function fetchRow($where=null){
		return $this->mailsummary->fetchRow($where);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->mailsummary->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function query($sql){
		return $this->mailsummary->query($sql);
	}

	function save($info){
		return $this->mailsummary->save($info);
	}
	
	function update($info,$where=null){
		return $this->mailsummary->update($info,$where);
	}
}
?>