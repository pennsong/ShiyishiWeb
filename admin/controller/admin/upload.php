<?php
class upload_Controller extends Controller{

	function init(){
		$this->m_types = array('venue'=>array('s'=>array(144,106),'l'=>array(250,450)));
		$this->upload = Load::lib('upload');
	}
	
	function indexAction(){
		$itemid = $this->_get('itemid',0);
		$type = $this->_get('type');
		$id = md5($_SESSION['admin_info']['id'].uniqid(rand(), true));
		$this->assign('itemid',$itemid);
		$this->assign('fid',$id);
		$this->assign('type',$type);
		$this->display();
	}

	function saveAction(){
		$m_type = $this->_get('m_type');
		if($m_type && isset($this->m_types[$m_type])){
			$this->upload->small_imags = $this->m_types[$m_type];
		}
		if($this->upload->run('file')){
			$filedata = $this->upload->data();
			$smallimg = $filedata['file_small']['s'] ? $filedata['file_small']['s'] : $filedata['file_url'];
			$filedata['file_small'] = serialize($filedata['file_small']);
			if(!empty($filedata)){
				$filesource = Load::model('files');
				$fid = $filesource->save($filedata);
			}
			echo '<script>parent.uploadSuccess("'.$fid.'","'.IMG_DOMAIN.'/'.$smallimg.'");</script>';
		}else{
			echo '<script>parent.uploadError("'.$this->lang['upload'][$this->upload->display_errors()].'");</script>';
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
			$id = $this->_get('id');
			$filesource = Load::model('files');
			if($filesource->remove($id)){
				$itemid = (int)$this->_get('itemid');
				if($itemid>0){
					$show = Load::model('show');
					$info = $show->find($itemid);
					$show->update(array('id'=>$this->_get('itemid'),'pics'=>str_replace(','.$id,'',$info['pics'])));
				}
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