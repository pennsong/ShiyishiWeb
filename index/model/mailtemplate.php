<?php
class mailtemplate_Model extends Model{
	function init(){
		$this->mailtemplate = Load::table('mailtemplate');
	}

	function find($id){
		return $this->mailtemplate->find($id);
	}

	function fetchRow($where){
		return $this->mailtemplate->fetchRow($where);
	}
}
?>