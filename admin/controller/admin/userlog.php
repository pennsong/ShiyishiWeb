<?php

class userlog_Controller extends Controller{

	function init(){
		$this->userlog = Load::model('userlog');
		$this->doactions = array('index_index'=>'访问了首页','courses_index'=>'访问了课程介绍页','course_view_view'=>'访问了课程学习视频首页','buydone_index'=>'完成了订单','download_index'=>'下载了文件','edm_index'=>'查看了邮件','jhdl_index'=>'访问了课程账号激活页面','mailunsub_index'=>'退订了邮件 ','mailunsub_rejoin'=>'重新订阅了邮件','order_index'=>'非法访问了订单处理页面','user_index'=>'非法访问了会员处理页面','help_index'=>'访问了帮助页面','about_index'=>'访问了关于我们页面','contact_index'=>'访问了联系我们页面','work_index'=>'访问了工作机会页面','pay_index'=>'进入在线支付页面','pay_yeepayback'=>'使用yeepay完成支付了订单','specialoffer_index'=>'访问了促销页面','user_reg'=>'注册成功','user_update'=>'更新会员信息','order_save'=>'下了订单','member_sactive'=>'成功开通课程并成功的激活了账号','member_eactive'=>'开通课程失败但成功的激活了账号');
	}
	
	function indexAction(){
		$this->_forward('list');
	}
	
	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['model'] = $this->_get('model');
		$s['action'] = $this->_get('action');
		$s['source'] = $this->_get('source');
		$s['onlineip'] = $this->_get('onlineip');
		$s['useremail'] = trim($this->_get('useremail'));
		$s['startdate'] = $this->_get('startdate');
		$s['enddate'] = $this->_get('enddate');
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='startdate'){
				$wheres[] = "createtime > '{$val} 00:00:00'";
			}elseif($key=='enddate'){
				$wheres[] = "createtime <= '{$val} 23:59:59'";
			}else{
				$wheres[] = "$key = '$val'";
			}
		}
		$url .= '?'.implode('&',$urls);
		$page = $this->_get('page',1);
		$rows = $this->userlog->pageAll($page, 50, $url,$wheres,'id desc');
		foreach ($rows as $key=>$val)
		{
			$logurl = str_replace("http://www.mynewlearn.com/","",$val['logurl']);
			$rows[$key]['logurl'] = $logurl ? $logurl : 'index.html';
			$rows[$key]['dothing'] = '<font color="blue">'.$val['useremail'].'</font> 在 <font color="gray">'.$val['createtime'].'</font> <font color="green">'.$this->doactions[$val['model'].'_'.$val['action']].'</font> <font color="black">'.$val['dothing'].'</font>';
		}
		$this->assign('s',$s);
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display('userlog_list.tpl');
	}
}
?>