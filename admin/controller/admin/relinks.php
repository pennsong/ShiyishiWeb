<?php
class relinks_Controller extends Controller{

	function init(){
		$this->relinks = Load::model('relink');
		$this->eUser = Load::model('e_user');
		$this->assign('status',$this->flstatus);
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$page = $this->_get('page',1);
		$rows = $this->relinks->pageAll($page, 20, $url,'',' id desc ');
		foreach($rows as &$item)
		{
			$companyInfo = $this->eUser->find($item['id']);
			$item['company'] = $companyInfo['company'];
			$item['id'] = $companyInfo['id'];
			$item['logo'] = $companyInfo['logo'];			
		}
		$this->assign('page',$page);
		$this->assign('rows', $rows);
		$this->display();
	}

	function addAction(){
		$companyList = $this->eUser->fetchAllCompanyName();
		$this->assign('companyList', $companyList);
		$this->display('relinks_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->relinks->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$this->assign('info', $info);
		$this->display('relinks_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->relinks->save($info) === false){
			$this->showmsg($this->relinks->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->relinks->order($orderid) === false){
			$this->wajaxmsg($this->relinks->getError(),1);
		}
		$this->wajaxmsg('操作成功',1);
	}

	function removeAction(){
		$id = intval($this->_get('id'));
		$relinks = $this->relinks->find($id);
		$dir = ROOT_PATH.'/data/'.ATTACHMENT_DIR.str_replace(IMG_DOMAIN,'',$relinks['img']);
		if(file_exists($dir)){
			unlink($dir);
		}
		if(!$rowCount = $this->relinks->remove($id)){
			if($rowCount === false)
				$this->wajaxmsg($this->relinks->getError());
			else
				$this->wajaxmsg('您请求的数据不存在');
		}
		$this->wajaxmsg('删除成功',1);
	}

	function uploadAction(){
		$script = "";
		if(isset($_FILES['file'])&&$_FILES['file']['size']>0){
			$this->upload = Load::lib('upload');
			$this->upload->small_imags = array('logo'=>array(192,60));
			$this->upload->edit_upload_path('users');
			if($this->upload->run('file')){
				$filedata = $this->upload->data();
				$img = IMG_DOMAIN."/".$filedata['file_small']['logo'];
				$script = '<script type="text/javascript">window.parent.document.getElementById("photo").value="'.$img.'";window.parent.document.getElementById("uploadimg").src="'.$img.'";</script>';
				//exit;
			}else{
				//echo '<script>parent.uploadError("'.$this->upload->display_errors().'");</script>';
			}
		}
		$this->assign('script',$script);
		$this->display('relinks_upload.tpl');
	}

}
?>