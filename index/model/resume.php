<?php
class resume_Model extends Model{
	function init(){
		$this->resume = Load::table('resume');
	}

	function pageAll($page, $count, $url, $where = null, $order = null,$fields=null){
		return $this->resume->pageAll($page, $count, $url, $where, $order,$fields);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->resume->fetchAll($where, $order, $fields, $limit,$groupby);
	}


	function find($id){
		return $this->resume->find($id);
	}

	function fetchRow($where, $order = null,$fields=null){
		return $this->resume->fetchRow($where, $order, $fields);
	}

	function getUname($uid=0,$rtype=null){
		if($uid<=0)return '';
		if($rtype && in_array($rtype,array('cn','en'))){
			$info = $this->fetchRow("uid=".$uid." AND rtype='".$rtype."'");
		}else{
			$info = $this->fetchRow("uid=".$uid." AND rtype='cn'");
			if(!$info){
				$info = $this->fetchRow("uid=".$uid." AND rtype='en'");
			}
		}
		return $info ? $info['uname'] : '';
	}

	function save($info){
		return $this->resume->save($info);
	}

	function queryAll($sql){
		return $this->resume->queryAll($sql);
	}

	function update($info,$where=null){
		return $this->resume->update($info,$where);
	}

	function count($where=null){
		return $this->resume->count($where);
	}
}
?>