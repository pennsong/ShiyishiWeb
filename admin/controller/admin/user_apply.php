<?php
class user_apply_Controller extends Controller{

	function init(){
		$this->user_account = Load::model('user_account');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['uid'] = (int)$this->_get('uid');
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		$wheres[] = $s['uid']>0 ? 'a.status>0 and doact=-1' : 'a.status=1 and doact=-1';
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = "a.createdate >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = "a.createdate <= ".strtotime($val.' 23:59:59');
			}else{
				$wheres[] = "a.{$key} = '$val'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->user_account->pageUnionAll($page, 100, $url,'user','a.uid=b.id',$wheres,'a.id desc','a.*,b.email');
		if($s['uid']<=0)$s['uid']='';
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->display();
	}

	function excelAction(){
		$file = 'bank_'.date("Ymd");
		$str_header = $str_content = "";
		$str_header = "金额,银行名称,开户行,账号,姓名\r";
		$user_bankmodel = Load::model('user_bank');
		$rows = $this->user_account->fetchAll("status=1 and doact=-1",'id desc',null,500);
		foreach($rows as $row){
			$str_content .= ($row['money']/10).",";
			$bankinfo = $user_bankmodel->getBankByUid($row['uid']);
			$str_content .= $bankinfo['bank_name'].",";
			$str_content .= $bankinfo['bank_kaihu'].",";
			$str_content .= $bankinfo['card_number'].",";
			$str_content .= $bankinfo['card_user']."\r";
		}
		header("Content-type:application/vnd.ms-excel");
		header("Content-Disposition:attachment;filename={$file}.csv"); 
		echo @iconv("utf-8",'gb2312',$str_header.$str_content);
		exit();
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$status = $this->_get('status');
		$reason = $this->_get('reason', '');
		if(empty($ids)){
			$id = (int)$this->_get('itemId',0);
			if($id<=0){
				$this->wajaxmsg2('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		if($status==2 || $status==3){
			$i=1;
			$this->user_account->update(array('status'=>$status),"id IN (".implode(',',$ids).")");
		}else{
			$status=0;
			$i=0;
			foreach($ids as $id){
				$ainfo = $this->user_account->find($id);
				$minfo = array('uid'=>$ainfo['uid'],'xid'=>0,'money'=>$ainfo['money'],'doact'=>1,'aclog'=>'驳回:'.$reason,'status'=>0);
				if(!($this->user_account->save($minfo) === false)){
					$this->user_account->update(array('status'=>0),"id = {$id}");
					$i++;
				}
			}
		}
		$this->wajaxmsg2(($i>0 ? '操作成功' : '操作失败'),1);
//		$this->_forward('list');
	}
}
?>