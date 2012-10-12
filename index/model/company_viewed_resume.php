<?php
class company_viewed_resume_Model extends Model{
	function init(){
		$this->company_viewed_resume = Load::table('company_viewed_resume');
	}

	function save($info){
		return $this->company_viewed_resume->save($info);
	}

	function count($where=null){
		return $this->company_viewed_resume->count($where);
	}

}
?>