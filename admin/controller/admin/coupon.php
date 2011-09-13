<?php
class coupon_Controller extends Controller{
	function init(){
		$this->coupon = Load::model('coupon');
		$this->prodata = $this->cache->getProductDatas();
		$this->assign('cats', $this->prodata);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$couponcode = trim($this->_get('couponcode'));
		$proid = $this->_get('proid');
		$isout = $this->_get('isout');
		$startdatetime = $this->_get('startdatetime');
		$enddatetime = $this->_get('enddatetime');
		$s = array('proid'=>$proid,'isout'=>$isout,'startdatetime'=>$startdatetime,'enddatetime'=>$enddatetime);
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='startdatetime'){
				$wheres[] = "startdatetime >= ".strtotime($val.' 00:00:00');
			}elseif($key=='enddatetime'){
				$wheres[] = "enddatetime <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->coupon->pageAll($this->_get('page',1), 20, $url,$wheres,'id DESC');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['status'] = F::getcnName($val['status']);
			$rows[$key]['usedatetime'] = date("Y-m-d",$val['startdatetime']).' ~ '.date("Y-m-d",$val['enddatetime']);
			$rows[$key]['proname'] = $this->prodata[$val['proid']]['proname'];
			$rows[$key]['isuse'] = F::getcnName($val['isout']);
		}	
		$page = $this->_get('page');
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){

		$this->assign('info', array('startdatetime'=>date("Y-m-d",time()),'enddatetime'=>date("Y-m-d",strtotime("+2 month"))));
		$this->display('coupon_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->coupon->find($id)){
			$this->showmsg('您请求的数据不存在',1);
			exit();
		}
		$info['startdatetime'] = date("Y-m-d",$info['startdatetime']);
		$info['enddatetime'] = date("Y-m-d",$info['enddatetime']);
		$info['couponprice'] = (int)$info['couponprice'];
		$this->assign('info', $info);
		$this->display('coupon_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(intval($info['couponprice'])<=0)$info['couponprice']=0;
		if(intval($info['usetimes'])<=0)$info['usetimes']=1;
		$info['startdatetime'] = strtotime($info['startdatetime']);
		$info['enddatetime'] = strtotime($info['enddatetime']);
		
		if(!$info['id']){
			$proids = $this->_get('proids');
			if(empty($proids)){
				$this->showmsg("必须选择一个产品",1);
			}
			foreach($proids as $proid){
				$totalnums = intval($this->_get('nums'));
				$nx = 8 - strlen($info['couponcodeh']);
				$info['proid'] = $proid;
				for($i=1;$i<=$totalnums;$i++){
					$info['couponcode'] = strtoupper($info['couponcodeh']).($nx>0 ? strtoupper(F::getRandomstr($nx,'letter')) : '');
					$this->coupon->save($info);
				}
			}
		}else{
			if($this->coupon->save($info) === false){
				$this->showmsg($this->coupon->getError(),1);
			}
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->coupon->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->coupon->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
			exit();
		}
    	 $this->showmsg('操作成功','list.do?page='.$page);
	  exit();
	}
}
?>