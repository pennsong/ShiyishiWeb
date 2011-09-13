<?php
class uploadsimple_Controller extends Controller{

	function init(){
		$this->upload = Load::lib('upload');
		$this->m_types = array('news'=>array('s'=>array(106,78)),'tjhd'=>array('s'=>array(78,90)),'hdp'=>array('s'=>array(650,250)),'hdpx'=>array('s'=>array(108,146)),'bztj'=>array('s'=>array(78,105)),'syyg'=>array('s'=>array(78,105)));
	}
	
	function indexAction(){
		$smallimg = $this->_get('smallimg') ? urldecode($this->_get('smallimg')) : '';
		$id = md5($_SESSION['admin_info']['id'].uniqid(rand(), true));
		$this->assign('smallimg',$smallimg);
		$this->assign('fid',$id);
		$this->assign('type',$this->_get('type'));
		$this->assign('st',$this->_get('st',0));
		$this->display();
	}

	function saveAction(){
		$st = (int)$this->_get('st');
		$st = $st==1 ? true : false;
		$m_type = $this->_get('m_type');
		if($m_type && isset($this->m_types[$m_type])){
			$this->upload->small_imags = $this->m_types[$m_type];
		}
		if($this->upload->run('file',$st)){
			$filedata = $this->upload->data();
			$smallimg = $filedata['file_small']['s']&&!is_array($filedata['file_small']['s']) ? $filedata['file_small']['s'] : $filedata['file_url'];
			echo '<script>parent.uploadSuccess("'.IMG_DOMAIN.'/'.$smallimg.'","'.IMG_DOMAIN.'/'.$filedata['file_url'].'");</script>';
		}else{
			echo '<script>parent.uploadError("'.$this->upload->display_errors().'");</script>';
		}
	}

	function ajaxAction(){
		$do = $this->_get('do');
		if($do=='getprogress'){
			$loop = $this->_get('loop');
			$progress_key = $this->_get('progress_key');
			if(isset($progress_key)) {
				$status = apc_fetch('upload_'.$progress_key);
				if($status){
					echo $this->checkFile($status,$loop);
				}else{
					echo 0;
				}
			}
		}elseif($do=='remove'){
			if(1){
				echo 'success';
			}else{
				echo 'fail';
			}
		}else{
			echo '';
		}
		exit;
	}

	function checkFile($files,$loop=1){
		if($loop==1){
			$defaults = Load::conf('upload:admin');
			if(isset($defaults['max_size']) && $defaults['max_size']>0){
				if($files['total'] > $defaults['max_size']){
					return '-1';
				}
			}
			if(isset($defaults['allowed_types']) && $defaults['allowed_types']){
				$allowed_types = explode('|', strtolower($defaults['allowed_types']));
				$ext = strtolower(substr($files['filename'],strrpos($files['filename'],'.')+1));
				if(!in_array($ext,$allowed_types)){
					return '-2';
				}
			}
		}
		return ($files['current']/$files['total'])*100;
	}
}
?>