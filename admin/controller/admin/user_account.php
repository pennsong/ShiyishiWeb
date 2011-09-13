<?php
/*
* 用户账户系统 @Author Guoli
*/
class user_account_Controller extends Controller{

	function init(){
		$this->user_account = Load::model('user_account');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['uid'] = (int)$this->_get('uid');
		$s['username'] = trim($this->_get('username'));
		$s['s_date'] = $this->_get('s_date');
		$s['e_date'] = $this->_get('e_date');
		$page = $this->_get('page',1);
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if(!$val)continue;
			$urls[] = $key.'='.$val;
			if($key=='s_date'){
				$wheres[] = "a.createdate >= ".strtotime($val.' 00:00:00');
			}elseif($key=='e_date'){
				$wheres[] = "a.createdate <= ".strtotime($val.' 23:59:59');
			}elseif($key=='username'){
				$wheres[] = "b.username LIKE '%".$val."%'";
			}else{
				$wheres[] = "a.{$key} = '$val'";
			}
		}
		$url .= empty($urls) ? '' : '?'.implode('&',$urls);
		$rows = $this->user_account->pageUnionAll($page, 100, $url,'user','a.uid=b.id',$wheres,'a.id desc','a.*,b.username');
		foreach($rows as $key=>$row){
			$rows[$key]['aclog'] = strip_tags($row['aclog']);
		}
		$this->assign('page',$page);
		$this->assign('s',$s);
		$this->assign('rows', $rows);
		$this->display();
	}
}
?>