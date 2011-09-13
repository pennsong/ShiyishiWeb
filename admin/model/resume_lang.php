<?php
class resume_lang_Model extends Model{
	function init(){
		$this->resume_lang = Load::table('resume_lang');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume_lang->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume_lang->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume_lang->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume_lang->fetchRow($where, $order, $fields);
	}

	function save($info){
		return $this->resume_lang->save($info);
	}

	function update($info,$where=null){
		return $this->resume_lang->update($info,$where);
	}
}
?>