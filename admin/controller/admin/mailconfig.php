<?php
/*
* 邮件发送接口配置 @Author Guoli
*/
class mailconfig_Controller extends Controller{

	function init(){
		$this->mailconfig = Load::model('mailconfig');
	}
	
	function indexAction(){
		$this->_forward('edit');
	}

	function editAction(){
		$mtype = $this->_get('mtype','local');
		$rows = $this->mailconfig->fetchAll("m_type='{$mtype}'");
		$this->assign('mtype', $mtype);
		$this->assign('rows', $rows);
		$this->display('mailconfig.tpl');
	}

	function saveAction(){
		$mtype = $this->_get('mtype','local');
		$data = $this->_get('info');
		foreach($data as $id=>$da){
			$this->mailconfig->update(array('id'=>$id,'m_value'=>$da));
		}
		$this->mailconfig->flushcache();
		$this->showmsg('操作成功','/admin/mailconfig.do');
	}
}
?>