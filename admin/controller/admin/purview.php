<?php

class purview_Controller extends Controller{

	function init(){
		$this->purview = Load::model('purview');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$rows = $this->purview->all();
		$this->assign('admininfo',$_SESSION['admin_info']);
		$this->assign('rows', $rows);
		$this->display();
	}

	function orderAction(){
		$orderid = $this->_get('orderid');
		if($this->purview->order($orderid) === false){
			$this->showmsg($this->purview->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function addAction(){
		$purviews = $this->purview->children(0,2);
		$this->assign('purviews', $purviews);
		$this->display('purview_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->purview->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$purviews = $this->purview->children(0,2);
		$this->assign('purviews', $purviews);
		$this->assign('info', $info);
		$this->display('purview_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if($this->purview->save($info) === false){
			$this->showmsg($this->purview->getError(),1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function removeAction(){
		$id = $this->_get('id');
		if(!$rowCount = $this->purview->remove($id)){
			if($rowCount === false)
				$this->showmsg($this->purview->getError(),1);
			else
				$this->showmsg('您请求的数据不存在',1);
		}
		$this->showmsg('操作成功','list.do');
	}

	function createAction(){
		$menu = Load::model('menu');
		$conf = Load::conf('conf');
		$config = @Load::conf('route');
		
		$noallow = array('index','save','checkinfo','done');
		$noallowmodel = array('ajax');
		$actionname = $conf['admin_action'];
		$dir = APP_CTRL_DIR.DIRECTORY_SEPARATOR."admin";
		$directory = dir($dir); 
		$i=1;
		while($entry = $directory->read()) {
			$filename = $dir.'/'.$entry; 
			if(is_file($filename)) {
				$fcontrol = str_replace(".php","",$entry);
				$fp = fopen($filename,'rb');
				$copy_content = fread($fp, filesize ($filename));
				preg_match_all('/function (.*)Action()/', $copy_content, $out1);
				if(!empty($out1[1]))
				{
					foreach($out1[1] as $key=>$val)
					{
						if(!in_array($val,$noallow) && $val!='(.*)')
						{
							$action[] = $val;
						}
					}
				}
				fclose($fp);
				$files[$fcontrol] = $action;
				unset($action);
			}
		}
		$directory->close(); 
		$menus = $menu->all();
		foreach($menus as $key=>$val){
			if($val['has_im']==0){
				if($val['menu_link']){
					$plink = substr($val['menu_link'],strrpos($val['menu_link'],"/")+1,-3);
				}else{
					$plink = "";
				}
				if($val['parent_id']==0){
					$parentid = 0;
				}else{
					$parentid = $menu->getperviewid($val['parent_id']);
				}
				$purviewid = $this->purview->save2(array('purview_name'=>$val['menu_name'],'purview_link'=>$plink,'parent_id'=>$parentid,'order_id'=>$val['order_id']));

				$menu->update(array('id'=>$val['id'],'has_im'=>$purviewid));
			}else{
				$purviewid = $val['has_im'];
			}

			if($val['menu_link']){
				$path = trim($val['menu_link'], '/');
				$rules = (array) $config['rule'];
				foreach($rules as $rule){
					$newpath = preg_replace("/$rule[0]/i", $rule[1], $path);
					if($newpath != $path){
						$path = $newpath;
						break;
					}
				}
				if ($pos = strrpos($path, '.')) {
					$path = substr($path, 0, $pos);
				}
				$path = explode('/', $path);
				$actions = array();
				$actions = isset($files[$path[1]]) ? $files[$path[1]] : array();
				foreach($actions as $key=>$act){
					$purviewinfo = $this->purview->fetchRow("parent_id='{$purviewid}' AND purview_link='{$act}'");			
					if(!$purviewinfo)
					{
						$name = $actionname[$act] ? $actionname[$act] : $act;
						$this->purview->save2(array('purview_name'=>$name,'purview_link'=>$act,'parent_id'=>$purviewid,'order_id'=>$key));
					}
				}
			}

		}
		$this->showmsg('操作成功','list.do');
		exit;
	}
}
?>