<?php
class purview_Model extends Model{
	function init(){
		$this->purview = Load::table('purview');
		$this->cache = Load::lib('cache_file');
	}

	/*
	$type=1 一维数组， $type=2 多维数组
	*/
	function children($parentid, $maxdepth = 0, $type = 1, $depth = 1, $all = array()){
		if($maxdepth > 0 && $depth > $maxdepth){
			return $all;
		}
		$pre_name = '';
		for($i=1;$i < $depth;$i++){
			if($i == 1){
				$pre_name = '&nbsp; |--';
				continue;
			}
			$pre_name = '&nbsp; | &nbsp;'.$pre_name;
		}
		$depth++;
		$rows = $this->purview->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['purview_name'];
			if($type == 1){
				$all[$row['id']] = $row;
				$all = $this->children($row['id'], $maxdepth, $type, $depth, $all);
			}else{
				$row['children'] = $this->children($row['id'], $maxdepth, $type, $depth);
				$all[$row['id']] = $row;
			}
		}
		return $all;
	}

	function all(){
		$rows = $this->children(0);
		return $rows;
	}

	//function pageAll($count){
		//return $this->purview->pageAll(null, null, $count, $_GET['page']);
	//}

	function find($id){
		return $this->purview->find($id);
	}

	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子菜单');
			return false;
		}
		$this->cache->remove();
		return $this->purview->delete($id);
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->purview->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->cache->remove();
		return true;
	}

	function fetchRow($where){
		return $this->purview->fetchRow($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if(!$info['purview_name']){
			$this->setError('菜单名字不能为空');
		}

		if($this->isError())
			return false;

		$this->cache->remove();
		setcookie('formhash', '', -86400, '/');
		return $this->purview->save($info);
	}

	function save2($info){
		return $this->purview->save($info);
	}

	function getName($id){
		$info = $this->find($id);
		return $info['purview_name'];
	}
}
?>