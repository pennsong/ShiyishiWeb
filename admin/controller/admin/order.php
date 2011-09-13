<?php
class order_Controller extends Controller{
	function init(){
		$this->order = Load::model('order');
		$this->user = Load::model('user');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['ordernum'] = trim($this->_get('ordernum'));
		$s['ispay'] = $this->_get('ispay');
		$s['isview'] = trim($this->_get('isview'));
		$s['cityid'] = (int)$this->_get('cityid');
		$s['orderdatetime'] = $this->_get('orderdatetime');
		$s['kw'] = $this->_get('kw');
		
		$urls = $wheres = array();
		if($s['isview']=='n')$wheres[] = "status='show'";
		$admin_zhiwu = $_SESSION['admin_info']['admin_zhiwu'];

		if($admin_zhiwu!=1){
			$admincitys = unserialize($_SESSION['admin_info']['admin_citys']);
			$wheres[] = "cityid IN (".implode(',',$admincitys).")";
			if($admin_zhiwu==2){//kf
				$wheres[] = "isget IN ('x','d','t')";
			}elseif($admin_zhiwu==3){//kf
				$wheres[] = "isget IN ('f','t')";
			}elseif($admin_zhiwu==2){//kf
				$wheres[] = "isget IN ('f','y','n')";
			}
		}
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='orderdatetime'){
				$wheres[] = "orderdate >= ".strtotime($val.' 00:00:00')." AND orderdate <= ".strtotime($val.' 23:59:59');
			}elseif($key=='kw'){
				$wheres[] = "useremail LIKE '%".$val."%'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		if($s['cityid']>0){
			$urls[] = 'cityid='.$s['cityid'];
			$wheres[] = "cityid = ".$s['cityid'];
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->order->pageAll($page, 20, $url,$wheres,'id DESC');
		foreach ($rows as $key=>$val)
		{
			$userinfo = $this->user->find($val['uid']);
			$rows[$key]['username'] = $userinfo['username'] ? $userinfo['username'] : $userinfo['email'];
			$rows[$key]['usercard'] = $userinfo['usercard'];
			$rows[$key]['orderfee'] = $val['totalprice']+$val['deliverprice']-$val['couponfee']-$val['accountgiftfee'];
			$rows[$key]['paidfee'] = $val['accountmoney']+$val['otherpay'];
			$rows[$key]['getstatus'] = $val['isget']=='w' ? '已取消' : F::getcnName('isget'.$val['isget']);
			$rows[$key]['paystatus'] = $val['ispay'] == 'ok' ? '已付款' : '未完成付款';
			$rows[$key]['orderdate'] = date("Y-m-d H:i:s",$val['orderdate']);
		}
		$this->assign('citys',$this->cache->getAreaDatas());
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->assign('excelurl', $url.'&excel=ok');
		$this->display();
	}

	function addprobillAction(){
		$id = $this->_get('id');
		if(!$info = $this->order->find($id)){
			$this->showmsg('您请求的数据不存在',5,380);
		}
		$delivery_man = Load::model('delivery_man');
		$deliverys = $delivery_man->fetchAll("cityid=".$info['cityid'],null,'id,coname,linkman');
		$this->assign('info', $info);
		$this->assign('deliverys', $deliverys);
		$this->display('order_float_probill.tpl');
	}

	function adddengjiAction(){
		$pwid = (int)$this->_get('id');
		$order_pw_model = Load::model('order_pw');
		if(!($pwinfo = $order_pw_model->find($pwid))){
			$this->wajaxmsg('参数错误！');
		}
		$this->assign('pwid', $pwid);
		$this->assign('orderid', $pwinfo['orderid']);
		$this->display('order_float_dengji.tpl');
	}

