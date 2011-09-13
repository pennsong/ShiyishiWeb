<?php
class files_Model extends Model{
	function init(){
		$this->files = Load::table('files');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->files->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->files->find($id);
	}
	
	function all(){		
		return $this->files->fetchAll();
	}
	function remove($id){
		$info = $this->find($id);
		if($info){
			$imgpath = APP_UPLOAD_DIR.'/';
			$filepath = $imgpath.$info['file_url'];
			if(file_exists($filepath)){
				unlink($filepath);
				$file_small = @unserialize($info['file_small']);
				if(!empty($file_small)){
					foreach($file_small as $k=>$v){
						$img = $imgpath.$v;
						if(file_exists($img)){
							unlink($img);
						}
					}
				}
			}
			return $this->files->delete($id);
		}else{
			return false;
		}
		
	}

	function getfiles($where=null){
		if(!$where)return array();
		$rows = $this->files->fetchAll($where);
		if(empty($rows))return array();
		foreach($rows as $key=>$val){
			$val['file_small'] = unserialize($val['file_small']);
			$rows[$key] = $val;
		}
		return $rows;
	}

	function updateBy($data,$where){
		return $this->files->updateBy($data,$where);
	}

	function save($info){
		return $this->files->save($info);
	}
}
?>