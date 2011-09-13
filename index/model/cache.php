<?php
class cache_Model extends Model{
	
	function init(){
		$this->cache_file = Load::lib('cache_file');
		$this->cache_mem = Load::lib('cache','mem');
	}
	
	function getConfig($wkey=null){
		$key = 'webconfig';
		$webconfig = $this->getDatas($key);
		if($wkey)return $webconfig[$wkey];
		return $webconfig;
	}

	function getAreaDatas($key='area'){
		$areadata = $this->getDatas($key,'file');
		if(!$areadata){
			$areamodel = Load::model('area');
			$areadata = $areamodel->flushcache($key,true);
		}
		return $areadata;
	}

	function getcitynames($cityids,$citys=array()){
		if(empty($citys))
			$citys = $this->getAreaDatas();
		$str = '';
		foreach($cityids as $k=>$v){
			if($v==0)
				$str .= '全国';
			else
				$str .= $citys[$v]['name'].' ';
		}
		return $str;
	}

	function getCityInfo($cityen){
		if(!$cityen){return null;}
		setcookie("sys_cookie_city",	$cityen, time() + 86400*30, "/",WEB_DOMAIN);
		$areamodel = Load::model('area');
		$cityinfo = $areamodel->fetchRow("area_en='".$cityen."'");
		return $cityinfo;
	}

	function getFuntypeDatas($key='funtype'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('funtype');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getDustrytypeDatas($key='dustrytype'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('dustrytype');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getMajorDatas($key='major'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('major');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getMailTemplates($key='mailtemplate'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('mailtemplate');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getMailTasks($key='mailtask'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('mailtask');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getCatDatas($key='categorys'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('category');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getVenueDatas($key='venues'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('venue');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}
	
	function getSeriesDatas($key='series'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('series');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getCircuitsDatas($key='circuit'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('circuit');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getDeliveryAreaDatas($key='delivery_area'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('delivery_area');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getDeliveryTypeDatas($key='delivery_type'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('delivery_type');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getGiftCatDatas($key='gift_cat'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('gift_cat');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getNewsCatDatas($key='news_cat'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('news_cat');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getFaqs($key = 'faq_trees'){
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('faq');
			$data = $model->flushcache($key,true);
		}
		return $data;
	}

	function getFaqBs(){
		$key = 'faq_bottom_datas';
		$data = $this->getDatas($key,'file');
		if(!$data){
			$model = Load::model('faq');
			$data = $model->flushbcache();
		}
		return $data;
	}

	function getDatas($key=null,$cachefarm = 'all',$defaultvalue=null){
		if(!$key)
			return false;
		if($cachefarm=='mem'){
			return $this->cache_mem->get($key);
		}
		if($cachefarm=='file'){
			return $this->cache_file->get($key);
		}
		if(($data = $this->cache_mem->get($key))===NULL){
			$data = $this->cache_file->get($key);
		}
		if(!$data)
			$data = $defaultvalue;
		return $data;
	}

}
?>