	function addgetstatAction(){
		$id = $this->_get('id');
		$isget = $this->_get('isget');
		if(!$info = $this->order->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		if(!in_array($isget,array('t','f','y','w','d'))){
			$this->wajaxmsg('您的操作不正确',1);
		}
		$saveinfo = array('id'=>$id,'isget'=>$isget);
		$orderlogmodel = Load::model('order_log');
		if($isget=='t'){
			$actlog = '确认订单';
		}elseif($isget=='f'){
			$probillnum = explode(':',$this->_get('probillnum'));
			$saveinfo['probillnum'] = $this->_get('probillnum');
			$actlog = '确认发货并选择快递公司：'.$probillnum['1'];
		}elseif($isget=='y'){
			$actlog = '款已收';
			$saveinfo['ispay'] = 'ok';
		}elseif($isget=='w'){
			$actlog = '作废订单';
		}elseif($isget=='d'){
			$actlog = '恢复订单';
		}
		
		$this->order->save($saveinfo);
		$orderlogmodel->save(array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$info['ordernum'],'orderid'=>$id,'actlog'=>$actlog));
		if($isget=='f'){
			$this->showmsg('您的操作成功',5,380);
		}else{
			$this->wajaxmsg('您的操作成功',1);
		}
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->order->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		//更新为已查看
		//$info['isview'] = 'y';
		$this->order->update(array('id'=>$id,'isview'=>'y'));
		if($info['isget']=='x'){
			$this->order->update(array('id'=>$id,'isget'=>'d'));
			$info['isget'] = 'd';
		}
		$info['allprice'] = $info['totalprice']+$info['deliverprice']-$info['couponfee']-$info['accountgiftfee'];
		$info['lastprice'] = $info['lastprice']>0 ? $info['lastprice'] : $info['allprice'];
		$area_model = Load::model('area');
		$deliver_area_model = Load::model('delivery_area');
		$d_area_info = $deliver_area_model->find($info['recareaid']);
		$info['recareaname'] = $area_model->getName($d_area_info['cityid']).' - '.$d_area_info['area'].'<span style="color:#c3c3c3;">'.$d_area_info['description'].'</span>';

		$deliver_type_model = Load::model('delivery_type');
		$d_type_info = $deliver_type_model->find($info['dtypeid']);
		$info['delivertype'] = $d_type_info['dname'];
		$paytype_model = Load::model('paytype');
		$paytype_info = $paytype_model->find($info['paytypeid']);
		$info['paytype'] = $paytype_info['payname'];

		$deliverdates = array(1=>'工作日、双休日与假日均可送货',2=>'只双休日、假日送货 工作日不用送',3=>'只工作日送货 双休日、假日不用送');
		$info['deliverdate'] = $info['deliverdate']<4 ? $deliverdates[$info['deliverdate']] : $info['deliverbeizhu'];
		$info['getstatus'] = $info['isget']=='w' ? '已取消' : F::getcnName('isget'.$info['isget']);
		$oldotherinfo = $info['otherinfo'] ? unserialize($info['otherinfo']) : array();
		$info['deliverdatetime'] = $info['deliverdatetime']>0 ? date("Y-m-d",$info['deliverdatetime']) : '';
		//获取订单票务
		$order_pw_model = Load::model('order_pw');
		$order_pw = $order_pw_model->fetchAll("orderid=".$id);
		$shwotkmodel = Load::Model('showticket');
		$ticketcc = array();
		foreach($order_pw as $key=>$opw){
			$hasprice = false;
			$ismember = $this->user->ismember($opw['uid']);
			if(!isset($ticketcc[$opw['showccid']]) || empty($ticketcc[$opw['showccid']])){
				$pwprice = $shwotkmodel->fetchAll("ccid='".$opw['showccid']."'",'id asc','id,newprice,coupon,description as ticketdec');
				if(!empty($pwprice)){
					foreach($pwprice as $k1=>$v1){
						if($v1['newprice']==$opw['ticketprice']){
							$hasprice = true;
						}
						$v1['cf'] = $ismember>0 ? $v1['newprice'] * $v1['coupon'] /100 : 0;
						$ticketcc[$opw['showccid']][] = $v1;
					}
				}
			}
			if(!$hasprice)array_push($ticketcc[$opw['showccid']],array('id'=>0,'newprice'=>$opw['ticketprice']));
			$order_pw[$key]['ticket'] = $ticketcc[$opw['showccid']];
		}
		$orderlogmodel = Load::model('order_log');
		$logrows = $orderlogmodel->fetchUnionAll('admin','a.adminid=b.id','a.orderid='.$id,'a.id desc','a.*,b.admin_name,b.admin_number');
		$this->assign('order_pw', $order_pw);
		$this->assign('info', $info);
		$this->assign('return', $this->_get('return'));
		$this->assign('logrows', $logrows);
		$this->assign('admininfo',$_SESSION['admin_info']);
		$this->assign('oldotherinfo', $oldotherinfo);
		$this->display('order_info.tpl');
	}

