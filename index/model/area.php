<?php
class area_Model extends Model{
	
	function init(){
		$this->area = Load::table('area');
		$this->cache = Load::lib('cache_file');
		$this->memkey = 'area';
	}

	function find($id){
		return $this->area->find($id);
	}

	function fetchAll($where = null,$order = null,$field = null,$limit=null){
		return $this->area->fetchAll($where,$order,$field,$limit);
	}

	function fetchRow($where = null,$order = null){
		return $this->area->fetchRow($where,$order);
	}
	
	function getName($id){
		$info = $this->area->find($id);
		return $info['area_name'];
	}
	
	function getNameEn($id){
		$info = $this->area->find($id);
		return $info['area_en'];
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
		$row = $this->area->fetchAll(null,'parent_id asc,order_id asc,id asc');
		foreach($row as $key=>$val){
			if($val['parent_id']!=0 && $val['type']>0){
				$newdata['area'][$val['id']] = array('id'=>$val['id'],'name'=>$val['area_name'],'en'=>$val['area_en'],'type'=>$val['type']);
			}
			if($val['parent_id']<=0){
				$newdata['area_province'][$val['id']] = array('id'=>$val['id'],'name'=>$val['area_name'],'en'=>$val['area_en']);
			}else{
				$newdata['area_citys'][$val['parent_id']][$val['id']] = array('id'=>$val['id'],'name'=>$val['area_name'],'en'=>$val['area_en']);
			}
		}
		$this->cache->set('area' ,$newdata['area']);
		$this->cache->set('area_province' ,$newdata['area_province']);
		$this->cache->set('area_citys' ,$newdata['area_citys']);
		if($return) return $newdata[$memkey];
	}

	function getNameByIds($ids,$limit=2){
		if(!$ids)return null;
		$tmparr = array_unique(explode(',',trim($ids,",")));
		$names = array();
		$i=1;
		foreach($tmparr as $vid){
			if($i>$limit)break;
			if($vid<=0)continue;
			$name = $this->getName($vid);
			if($name)
				$names[] = $name;
			$i++;
		}
		return implode("，",$names);
	}
	
	function getNameByIdsEn($ids,$limit=2){
		if(!$ids)return null;
		$tmparr = array_unique(explode(',',trim($ids,",")));
		$names = array();
		$i=1;
		foreach($tmparr as $vid){
			if($i>$limit)break;
			if($vid<=0)continue;
			$name = $this->getNameEn($vid);
			if($name)
				$names[] = $name;
			$i++;
		}
		return implode("，",$names);
	}
}
?>