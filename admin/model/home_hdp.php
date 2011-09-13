<?php
class home_hdp_Model extends Model{
	function init(){
		$this->home_hdp = Load::table('home_hdp');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->home_hdp->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->home_hdp->find($id);
	}

	function remove($id){
		return $this->home_hdp->delete($id);
	}

	function fetchRow($where){
		return $this->home_hdp->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->home_hdp->removeBy($where);
	}

	function save($info){
		return $this->home_hdp->save($info);
	}
}
?>