	function saveAction(){
		$opt = $this->_get('opt');
		if($opt=='dengji'){
			$pwid = (int)$this->_get('pwid');
			$orderid = (int)$this->_get('orderid');
			$order_pw_model = Load::model('order_pw');
			if(!($pwinfo = $order_pw_model->find($pwid))){
				$this->wajaxmsg('参数错误！');
			}
			if(!($orderinfo = $this->order->find($orderid))){
				$this->wajaxmsg('参数错误！');
			}
			$actlog = $pwinfo['fullname'].' '.$pwinfo['wdatetime'].'场次 进行登记';
			$orderlog = array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$orderinfo['ordernum'],'orderid'=>$orderid,'actlog'=>$actlog,'logdes'=>$this->_get('dengjicontent'));
			$orderlogmodel = Load::model('order_log');
			$orderlogmodel->save($orderlog);
			$this->showmsg('登记成功！',5,380);
		}
		$info = $this->_get('info');
		$info['isview'] = 'y';
		$actlog = '修改订单';
		$olddeliverdatetime = $this->_get('olddeliverdatetime');
		if($olddeliverdatetime!=$info['deliverdatetime'] && $info['deliverdatetime']){
			$actlog .= '并修改配送时间'.($olddeliverdatetime>0?"《".$olddeliverdatetime."》":'').'为：'.$info['deliverdatetime'];
		}
		$info['deliverdatetime'] = $info['deliverdatetime'] ? strtotime($info['deliverdatetime']) : 0;
		
