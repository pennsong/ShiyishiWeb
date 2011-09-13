<?php
class contract_Controller extends Controller{
	
	function init(){
		$this->contract = Load::model('contract');
		$this->conf_db = Load::conf('db');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->user = Load::model('e_user');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$page = intval($this->_get('page',1));
		$status = intval($this->_get('status',1));
		$url = $this->getPageUrl().'/';
		$orderby = " createdate desc ";

		if($status==1){
			$where .= "  startdate <=".time()." and enddate>=".time() ;
			$url .= "?statuss=1";
		}elseif($status==2){
			$where .= " enddate<=".time() ;
			$url .= "?statuss=2";
		}elseif($status==3){
			$where .= "" ;
			$url .= "?statuss=3";
		}else{

		}

		$rows = $this->contract->pageAll($page, 25, $url,$where,$orderby);
		$this->assign('page',$page);
		$this->assign('status',$status);
		$this->assign('rows',$rows);
		$this->display('contract_list.tpl');
	}

	function editAction(){
		$id =  $this->_get('id',0);
		$id = intval($id);
		$contract = $this->contract->find($id);
		$company = $this->user->fetchAll(" username !='' and password != ''");
		$contract['startdate'] = date("Y-m-d",$contract['startdate']);
		$contract['enddate'] = date("Y-m-d",$contract['enddate']);
		$this->assign('company',$company);
		$this->assign('info',$contract);
		$this->display('contract_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		$info['startdate'] = strtotime($info['startdate']);
		$info['enddate'] = strtotime($info['enddate']);
		if($info['id']){
			unset($info['createdate']);
		}else{
			$info['word'] = $info['wordall'];
			$info['video'] = $info['videoall'];
		}
		$info['post'] = 100;
		$info['postall'] = 100;
		if(($uid = $this->contract->save($info)) === false){
			$this->showmsg($this->contract->getError(),1,"380");
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$company = $this->user->fetchAll(" username !='' and password != ''");
		$this->assign('company',$company);
		$this->display('contract_info.tpl');
	}

	function removeAction(){
		$id =  $this->_get('id',0);
		$ids =  $this->_get('ids');
		$id = intval($id);
		if($id){
			$this->contract->remove($info);
			$this->showmsg('操作成功','list.do');
		}
		if(!empty($ids)){
			$id_str = implode(",",$ids);
			$sql = " delete from ".$this->dbpre."contract  where id in (".$id_str.")";
			$rows = $this->contract->queryAll($sql);
			$this->showmsg('操作成功','list.do');
		}
	}

}
?>
