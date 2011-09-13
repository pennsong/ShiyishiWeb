<?php
class news_cat_Model extends Model{
	function init(){
		$this->news_cat = Load::table('news_cat');
		$this->cache = Load::lib('cache','file');
		$this->key = 'news_cat';
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
		$rows = $this->news_cat->findBy($parentid, 'parent_id');
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
		return $this->news_cat->find($id);
	}

	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子菜单');
			return false;
		}
		if($this->news_cat->delete($id)){
			$this->flushcache();
			return true;
		}else{
			return false;
		}
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->news_cat->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->flushcache();
		return true;
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}
		if(isset($info['name'])){
			if(!$info['name']){
				$this->setError('分类名字不能为空');
			}
		}

		if($this->isError())
			return false;

		$this->flushcache();
		setcookie('formhash', '', -86400, '/');
		return $this->news_cat->save($info);
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
	}

	function fetchAll($where = null, $order = null, $fields = null, $limit=null,$groupby = null){
		return $this->news_cat->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->fetchAll(null,'order_id asc');
		foreach($rows as $val){
			$news[$key][$val['id']] = $val['name'];
			if($val['parent_id']==0){
				$news['news_cat_one'][] = $val;
			}else{
				$news['news_cat_two'][$val['parent_id']][] = $val;
			}
		}
		$this->cache->set($key,$news[$key]);
		$this->cache->set('news_cat_one',$news['news_cat_one']);
		$this->cache->set('news_cat_two',$news['news_cat_two']);
		if($return) return $news[$key];
	}

	function getName($id){
		$info = $this->find($id);
		return $info['name'];
	}
}
?>