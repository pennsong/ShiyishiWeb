<?php
//帮助页
class faq_Controller extends Controller{

	function init(){
		$this->faq = Load::model('faq');
		$this->faq_cat = Load::model('faq_cat');
		if(!$this->cityinfo){
			unset($_COOKIE['sys_cookie_city']);
		}
		if(F::islogin('enterp')){
			$this->logininfo = F::logininfo("enterp");
		}
	}
	
	function indexAction(){
		$where = $faqcats = array();
		$faq_cat = $this->faq_cat->fetchAll(null,'order_id asc','id,name');
		foreach($faq_cat as $k1=>$v1){
			$faqcats[$v1['id']] = $v1;
		}
		$rows = $this->faq->fetchAll($where,'order_id asc','id,subject,catid');
		foreach($rows as $key=>$val){
			if($key==0)$defaultid = $val['id'];
			$faqcats[$val['catid']]['faqs'][] = $val;
		}
		$id = (int)$this->_get('id');
		$shwomsg = false;
		if($id<=0){
			$id = $defaultid;
		}
		if(!($faqinfo = $this->faq->find($id))){
			$shwomsg = true;
		}
		if($shwomsg){
			$this->showmsg("您请求的帮助不存在！");
		}
		//$faqinfo = $this->faq->find($id);
		$this->assign('info',$faqinfo);
		$this->assign('faqs',$faqcats);
		$this->assign('pagetitle',$faqinfo['subject'].'-帮助中心');
		$this->display("faq_detail.tpl");
	}
}
?>