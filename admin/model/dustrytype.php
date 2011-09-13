<?php
//行业
class dustrytype_Model extends Model{
	protected $_parent = array();
	
	function init(){
		$this->dustrytype = Load::table('dustrytype');
		$this->cache = Load::lib('cache_file');
		$this->memkey = 'dustrytype';
	}

	/*
	$type=1 一维数组， $type=2 多维数组
	*/
	function children($parentid, $maxdepth = 0, $type = 1, $depth = 1, $all = array()){
		if($maxdepth > 0 && $depth > $maxdepth){
			return $all;
		}
		$pre_name = '';
		for($i=1;$i < $depth;$i++){
			if($i == 1){
				$pre_name = '&nbsp; |--';
				continue;
			}
			$pre_name = '&nbsp; | &nbsp;'.$pre_name;
		}
		$depth++;
		$rows = $this->dustrytype->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['thename'];
			if($type == 1){
				$all[$row['id']] = $row;
				$all = $this->children($row['id'], $maxdepth, $type, $depth, $all);
			}else{
				$row['children'] = $this->children($row['id'], $maxdepth, $type, $depth);
				$all[$row['id']] = $row;
			}
		}
		return $all;
	}

	function all(){
		$rows = $this->children(0);
		return $rows;
	}

	function find($id){
		return $this->dustrytype->find($id);
	}

	function getName($id){
		$info = $this->find($id);
		return $info['thename'];
	}

	function fetchAll($where = null, $order = null, $fields = null, $limit=null,$groupby = null){
		return $this->dustrytype->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function fetchRow($where = null, $order = null){
		return $this->dustrytype->fetchRow($where, $order);
	}
	
	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子类别');
			return false;
		}
		$return = $this->dustrytype->delete($id);
		$this->flushcache();
		return $return;
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->dustrytype->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->flushcache();
		return true;
	}

	function update($info){
		return $this->dustrytype->update($info);
	}

	function save($info){
		$return = $this->dustrytype->save($info);
		$this->flushcache();
		return $return;
	}
	
	function _get_parent($id){
		$rs = $this->find($id);
		if(is_array($rs)){
			$this->_parent[] =$rs;
		}else {
			return false;
		}	
		if($rs['parent_id']){
			$this->_get_parent($rs['parent_id']);
		}
		asort($this->_parent);
		return $this->_parent;
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
}
?>