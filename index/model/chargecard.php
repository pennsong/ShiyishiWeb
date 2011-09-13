<?php
class chargecard_Model extends Model{
	function init(){
		$this->chargecard = Load::table('chargecard');
	}

	function find($id){
		return $this->chargecard->find($id);
	}

	function fetchRow($where,$order=null,$field='*'){
		return $this->chargecard->fetchRow($where,$order,$field);
	}
	
	function update($info,$where=null){
		return $this->chargecard->update($info,$where);
	}
}
?>