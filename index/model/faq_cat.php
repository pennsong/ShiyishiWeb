<?php
class faq_cat_Model extends Model{
	function init(){
		$this->faq_cat = Load::table('faq_cat');
	}

	function find($id){
		return $this->faq_cat->find($id);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->faq_cat->fetchAll($where, $order, $fields, $limit,$groupby);
	}
}
?>