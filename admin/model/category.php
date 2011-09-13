<?php
class category_Model extends Model{
	protected $_parent = array();
	function init(){
		$this->cat = Load::table('category');
		$this->cache = Load::lib('cache_file');
		$this->mem = Load::lib('cache','mem');
		$this->memkey = 'categorys';
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
		$rows = $this->cat->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['cat_name'];
			$row['citys'] = $this->getcitynames(explode(',',trim($row['cityids'],',')));
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
		return $this->cat->find($id);
	}

	function fetchRow($where,$order=null){
		return $this->cat->fetchRow($where,$order);
	}

	function fetchAll($where = null, $order = null, $fields = null, $limit=null,$groupby = null){
		return $this->cat->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子分类');
			return false;
		}
		$return = $this->cat->delete($id);
		$this->flushcache();
		return $return;
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->cat->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->flushcache();
		return true;
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if(!$info['cat_name']){
			$this->setError('分类中文名字不能为空');
		}

		if(!$info['cat_en']){
			$this->setError('分类英文名字不能为空');
		}

		if($this->isError())
			return false;

		setcookie('formhash', '', -86400, '/');
		$return = $this->cat->save($info);
		$this->flushcache();
		return $return;
	}

	function _get_parent($id,$child_id=0){
		$rs = $this->find($id);
		if(is_array($rs)){
			$rs['child_id'] = $child_id;
			$this->_parent[] =$rs;
		}else {
			return false;
		}	
		if($rs['parent_id']){
			$this->_get_parent($rs['parent_id'],$id);
		}
		asort($this->_parent);
		return $this->_parent;
	}

	function update($info){
		return $this->cat->update($info);
	}

	function query($sql){
		return $this->cat->query($sql);
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
		$row = $this->cat->fetchAll('active=1','level asc,order_id asc');
		foreach($row as $key=>$val){
			$tcat = array();
			$newdata[$this->memkey][$val['id']] = array('en'=>$val['cat_en'],'name'=>$val['cat_name']);
			if($val['level']=='1'){
				$tkey = $val['id'];
				$cat[$val['id']]['data'] = $tcat = array('id'=>$val['id'],'en'=>$val['cat_en'],'name'=>$val['cat_name']);
			}
			if($val['level']=='2'){
				$tkey = $val['parent_id'];
				$cat[$val['parent_id']]['child'][$val['id']] = $tcat = array('id'=>$val['id'],'en'=>$val['cat_en'],'name'=>$val['cat_name']);
			}
			
			$tmparr = explode(",",trim($val['cityids'],","));
			foreach($tmparr as $aid){
				if($val['level']=='1'){
					$newdata['cat_trees'][$aid][$tkey]['data'] = $tcat;
				}else{
					$newdata['cat_trees'][$aid][$tkey]['child'][$val['id']] = $tcat;
				}
			}
		}
		$newdata['cat_all'] = $cat;
		$this->cache->set($this->memkey ,$newdata[$this->memkey]);
		$this->cache->set('cat_all' ,$newdata['cat_all']);
		$this->cache->set('cat_trees' ,$newdata['cat_trees']);

		if($return) return $newdata[$memkey];
	}

	function getAreaDatas($key='area'){
		if(!$data = $this->cache->get($key)){
			$model = Load::model('area');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getcitynames($cityids,$citys=array()){
		if(empty($citys))
			$citys = $this->getAreaDatas();
		$str = '';
		foreach($cityids as $k=>$v){
			$str .= $citys[$v]['name'].' ';
		}
		return $str;
	}
}
?>