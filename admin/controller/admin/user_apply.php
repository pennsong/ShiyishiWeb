<?php
class user_apply_Controller extends Controller{

	function init(){
		$this->user_account = Load::model('user_account');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$statusFilter = $this->_get('statusFilter', 0);
		$summary = $this->_get('summary', 0);
		if ($statusFilter == 3 && $summary == 1)
		{
			$sql = "SELECT SUM(money) totalMoney, COUNT(*) totalTime FROM zp_user_account WHERE status=3;";
			$totalRow = $this->user_account->queryAll($sql);
						
			$sql = 	"SELECT DATE( createdate ) dateOnly, SUM(money) dayMoney, COUNT(*) times";
			$sql .=	" FROM zp_user_account";
			$sql .=	" WHERE status = 3";
			$sql .=	" GROUP BY dateOnly;";
			$rows = $this->user_account->queryAll($sql);

			$this->assign('totalRow', $totalRow);
			$this->assign('rows', $rows);
			$this->display("user_apply_list_finished.tpl");
		}
		else
		{
			$url = $this->getPageUrl().'/list.do?statusFilter='.$statusFilter;
			$s['uid'] = (int)$this->_get('uid');
			$s['s_date'] = $this->_get('s_date');
			$s['e_date'] = $this->_get('e_date');
			$page = $this->_get('page',1);
			$urls = $wheres = array();
	//		$wheres[] = $s['uid']>0 ? 'a.status>0 and doact=-1' : 'a.status=1 and doact=-1';
			$wheres[] = "a.status = $statusFilter and (doact = 0 or doact = -1)";
			foreach($s as $key=>$val){
				if(!$val)continue;
				$urls[] = $key.'='.$val;
				if($key=='s_date'){
					$wheres[] = "a.createdate >= '".$val.' 00:00:00'."'";
				}elseif($key=='e_date'){
					$wheres[] = "a.createdate <= '".$val.' 23:59:59'."'";
				}else{
					$wheres[] = "a.{$key} = '$val'";
				}
			}
			$url .= empty($urls) ? '' : '?'.implode('&',$urls);
			$rows = $this->user_account->pageUnionAll($page, 100, $url,'user','a.uid=b.id',$wheres,'a.id desc','a.*,b.email');
			if($s['uid']<=0)$s['uid']='';
			$this->assign('statusFilter', $statusFilter);
			$this->assign('page',$page);
			$this->assign('s',$s);
			$this->assign('rows', $rows);
			$this->display();
		}
	}

	function excelAction(){
		$file = 'bank_'.date("Ymd");
		$str_header = $str_content = "";
		$str_header = "银行名称,开户行,账号,姓名,金额\r";
		$user_bankmodel = Load::model('user_bank');
		$rows = $this->user_account->fetchAll("status=2 and doact=-1",'id desc',null,500);
		foreach($rows as $row){
			$bankinfo = $user_bankmodel->getBankByUid($row['uid']);
			$str_content .= $bankinfo['bank_name'].",";
			$str_content .= $bankinfo['bank_kaihu'].",";
			$str_content .= $bankinfo['card_number'].",";
			$str_content .= $bankinfo['card_user'].",";
			$str_content .= ($row['money']/10)."\r";
		}
		header("Content-type:application/vnd.ms-excel");
		header("Content-Disposition:attachment;filename={$file}.csv"); 
//		echo @iconv("utf-8",'gb2312',$str_header.$str_content);
		echo @iconv("utf-8",'gb2312',$str_content);
		exit();
	}

	function checkAction(){
		$ids = $this->_get('operationList');
		$status = $this->_get('status', 0);
		$reason = $this->_get('reason', '');
		if($ids){
				$ids = explode(",",$ids);
		}
		else
		{
			$ids = array();
		}
		if(empty($ids)){
			$id = (int)$this->_get('itemId',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		if($status==2 || $status==3){
			$i=1;
			$this->user_account->update(array('status'=>$status),"id IN (".implode(',',$ids).")");
			$this->wajaxmsg(($i>0 ? '操作成功' : '操作失败'),1);
		}else{
			$status=0;
			$i=0;
			foreach($ids as $id){
				$ainfo = $this->user_account->find($id);
				$tmpReason = $ainfo['aclog'];
				$minfo = array('uid'=>$ainfo['uid'],'xid'=>0,'money'=>$ainfo['money'],'doact'=>1,'aclog'=>'驳回:'.$reason,'status'=>0);
//				if(!($this->user_account->save($minfo) === false)){
				if (true){
					$this->user_account->update(array('status'=>0, 'doact'=>0, 'aclog'=>$tmpReason.'-驳回:'.$reason),"id = {$id}");
					$i++;
				}
			}
			$this->wajaxmsg(($i>0 ? '操作成功' : '操作失败'),1);
		}

	}
}
?>