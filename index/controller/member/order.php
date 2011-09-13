<?php
//会员中心 我的订单
class order_Controller extends Controller{
	
	function init(){
		$this->logincheck();
		$this->user = Load::model('user');
		$this->order = Load::model('order');
		$this->order_pw = Load::model('order_pw');
		$this->show = Load::model('show');
	}
	
	function indexAction()
	{
		$uid = $this->logininfo['uid'];
		$rows = $this->order->fetchAll('uid='.$uid,'id DESC');
		$order_pw_model = Load::model('order_pw');
		foreach($rows as $key=>$val){
			$rows[$key]['orderfee'] = $val['totalprice']+$val['deliverprice']-$val['couponfee']-$val['accountgiftfee'];
			$rows[$key]['paidfee'] = $val['accountmoney']+$val['otherpay'];
			$rows[$key]['getstatus'] = $val['isget']=='w' ? '已取消' : F::getcnName('isget'.$val['isget']);
			$rows[$key]['paystatus'] = $val['ispay'] == 'ok'||$val['isget']=='y' ? '完成付款' : '还需付款';
			$pws = $order_pw_model->fetchAll("orderid=".$val['id']);
			foreach($pws as $pw){
				$pw['totalprice'] = $pw['ticketnum'] * $pw['ticketprice'];
				$pw['thumburl'] = $this->show->getThumbUrlById($pw['showid']);
				$rows[$key]['order_pw'][] = $pw;
			}
		}
		
		$myinfo = $this->user->find($uid);
		$this->assign('myinfo',$myinfo);
		$this->assign('pagetitle','我的订单');
		$this->assign('crumb','我的订单');
		$this->assign('orders',$rows);
		$this->display();
	}

	function viewAction(){
		$id = (int)$this->_get('id',0);
		$orderinfo = $this->order->find($id);
		if(!$orderinfo){
			$this->showmsg('警告，订单信息不存在，请重新下单！',1);
		}
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

		$this->assign('info', $orderinfo);
		//获取订单票务
		$order_pw_model = Load::model('order_pw');
		$order_pw = $order_pw_model->fetchAll("orderid=".$id);
		$this->assign('order_pw', $order_pw);
		//获取个人账户
		$userinfo = $this->user->find($this->logininfo['uid']);
		$this->assign('userinfo',$userinfo);
		$this->assign('pagetitle','订单详情');
		$this->assign('crumb','订单详情');
		$this->display('order_detail.tpl');
	}
}
?>
