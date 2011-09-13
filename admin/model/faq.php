<?php
class faq_Model extends Model{
	function init(){
		$this->faq = Load::table('faq');
		$this->cache = Load::lib('cache_file');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->faq->pageAll($page, $count, $url, $where, $order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		return $this->faq->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function find($id){
		return $this->faq->find($id);
	}

	function remove($id){
		return $this->faq->delete($id);
	}

	function fetchRow($where){
		return $this->faq->fetchRow($where);
	}
	
	function removeBy($where){
		return $this->faq->removeBy($where);
	}

	function save($info){
		return $this->faq->save($info);
	}

	function update($info,$where=null){
		return $this->faq->update($info,$where);
	}

	function flushcache(){
		$ckey = 'faq_bottom_datas';
		$catids = $faqcats = array();
		$rows = $this->fetchAll('status=1','order_id asc','id,subject,catid');
		foreach($rows as $key=>$val){
			if(!in_array($val['catid'],$catids))$catids[] = $val['catid'];
			$faqcats[$val['catid']]['faqs'][] = $val;
		}
		$catmodel = Load::model('faq_cat');
		foreach($catids as $catid){
			$catdata = $catmodel->find($catid);
			$faqcats[$catid]['name'] = $catdata['name'];
		}
		$this->cache->set($ckey,$faqcats);
	}
}
?>