		$orderlog = array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$info['ordernum'],'orderid'=>$info['id'],'actlog'=>$actlog,'logdes'=>$this->_get('logdes'));
		$orderlogmodel = Load::model('order_log');
		$orderlogmodel->save($orderlog);
		if($this->order->save($info) === false){
			$this->showmsg($this->order->getError(),1);
		}
		if($info['lastprice']!=$info['oldlastprice']){
			$orderlog = array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$info['ordernum'],'orderid'=>$info['id'],'actlog'=>'修改实收票款','logdes'=>$info['oldlastprice'].'元 为 '.$info['lastprice'].'元');
			$orderlogmodel->save($orderlog);
		}
		if($this->_get('returnurl')){
			$this->showmsg('操作成功',$this->_get('returnurl'));
		}
		$this->showmsg('操作成功','edit.do?id='.$info['id']);
	}

	function pwinfoAction(){
		$order_pw_model = Load::model('order_pw');
		$shwotkmodel = Load::Model('showticket');
		$act = $this->_get('act');
		if(!$act || !in_array($act,array('edit','del','noticket'))){
			$this->wajaxmsg('未知操作参数');
		}
		
		if($act=='edit'){
			$pwinfo = $this->_get('pwinfo');
			$ticketdata = $this->_get('ticketdata');
			$oldticketid = $this->_get('oldticketid');
			$oldticketprice = $this->_get('oldticketprice');
			$orderid = (int)$this->_get('orderid');
			$uid = (int)$this->_get('uid');
			$ismember = $this->user->ismember($uid);
			$oldticketnum = (int)$this->_get('oldticketnum');
			$actlog = $this->_get('showname').' '.$this->_get('wdatetime').'场次 ';
			if(!$ticketdata){
				$this->wajaxmsg('提交数据错误');
			}
			$arrdata = explode("_",$ticketdata);
			if($arrdata[0]==0){
				$this->wajaxmsg('票价'.$arrdata[1].'已经删除，建议您修改。');
			}
			if($oldticketid==$arrdata[0]&&$oldticketnum==$pwinfo['ticketnum']){
				$this->wajaxmsg('数据没有进行任何修改。');
			}
			//1 更新订单里的票务
			$pwinfo['ticketprice'] = $arrdata[1];
			$pwinfo['ticketcoupon'] = $arrdata[2];
			$pwinfo['ticketid'] = $arrdata[0];
			$pwinfo['ticketdec'] = $arrdata[3];
			$order_pw_model->update($pwinfo);
			//2 更新订单 的价钱
			$orderpwinfo = $order_pw_model->fetchRow("orderid = '{$orderid}'",null,'sum( `ticketprice` * `ticketnum` ) as totalprice,sum( `ticketprice` * `ticketnum` * `ticketcoupon` ) as couponfee');
			$uporder['id'] = $orderid;
			$uporder['totalprice'] = $orderpwinfo['totalprice'];
			$uporder['couponfee'] = $ismember>0 ? $orderpwinfo['couponfee']/100 : 0;
			$this->order->update($uporder);
			//3 执行修改 票数 ---
			if($oldticketid==$arrdata[0]){				
				$t_num = $pwinfo['ticketnum']-$oldticketnum;
				$shwotkmodel->update(array('id'=>$oldticketid,'renum'=>'`renum`+'.$t_num));
			}else{
				//3.1 还原旧的票数
				$shwotkmodel->update(array('id'=>$oldticketid,'renum'=>'`renum`-'.$oldticketnum));
				//3.2 更新新的票数
				$shwotkmodel->update(array('id'=>$arrdata[0],'renum'=>'`renum`+'.$pwinfo['ticketnum']));
			}
			$actlog .= $oldticketprice.'元'.$oldticketnum.'张 改为 '.$pwinfo['ticketprice'].'元'.$pwinfo['ticketnum'].'张';
			//4 记录
			$orderinfo = $this->order->find($orderid);
			$orderlogmodel = Load::model('order_log');
			$orderlogmodel->save(array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$orderinfo['ordernum'],'orderid'=>$orderinfo['id'],'actlog'=>$actlog));
			$this->wajaxmsg('修改成功！');
		}elseif($act=='del'){
			$pwid = (int)$this->_get('id');
			if(!($pwinfo = $order_pw_model->find($pwid))){
				$this->wajaxmsg('删除参数错误！');
			}
			//1 删除票务数据
			$order_pw_model->remove($pwid);
			//2 更新订单总价
			$ismember = $this->user->ismember($pwinfo['uid']);
			$orderpwinfo = $order_pw_model->fetchRow("orderid = '".$pwinfo['orderid']."'",null,'sum( `ticketprice` * `ticketnum` ) as totalprice,sum(`ticketnum` * `ticketcoupon` ) as couponfee');
			$uporder['id'] = $pwinfo['orderid'];
			$uporder['totalprice'] = $orderpwinfo['totalprice'];
			$uporder['couponfee'] = $ismember>0 ? $orderpwinfo['couponfee'] : 0;
			$this->order->update($uporder);
			//3 还原票数
			$shwotkmodel->update(array('id'=>$oldticketid,'renum'=>'`renum`-'.$pwinfo['ticketnum']));
			//4 记录
			$orderinfo = $this->order->find($pwinfo['orderid']);
			$orderlogmodel = Load::model('order_log');
			$orderlogmodel->save(array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$orderinfo['ordernum'],'orderid'=>$orderinfo['id'],'actlog'=>'删除了一条演出票务：'.$pwinfo['wdatetime'].'场次 '.$pwinfo['ticketprice'].'元'.$pwinfo['ticketnum'].'张'));
			$this->wajaxmsg('删除成功！');
		}elseif($act=='noticket'){
			$pwid = (int)$this->_get('id');
			if(!($pwinfo = $order_pw_model->find($pwid))){
				$this->wajaxmsg('删除参数错误！');
			}
			$ismember = $this->user->ismember($pwinfo['uid']);
			//1 判断该订单一个包含几个票务
			$pwnum = $order_pw_model->count("orderid = '".$pwinfo['orderid']."'");
			if($pwnum<=1){
				$this->wajaxmsg('该订单只包含这一个票务信息，无需分离。');
			}
			//2 获取订单信息
			$orderinfo = $this->order->find($pwinfo['orderid']);
			$orderid = $orderinfo['id'];
			$ordernum = $orderinfo['ordernum'];
			$this->order->update(array('id'=>$orderid,'split_times'=>$orderinfo['split_times']+1));
			//3 生成新的订单
			unset($orderinfo['id']);
			$orderinfo['ordernum'] = $orderinfo['ordernum'].'-'.($orderinfo['split_times']+1);
			$orderinfo['totalprice'] = $pwinfo['ticketprice'] * $pwinfo['ticketnum'];
			$orderinfo['couponfee'] = $ismember ? $pwinfo['ticketcoupon'] * $pwinfo['ticketnum'] : 0;
			$orderinfo['isget'] = 'd';
			$orderinfo['split_times'] = 0;
			$neworderid = $this->order->save($orderinfo);
			//更改原票务归属新订单
			$pwinfo['orderid'] = $neworderid;
			$order_pw_model->update($pwinfo);
			//更新原订单票价数据
			$orderpwinfo = $order_pw_model->fetchRow("orderid = '".$orderid."'",null,'sum( `ticketprice` * `ticketnum` ) as totalprice,sum(`ticketnum` * `ticketcoupon` ) as couponfee');
			$uporder['id'] = $orderid;
			$uporder['totalprice'] = $orderpwinfo['totalprice'];
			$uporder['couponfee'] = $ismember>0 ? $orderpwinfo['couponfee'] : 0;
			$this->order->update($uporder);
			$orderlogmodel = Load::model('order_log');
			$orderlogmodel->save(array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$ordernum,'orderid'=>$orderid,'actlog'=>'拆分出订单：'.$orderinfo['ordernum']));
			$this->wajaxmsg('拆分成功！');
		}
	}

	function addshowAction(){
		if(!$_SESSION['orderaddshow'.$_SESSION['admin_info']['id']]){
			$orderid = (int)$this->_get('orderid');
			if($orderid<=0){
				$this->showmsg("没有传递正确的订单ID");
			}
			$order = $this->order->find($orderid);
			$_SESSION['orderaddshow'.$_SESSION['admin_info']['id']] = $order;
		}

		$shwomodel = Load::model('showcity');
		$venuemodel = Load::model('venue');
		$catgory = $this->cache->getCatDatas();
		$citys = $this->cache->getAreaDatas();
		$url = $this->getPageUrl().'/addshow.do';
		$page = $this->_get('page',1);
		$rows = $shwomodel->pageUnionAll($page, 25, $url,"performance","a.pid=b.id","a.status=1 and a.ifsale>0",'a.id desc','b.id,a.id as pcid,b.pname,a.cname,a.venues,a.pdates,a.fare,b.catid,a.cityid');
		foreach ($rows as $key=>$val)
		{
			$rows[$key]['subject'] = $val['cname'] ? $val['cname'] : $val['pname'];
			$rows[$key]['fare'] = F::getformatfare($val['fare']);
			$rows[$key]['pdatetime'] = F::getformatdate($val['pdates']);
			$rows[$key]['venuename'] = $venuemodel->getNameByIds($val['venues']);
			$rows[$key]['catname'] = $catgory[$val['catid']]['name'];
			$rows[$key]['cityname'] = $citys[$val['cityid']]['name'];
		}
		$this->assign('orderid', $orderid);
		$this->assign('page', $page);
		$this->assign('rows', $rows);
		$this->display('order_addshow.tpl');

	}

	function addticketAction(){
		$order = $_SESSION['orderaddshow'.$_SESSION['admin_info']['id']];
		if(!$order){
			$this->showmsg("订单数据丢失 请重新操作。");
		}

		$pid = (int)$this->_get('pid',0);
		if($pid<=0){$this->showmsg('您请求的数据不存在',1);}
		$shwomodel = Load::model('showcity');
		$shwoccmodel = Load::model('showcc');
		$shwotkmodel = Load::model('showticket');
		$citys = $this->cache->getAreaDatas();
		$venues = $this->cache->getVenueDatas();
		$sinfo = $shwomodel->find($pid);

		//更新order
		$order['pw']['uid'] = $order['uid'];
		$order['pw']['showid'] = $sinfo['pid'];
		$order['pw']['showcityid'] = $sinfo['id'];
		$order['pw']['fullname'] = $sinfo['cname'];
		$order['pw']['cityid'] = $sinfo['cityid'];
		$order['pw']['cityname'] = $citys[$sinfo['cityid']]['name'];
		$_SESSION['orderaddshow'.$_SESSION['admin_info']['id']] = $order;

		$rows = $shwoccmodel->fetchAll("pid='{$pid}'",'id asc');
		foreach ($rows as $key=>$val)
		{
			//获取场票
			$rows[$key]['ticket'] = $shwotkmodel->fetchAll("ccid='".$val['id']."'",'id asc');
			if(empty($rows[$key]['ticket'])){
				unset($rows[$key]);
			}else{
				foreach($rows[$key]['ticket'] as $k1=>$v1){
					$rows[$key]['ticket'][$k1]['cf'] = $v1['newprice'] * $v1['coupon'] /100;
				}
				$rows[$key]['cityname'] = $citys[$val['cityid']]['name'];
				$rows[$key]['venuename'] = $venues[$val['venueid']]['name'];
				$rows[$key]['showdate'] = $val['datetype']==1 ? $val['wdatetime'] : ($val['pdatetime_s']<=0 ? '未填' : (date("Y.m.d",$val['pdatetime_s']).' 星期'.F::NumToCN(date("N",$val['pdatetime_s'])).' '.date("H:i",$val['pdatetime_s'])));
			}
		}

		$this->assign('pid', $pid);
		$this->assign('sinfo', $sinfo);
		$this->assign('rows', $rows);
		$this->display('order_addticket.tpl');
	}

	function donepwAction(){
		$cinfo = $this->_get('cinfo');
		if(!$cinfo){
			$this->showmsg("错误的操作。");
		}
		$num = 0;
		foreach($cinfo as $ccid=>$val){
			if($val['ticketnum']>0){
				$num++;
			}
		}
		if($num<=0){
			$this->showmsg("请至少选择一张票");
		}
		$order = $_SESSION['orderaddshow'.$_SESSION['admin_info']['id']];
		if(!$order){
			$this->showmsg("订单数据丢失 请重新操作。");
		}
		$orderlogmodel = Load::model('order_log');
		$orderlogmodel->save(array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$order['ordernum'],'orderid'=>$order['id'],'actlog'=>'添加新演出票务'));
		$order_pw_d = $order['pw'];
		$uid = $order['uid'];
		unset($order['pw']);

		$orderid = $order['id'];
		$uporder['id'] = $orderid;
		
		$allcoupon = $total_price = 0;
		$orderpwmodel = Load::model('order_pw');
		$showticketmodel = Load::model('showticket');
		foreach($cinfo as $ccid=>$val){
			if($val['ticketnum']>0){
				$num++;
				$ticketinfo = $showticketmodel->find($val['ticketid']);
				$order_pw = $order_pw_d;
				$order_pw['orderid'] = $orderid;
				$order_pw['showccid'] = $val['ccid'];
				$order_pw['ticketid'] = $val['ticketid'];
				$order_pw['ticketnum'] = $val['ticketnum'];
				$order_pw['ticketprice'] = $ticketinfo['newprice'];
				$order_pw['ticketdec'] = $ticketinfo['description'];
				$order_pw['ticketcoupon'] = $ticketinfo['coupon']>0 ? $ticketinfo['newprice'] * $ticketinfo['coupon'] /100 : 0;
				$order_pw['venueid'] = $val['venueid'];
				$order_pw['venuename'] = $val['venuename'];
				$order_pw['wdatetime'] = $val['wdatetime'];
				if($orderpwmodel->save($order_pw)===false){
					$this->showmsg($orderpwmodel->getError(),1);
				}else{
					//更新票数
					$showticketmodel->update(array('id'=>$order_pw['ticketid'],'renum'=>'`renum`+'.$order_pw['ticketnum']));
				}
			}
		}

		//判断是否可使用会员优惠
		$ismember = $this->user->ismember($order['uid']);
		if($ismember!=1){
			$num = $this->order->count("uid=".$order['uid']." AND ispay='ok'");
			if($num>0){
				$ismember = 1;
				$this->user->update(array('id'=>$order['uid'],'ismember'=>1));
			}
		}

		//更新原订单票价数据
		$orderpwinfo = $orderpwmodel->fetchRow("orderid = '".$orderid."'",null,'sum( `ticketprice` * `ticketnum` ) as totalprice,sum(`ticketnum` * `ticketcoupon` ) as couponfee');
		$uporder['id'] = $orderid;
		$uporder['totalprice'] = $orderpwinfo['totalprice'];
		$uporder['couponfee'] = $ismember>0 ? $orderpwinfo['couponfee'] : 0;
		//更新订单
		if($this->order->update($uporder) === false){
			$this->showmsg($ordermodel->getError(),1);
		}
		unset($_SESSION['orderaddshow'.$_SESSION['admin_info']['id']]);
		$this->showmsg('为订单添加演出成功，继续编辑该订单。','/admin/order/edit.do?id='.$orderid);
	}

	function viewAction(){
		$id = (int)$this->_get('id',0);
		$orderinfo = $this->order->find($id);
		if(!$orderinfo){
			$this->showmsg('警告，订单信息不存在，请重新下单！',1);
		}
		if($_SESSION['admin_info']['admin_zhiwu']!=1 && $orderinfo['isget']=='x'){
			$this->order->update(array('id'=>$id,'isget'=>'d'));
			$orderinfo['isget'] = 'd';
		}
		$orderinfo['orderdate'] = date("Y年 m月 d日",$orderinfo['orderdate']);
		$orderinfo['orderfee'] = $orderinfo['totalprice']+$orderinfo['deliverprice']-$orderinfo['couponfee']-$orderinfo['accountgiftfee'];
		$orderinfo['paidfee'] = $orderinfo['accountmoney']+$orderinfo['otherpay'];
		$area_model = Load::model('area');
		$deliver_area_model = Load::model('delivery_area');
		$d_area_info = $deliver_area_model->find($orderinfo['recareaid']);
		$orderinfo['recareaname'] = $area_model->getName($d_area_info['cityid']).' - '.$d_area_info['area'].'<span style="color:#c3c3c3;">'.$d_area_info['description'].'</span>';

		$deliver_type_model = Load::model('delivery_type');
		$d_type_info = $deliver_type_model->find($orderinfo['dtypeid']);
		$orderinfo['delivertype'] = $d_type_info['dname'];
		$paytype_model = Load::model('paytype');
		$paytype_info = $paytype_model->find($orderinfo['paytypeid']);
		$orderinfo['paytype'] = $paytype_info['payname'];

		$deliverdates = array(1=>'工作日、双休日与假日均可送货',2=>'只双休日、假日送货 工作日不用送',3=>'只工作日送货 双休日、假日不用送');
		$orderinfo['deliverdate'] = $orderinfo['deliverdate']<4 ? $deliverdates[$orderinfo['deliverdate']] : $orderinfo['deliverbeizhu'];
		$orderinfo['getstatus'] = $orderinfo['isget']=='w' ? '已取消' : F::getcnName('isget'.$orderinfo['isget']);
		$orderinfo['paystatus'] = $orderinfo['ispay'] == 'ok' ? '已完成付款' : '未完成付款';
		$orderlogmodel = Load::model('order_log');
		$orderlogmodel->save(array('adminid'=>$_SESSION['admin_info']['id'],'ordernum'=>$orderinfo['ordernum'],'orderid'=>$orderinfo['id'],'actlog'=>'打印订单'));
		$this->assign('info', $orderinfo);
		//获取订单票务
		$order_pw_model = Load::model('order_pw');
		$order_pw = $order_pw_model->fetchAll("orderid=".$id);
		$this->assign('order_pw', $order_pw);
		$this->assign('userinfo',$userinfo);
		$this->display('order_print.tpl');
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$this->order->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}else{
			$this->order->remove($id);
		}
		if($this->_get('return')){
			$this->showmsg('操作成功',$this->_get('return'));
		}
		$this->showmsg('操作成功','list.do?page='.$page);
	}
}
?>