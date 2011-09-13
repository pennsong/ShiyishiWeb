<?php
class category_Model extends Model{	
	function init(){
		$this->cat = Load::table('category');
		$this->cache = Load::lib('cache_file');
		$this->mem = Load::lib('cache','mem');
	}

	function find($id){
		$key = 'CATEGORY_INFO_'.$id;
		if(!$info = $this->mem->get($key)){
			$info = $this->cat->find($id);
			$this->mem->set($key,$info);
		}
		return $info;
	}

	function checkActive($info){
		if(empty($info))return false;
		if(is_numeric($info)){
			$info = $this->find($info);
		}
		if($info['active']==1){
			return true;
		}else{
			return false;
		}
	}

	function fetchRow($where,$order=null){
		return $this->cat->fetchRow($where,$order);
	}

	function fetchAll($where = null, $order = null,$fields=null,$limit=null,$groupby=null){
		$rows = $this->cat->fetchAll($where, $order, $fields, $limit,$groupby);
		return $rows;
	}

	function findByen($en,$level=null,$pid=null){
		$key = 'CATEGORY_INFO_'.$en;
		if($level)$key .= '_LEVEL_'.$level;
		if($pid)$key .= '_PID_'.$pid;
		if(!$info = $this->mem->get($key)){
			$where = "cat_en='".$en."'";
			if($level)$where .= " AND level='".$level."'";
			if($pid)$where .= " AND parent_id='".$pid."'";
			$info = $this->cat->fetchRow($where);
			$this->mem->set($key,$info,LONG_CACHE_TIMES);
		}
		return $info;
	}

	function findByenPid($en,$pid=null){
		$key = 'CATEGORY_INFO_'.$en.'_PID_'.$pid;
		if(!$info = $this->mem->get($key)){
			$where = "cat_en='".$en."'";
			$where .= $pid ? " AND parent_id='".$pid."'" : "";
			$info = $this->cat->fetchRow($where);
			$this->mem->set($key,$info,LONG_CACHE_TIMES);
		}
		return $info;
	}

	function getTrace($id=0,$ids='',$level=1){
		$id = intval($id);
		if($id<0)return array('0');
		$info = $this->find($id);
		while($info['level']>=$level){
			$ids .= ','.$info['id'];
			$info = $this->find($info['parent_id'],$ids);
		}
		$ids .= ','.$info['id'];
		return array_reverse(explode(",",trim($ids,",")));
	}

	function getAlltrace($cat_trace=null){
		if(!$cat_trace)
			return "";
		$catids = explode(",",trim($cat_trace,","));
		$nav = array();
		foreach($catids as $catid){
			$nav[] = $this->getName($catid);
		}
		$nav = implode(' &raquo; ',$nav);
		return $nav;
	}

	/**
	* $cat_trace = string
	* $isnav 是否为导航
	* $tp 导航里的固定字符
	* $lastnolink 导航最后一个是否需要链接
	*
	* return string.
	*/
	function gettracenav($cat_trace=null,$cityinfo=null,$lastnolink=false,$target=""){
		if(!$cat_trace)
			return "";
		if(!is_array($cat_trace)){
			$catids = explode(",",trim($cat_trace,","));
		}else{
			$catids = $cat_trace;
		}
		$nav = array();
		$last_nav = "";
		$cityname = $cityinfo ? $cityinfo['area_name'] : '中国';
		if($lastnolink){
			$last_cid = array_pop($catids);
			$catname = $this->getName($last_cid);
			$last_nav = (strstr($lastnolink,"##txt##") ? str_replace("##txt##",$catname,$lastnolink) : $catname);
		}
		if(!empty($catids)){
			foreach($catids as $catid){
				$nav[] = '<a href="'.$this->getUrl($catid,$cityinfo).'" title="'.$cityname.$this->getName($catid).'"'.($target? 'target="'.$target.'"' : '').'>'.$this->getName($catid).'</a>';
			}
			$nav = implode(' &raquo; ',$nav);
			if($lastnolink)$nav .= " &raquo; ";
		}else{
			$nav = "";
		}
		
		return $nav.$last_nav;
	}

