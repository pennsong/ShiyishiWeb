<?php
class faq_cat_Model extends Model{
	function init(){
		$this->faq_cat = Load::table('faq_cat');
		$this->cache = Load::lib('cache','mem');
		$this->key = 'faq_cat';
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
		$rows = $this->faq_cat->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['name'];
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
		return $this->faq_cat->find($id);
	}

	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子菜单');
			return false;
		}
		if($this->faq_cat->delete($id)){
			$this->flushcache();
			return true;
		}else{
			return false;
		}
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->faq_cat->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->flushcache();
		return true;
	}

	function save($info){
		$return = $this->faq_cat->save($info);
		if($return===false){
			return false;
		}else{
			$this->flushcache();
			return true;
		}
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->children(0);
		$this->cache->set($key,$rows);
		if($return) return $rows;
	}

	function getName($id){
		$info = $this->find($id);
		return $info['name'];
	}
}
?>