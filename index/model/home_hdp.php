<?php
class home_hdp_Model extends Model{
	function init(){
		$this->home_hdp = Load::table('home_hdp');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->home_hdp->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->home_hdp->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function find($id){
		return $this->home_hdp->find($id);
	}

	function fetchRow($where){
		return $this->home_hdp->fetchRow($where);
	}
}
?>