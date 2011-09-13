<?php
class contract_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
		$this->contract = Load::model('contract');
		$this->uid = $this->logininfo['uid'];
		$this->username = $this->logininfo['username'];
		$this->conf_db = Load::conf('db');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->resume = Load::model('resume');
	}
	
	function indexAction(){
		$page = intval($this->_get('page',1));
		$status = intval($this->_get('status',1));
		$url = $this->getPageUrl().'/';
		$orderby = " createdate asc ";
		$where = " uid = ".$this->uid." " ;

		if($status==1){
			$where .= " and  startdate <=".time()." and enddate>=".time() ;
			$url .= "?statuss=1";
		}elseif($status==2){
			$where .= " and enddate<=".time() ;
			$url .= "?statuss=2";
		}elseif($status==3){
			$where .= "" ;
			$url .= "?statuss=3";
		}else{

		}
		$sql = "select * from ".$this->dbpre."contract 
		where ".$where." order by ".$orderby;
		$total = count($this->contract->queryAll($sql));
		$sql .= " limit ".(($page-1)*25).", 25 ";
		$rows = $this->contract->queryAll($sql);

		$totalpage = @ceil($total / 25);
		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('url',$url);
		$this->assign('status',$status);
		$this->assign('contract',$rows);
		$this->display('contract.tpl');
	}

	function infoAction(){
		$id =  $this->_get('id',0);
		$id = intval($id);
		$page = intval($this->_get('page',1));
		$url = $this->getPageUrl().'/?id='.$id;

		if($rows = $this->contract->fetchAll(" id=".$id." and uid = ".$this->uid)){

			$this->assign('info',$rows[0]);
			$where = " posttime >=".$rows[0]['startdate']." and posttime<=".$rows[0]['enddate'] ;
			$sql = "select * from ".$this->dbpre."resume_download 
			where ".$where." order by posttime asc";
			$total = count($this->contract->queryAll($sql));
			$sql .= " limit ".(($page-1)*25).", 25 ";
			$rows = $this->contract->queryAll($sql);

			if($rows){
				foreach($rows as $k => $v){
					$resume = $this->resume->find($v['rid']);
					$rows[$k]['rname'] = $resume['uname'];
					$rows[$k]['username'] = $this->logininfo['username'];
					$rows[$k]['company'] = $this->logininfo['company'];
				}
			}


			$totalpage = @ceil($total / 25);
			$this->assign('totalpage',$totalpage);
			$this->assign('total',$total);
			$this->assign('page',$page);
			$this->assign('url',$url);
			$this->assign('list',$rows);

			$this->display('contract_list.tpl');

		}else{
			$this->showmsg("²ÎÊı´íÎó",BASE_URL."/enterp/contract/");
		}
	}
}
?>
