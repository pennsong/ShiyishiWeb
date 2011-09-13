<?php
class news_cat_Model extends Model{
	function init(){
		$this->news_cat = Load::table('news_cat');
		$this->cache = Load::lib('cache','file');
		$this->key = 'news_cat';
	}

	function find($id){
		return $this->news_cat->find($id);
	}

	
	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->news_cat->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function fetchRow($where){
		return $this->news_cat->fetchRow($where);
	}

	function getcache(){
		if(!$row = $this->cache->get($this->key)){
			$row = $this->flushcache($this->key,true);
		}
		return $row;
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