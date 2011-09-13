<?php
class faq_Model extends Model{
	function init(){
		$this->faq = Load::table('faq');
		$this->faq_cat = Load::model('faq_cat');
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

	function fetchRow($where){
		return $this->faq->fetchRow($where);
	}

	function flushcache($mkey='faq_trees',$return=false){
		$cityid = strstr($mkey,'faq_trees_') ? (int)str_replace('faq_trees_','',$mkey) : null;
		$where = $faqcats = array();
		$faq_cat = $this->faq_cat->fetchAll('parent_id=0','order_id asc','id,name');
		foreach($faq_cat as $k1=>$v1){
			$faqcats[$v1['id']] = $v1;
		}
		if($cityid){
			$where[] = "cityids LIKE '%,".$cityid.",%'";
		}
		$rows = $this->faq->fetchAll($where,'order_id asc','id,subject,catid');
		foreach($rows as $key=>$val){
			if(isset($faqcats[$val['catid']])){
				$faqcats[$val['catid']]['faqs'][] = $val;
			}
		}
		$this->cache->set($mkey,$faqcats);
		if($return)return $faqcats;
	}

	function flushbcache(){
		$ckey = 'faq_bottom_datas';
		$catids = $faqcats = array();
		$rows = $this->fetchAll('status=1','order_id asc','id,subject,catid');
		foreach($rows as $key=>$val){
			if(!in_array($val['catid'],$catids))$catids[] = $val['catid'];
			$faqcats[$val['catid']]['faqs'][] = $val;
		}
		foreach($catids as $catid){
			$catdata = $this->faq_cat->find($catid);
			$faqcats[$catid]['name'] = $catdata['name'];
		}
		$this->cache->set($ckey,$faqcats);
		return $faqcats;
	}
}
?>