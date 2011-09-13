<?php
class dustrytype_Model extends Model{
	
	function init(){
		$this->dustrytype = Load::table('dustrytype');
		$this->cache = Load::lib('cache_file');
		$this->memkey = 'dustrytype';
	}

	function find($id){
		return $this->dustrytype->find($id);
	}

	function fetchAll($where = null,$order = null,$field = null){
		return $this->dustrytype->fetchAll($where,$order,$field);
	}

	function fetchRow($where = null,$order = null){
		return $this->dustrytype->fetchRow($where,$order);
	}
	
	function getName($id){
		$info = $this->dustrytype->find($id);
		return $info['thename'];
	}

	function getcache($key){
		if(!$key) $key = $this->memkey;
		if(!$row = $this->cache->get($key)){
			$row = $this->flushcache($key,true);
		}
		return $row;
	}

	function flushcache($memkey='',$return=false){
		if(!$memkey) $memkey = $this->memkey;
		$newdata = array();
		$row = $this->dustrytype->fetchAll(null,'parent_id asc,order_id asc,id asc');
		foreach($row as $key=>$val){
			$newdata['dustrytype'][$val['id']] = array('name'=>$val['thename'],'en'=>$val['enname']);
			if($val['parent_id']<=0){
				$newdata['dustrytype_level1'][] = array('id'=>$val['id'],'name'=>$val['thename'],'en'=>$val['enname']);
			}else{
				$newdata['dustrytype_level2'][$val['parent_id']][] = array('id'=>$val['id'],'name'=>$val['thename'],'en'=>$val['enname']);
			}
		}
		$this->cache->set('dustrytype' ,$newdata['dustrytype']);
		$this->cache->set('dustrytype_level1' ,$newdata['dustrytype_level1']);
		$this->cache->set('dustrytype_level2' ,$newdata['dustrytype_level2']);
		if($return) return $newdata[$memkey];
	}

	function getNameByIds($ids,$limit=2){
		if(!$ids)return null;
		$tmparr = array_unique(explode(',',trim($ids,",")));
		$names = array();
		$vdatas = $this->getcache();
		$i=1;
		foreach($tmparr as $vid){
			if($i>$limit)break;
			$names[] = $vdatas[$vid]['name'];
			$i++;
		}
		return implode("，",$names);
	}
}
?>