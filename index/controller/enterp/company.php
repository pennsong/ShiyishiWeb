<?php
class company_Controller extends Controller{
	
	function init(){
		$this->logininfo = F::logininfo("enterp");
		$this->logincheck("enterp");
		$this->subcompany = Load::model('subcompany');
		$this->e_user = Load::model('e_user');
		$this->uid = $this->logininfo['uid'];
		$this->conf_db = Load::conf('db');
		$this->conf = Load::conf('conf');
		$this->dbpre = $this->conf_db['default']['prefix'];
		$this->dtdata = $this->cache->getDustrytypeDatas('dustrytype_level1');//一级行业
		$this->adata = $this->cache->getAreaDatas('area_province');//省份
		$this->companyscales = $this->conf['companyscales'];
		$this->companytypes = $this->conf['companytypes'];
		$this->companyproperties = $this->conf['companyproperties'];
		$this->editor = Load::lib('editor');
	}
	
	function indexAction(){
		$this->display('company_list.tpl');
	}

	function infoAction(){
		$user = $this->e_user->find($this->uid);
		$aldatasall = $this->cache->getAreaDatas('area_citys');
		if($user['live_gnd_c']>0){
			$aldatas = $aldatasall[$user['live_gnd_p']];
			$this->assign('aldatas',$aldatas);
		}

		if(strpos($user['dustrytype'],",")===false){
			if($user['dustrytype'])
				$darray[0] = $user['dustrytype'];
		}else{
			$darray = explode(",",$user['dustrytype']);
		}

		$undtdata = array();
		$dtdata = array();
		if($darray){
			foreach($this->dtdata as $k => $v){
				if(in_array($v['id'],$darray)){
					$undtdata[] = $v;
				}else{
					$dtdata[] = $v;
				}
			}
		}else{
			$dtdata = $this->dtdata;
		}
		$user['content'] = $this->editor->create($user['info']);
		$this->assign('companyscales',$this->companyscales['cn']);
		$this->assign('companytypes',$this->companytypes['cn']);
		$this->assign('companyproperties',$this->companyproperties['cn']);
		$this->assign('adatas',$this->adata);
		$this->assign('dtdatas',$dtdata);
		$this->assign('undtdata',$undtdata);
		$this->assign('info',$user);
		$this->display('company_info.tpl');
	}

	function csaveAction(){
		$info =  $this->_get('info');
		//print_r($info);
		$info['info'] =  $this->_get('content');
		if($info){
			$user = $this->e_user->find($info['id']);
			foreach($info as $k => $v){
				$user[$k] = $info[$k];
			}
			if( $this->e_user->save($user) === false){
				$this->showmsg($this->e_user->getError(),1);
			}

			$str = "设置成功";
		}else{
			$str = "参数错误";
		}
		$this->showmsg($str,BASE_URL."/enterp/");
	}

	function listAction(){
		$page = $this->_get('page',1);
		$url = $this->getPageUrl().'/list.html';
		$orderby = " createdate desc ";
		$where = " cid = ".$this->uid." " ;
		$sql = "select * from ".$this->dbpre."subcompany 
		where ".$where." order by ".$orderby;
		$total = count($this->subcompany->queryAll($sql));
		$sql .= " limit ".(($page-1)*25).", 25 ";
		$rows = $this->subcompany->queryAll($sql);

		$totalpage = @ceil($total / 25);
		$this->assign('totalpage',$totalpage);
		$this->assign('total',$total);
		$this->assign('page',$page);
		$this->assign('url',$url);
		$this->assign('subcompany',$rows);
		$this->display('company_list.tpl');
	}

	function addAction(){
		$id =  $this->_get('id',0);
		$id = intval($id);
		if($rows = $this->subcompany->fetchAll(" id=".$id." and cid = ".$this->uid)){
			$this->assign('subcompany',$rows[0]);
		}
		$this->display('subcompany.tpl');
	}

	function delAction(){
		$id =  $this->_get('id',0);
		$id = intval($id);
		if($id){
			if($this->subcompany->fetchAll(" id=".$id." and cid = ".$this->uid)){
				$rows = $this->subcompany->remove($id);
				$str = "该分支添加成功";
			}else{
				$str = "参数错误";
			}
		}else{
			$str = "参数错误";
		}
		$this->showmsg($str,BASE_URL."/enterp/company/list.html");
	}

	function saveAction(){
		$PositionID = intval($this->_get('PositionID',0));
		$name =  $this->_get('name',"");
		if($PositionID){
			$info['id'] = $PositionID;
			$info['cid'] = $this->uid;
			$info['createdate'] = '';
			$info['name'] = $name;
			$rows = $this->subcompany->save($info);
			$str = "该分支修改成功";
		}else{
			if($name){
				$info['cid'] = $this->uid;
				$info['createdate'] = '';
				$info['name'] = $name;
				$rows = $this->subcompany->save($info);
				$str = "该分支添加成功";
			}else{
				$str = "参数错误";
			}
		}
		$this->assign('result',$str);
		$this->display('subcompanyAdd.tpl');
		//$this->_header(BASE_URL."/enterp/company/add.html");
		//$this->showmsg($str,BASE_URL."/enterp/company/add.html");
	}

	function uploadAction(){
		$script = "";
		if(isset($_FILES['file'])&&$_FILES['file']['size']>0){
			$this->upload = Load::lib('upload');
			$this->upload->small_imags = array('logo'=>array(192,60));
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
		$this->display('company_upload.tpl');
	}
}
?>