	function getPid($id){
		$info = $this->find($id);
		return $info['parent_id'];
	}

	function getLevel($id){
		$info = $this->find($id);
		return $info['level'];
	}

	function getcaten($id){
		$info = $this->find($id);
		return $info['cat_en'];
	}

	function getName($id){
		$info = $this->find($id);
		return $info['cat_name'];
	}

	function getSeoName($id){
		$info = $this->find($id);
		return $info['seo_title'] ? $info['seo_title'] : $info['cat_name'];
	}

	function getcatids($catens=array(),$pid = null){
		if(!$pid){
			$rootcatinfo = $this->findByen($catens[0],1);
			$pid = $rootcatinfo['parent_id'];
		}
		$idstr = ",";
		$pids = array();
		foreach($catens as $caten){
			if($cinfo = $this->findByenPid($caten,$pid)){
				$idstr .= $cinfo['id'].",";
				$pid = $cinfo['id'];
			}else{
				return false;
			}
		}
		return $idstr;
	}

	function getUrl($id,$cityinfo=array()){
		$info = $this->find($id);
		if($info['level']==1){
			return ($cityinfo ? 'http://'.$cityinfo['area_en'].WEB_DOMAIN : BASE_URL)."/".$info['cat_en']."/";
		}else{
			return ($cityinfo ? 'http://'.$cityinfo['area_en'].WEB_DOMAIN : BASE_URL)."/".$this->getPtraceEn($id,$cityinfo)."/".$info['cat_en']."/";
		}
	}

	function getcatidByTrace($catstr=null){
		if($catstr===null)
			return 0;
		$catarr = array_reverse(explode(",",trim($catstr,",")));
		return $catarr[0];
	}

	function getPtraceEn($catid=null,$cityinfo=array()){
		if(!$catid)return;
		$catids = $this->getTrace($catid);
		array_pop($catids);
		$caten = array();
		foreach($catids as $catid){
			$caten[] = $this->getcaten($catid);
		}
		return implode("/",$caten);
	}

	//获取同级分类
	function getsamecats($id,$noself=true){
		$key = 'CATEGORY_SAME_CATS_'.$id.'_NOSELF_'.($noself ? 'YES' : 'NO');
		if(!$all = $this->mem->get($key)){
			$level = $this->getLevel($id);
			$pid = $this->getPid($id);
			$wself = $noself ? " AND id != {$id}" : '';
			$wself .= $level>2 ? " AND parent_id={$pid}" : '';
			$rows = $this->fetchAll("active=1 AND level='{$level}'".$wself,'order_id ASC,id ASC','id,cat_name,messages as mes');
			foreach($rows as $row){
				if($row['mes']>0){
					$row['url'] = $this->getUrl($row['id']);
					$all[$row['id']] = $row;
				}
			}
			$this->mem->set($key,$all,TWO_HOUR_CACHE_TIMES);
		}
		return $all;
	}
	
	function getsubcats($id){
		$key = 'CATEGORY_SUBCATS_ID_'.$id;
		if(!$rows = $this->mem->get($key)){
			$rows = $this->cat->fetchAll("parent_id={$id} AND active=1",'order_id asc','id,cat_en,cat_name,level,messages as mes,is_hot,parent_id,seo_title');
			if(empty($rows))return array();
			foreach($rows as $key=>$row){
				$rows[$key]['url'] = $this->getUrl($row['id']);
			}
			$this->mem->set($key,$rows,TWO_HOUR_CACHE_TIMES);
		}
		return $rows;
	}

	function getsubcatids($id){
		$key = 'CATEGORY_SUBIDS_ID_'.$id;
		if(!$rows = $this->mem->get($key)){
			$rows1 = $this->cat->fetchAll("parent_id={$id} AND active=1",'order_id asc','id');
			if(empty($rows1))return array();
			foreach($rows1 as $v){
				$rows[] = $v['id'];
			}
			$this->mem->set($key,$rows,LONG_CACHE_TIMES);
		}
		return $rows;
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
		$this->cache->set($this->memkey ,$newdata[$this->memkey]);
		//$this->cache->set('cat_one' ,$newdata['cat_one']);
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