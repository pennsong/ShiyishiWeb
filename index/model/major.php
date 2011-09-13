<?php
class major_Model extends Model{
	
	function init(){
		$this->major = Load::table('major');
		$this->cache = Load::lib('cache_file');
		$this->memkey = 'major';
	}

	function find($id){
		return $this->major->find($id);
	}

	function fetchAll($where = null,$order = null,$field = null){
		return $this->major->fetchAll($where,$order,$field);
	}

	function fetchRow($where = null,$order = null){
		return $this->major->fetchRow($where,$order);
	}
	
	function getName($id){
		$info = $this->major->find($id);
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
		$row = $this->major->fetchAll(null,'parent_id asc,order_id asc,id asc');
		foreach($row as $key=>$val){
			$newdata['major'][$val['id']] = array('name'=>$val['thename'],'en'=>$val['enname']);
			if($val['parent_id']<=0){
				$newdata['major_level1'][] = array('id'=>$val['id'],'name'=>$val['thename'],'en'=>$val['enname']);
			}else{
				$newdata['major_level2'][$val['parent_id']][] = array('id'=>$val['id'],'name'=>$val['thename'],'en'=>$val['enname']);
			}
		}
		$this->cache->set('major' ,$newdata['major']);
		$this->cache->set('major_level1' ,$newdata['major_level1']);
		$this->cache->set('major_level2' ,$newdata['major_level2']);
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