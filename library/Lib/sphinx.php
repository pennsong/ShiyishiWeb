<?php
class sphinx_Lib{

	protected $_iscws = true;
	protected $_cl;
	protected $_order = "@weight DESC";
	protected $_mode = 4;

	function __construct($config){
		$this->_cl = new SphinxClient (); 
		$this->_cl->SetServer($config['host'], $config['port']);
		if(isset($config['mode'])){
			$this->_mode = $config['mode'];
		}
		$this->_cl->SetMatchMode($this->_mode);
		$this->_cl->SetSortMode(SPH_SORT_EXTENDED, $this->_order);
		if(isset($config['iscws'])){
			$this->_iscws = $config['iscws'];
		}
	}

	function setcws($bool = true){
		$this->_iscws = $bool;
	}

	function cws($s){
		$so = scws_new();
		$so->send_text($s);
		$search = $res = array();
		while($tmp = $so->get_result()){
			$res[]= $tmp;
		}
		$so->close();
		foreach($res as $tmp){
			if(!$tmp || !is_array($tmp)){
				continue;
			}
			foreach($tmp as $ttmp){
				$search[] = $ttmp['word'];
			}
		}
		return $search;
	}

	function weight($arr){
		$this->_cl->setFieldWeights($arr);
	}

	function filter($key, $arr){
		$arr = (array) $arr;
		$this->_cl->SetFilter($key, $arr);
	}

	function mode($mode){
		$this->_cl->SetMatchMode($mode);
	}

	function order($order){
		$this->_cl->SetSortMode(SPH_SORT_EXTENDED, $order);
	}

	function group($key, $order = null){
		$order = $order ? $order : $this->_order;
		$this->_cl->SetGroupBy($key, SPH_GROUPBY_ATTR, $order);
	}
	
	function query($q, $index = '*', $start = 0, $limit = 20){
		if($this->_iscws && is_string($q) && strpos($q, '@') === false){
			$words = $this->cws($q);
			$q = '"'.implode('" "',$words).'"';
		}
		$q = iconv("gbk", "utf-8", $q);
		$this->_cl->SetLimits($start, $limit, 1000);
		if($res = $this->_cl->Query($q, $index)){
			if($words){
				$res['words'] = $words;
			}
		}
		return $res;
	}
}
?>