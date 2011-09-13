<?php
class menu_Model extends Model{
	function init(){
		$this->menu = Load::table('admin_menu');
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
		$rows = $this->menu->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['menu_name'];
			if($type == 1){
				$all[] = $row;
				$all = $this->children($row['id'], $maxdepth, $type, $depth, $all);
			}else{
				if($depth==4)
				{
					if($_SESSION['admin_info']['admin_zhiwu']==1 || in_array($row['menu_link'],$this->adminMenus())){
						$row['children'] = $this->children($row['id'], $maxdepth, $type, $depth);
						$all[] = $row;
					}
				}
				else
				{
					$row['children'] = $this->children($row['id'], $maxdepth, $type, $depth);
					$all[] = $row;
				}
			}
		}
		return $all;
	}

	function all(){
		$rows = $this->children(0);
		return $rows;
	}

	//function pageAll($count){
		//return $this->menu->pageAll(null, null, $count, $_GET['page']);
	//}

	function find($id){
		return $this->menu->find($id);
	}

	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子菜单');
			return false;
		}
		$this->flushcache();
		return $this->menu->delete($id);
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->menu->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->flushcache();
		return true;
	}

	function fetchRow($where){
		return $this->menu->fetchRow($where);
	}
	
	function fetchAll($where){
		return $this->menu->fetchAll($where);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if(!$info['menu_name']){
			$this->setError('菜单名字不能为空');
		}

		if($this->isError())
			return false;

		setcookie('formhash', '', -86400, '/');
		$return = $this->menu->save($info);
		$this->flushcache();
		return $return;
	}

	function update($info){
		return $this->menu->update($info);
	}

	function getMenuKeyNames($key){
		if(!$row = $this->cache->get($key)){
			$rows = $this->fetchAll("menu_link!=''","order_id ASC");
			foreach($rows as $k=>$v){
				$model = substr($v['menu_link'],strrpos($v['menu_link'],"/")+1,-3);
				$row[$model] = $v['menu_name'];
			}
			$this->cache->set($key,$row);
		}
		return $row;
	}

	function getcache(){
		//if(!$row = $this->cache->get('menus_'.$_SESSION['admin_info']['id'])){
			$row = $this->flushcache('menus_'.$_SESSION['admin_info']['id'],true);
		//}
		return $row;
	}

	function flushcache($memkey='',$return=false){
		if(!$memkey) $memkey = 'menus_'.$_SESSION['admin_info']['id'];
		$rows = $this->children(0,3,2);
		if($_SESSION['admin_info']['admin_zhiwu']!=1){
			foreach($rows as $k1=>$v1)
			{
				if(empty($v1['children'])){
					unset($rows[$k1]);
				}else{
					foreach($rows[$k1]['children'] as $key=>$val)
					{
						if(empty($val['children']))
							unset($rows[$k1]['children'][$key]);
					}
				}
			}
			$newrows = array();
			$newrows[0]['menu_name']=$newrows[0]['prename']='管理菜单';
			foreach($rows as $k2=>$v2)
			{
				if(!empty($v2['children'])){
					foreach($v2['children'] as $v3){
						$newrows[0]['children'][] = $v3;
					}
				}
			}
			unset($rows);
		}else{
			$newrows = $rows;
		}
		$this->cache->reset($memkey,$newrows);
		if($return) return $newrows;
	}

	function adminMenus(){
		//根据权限加载左侧操作菜单
		$auth = $_SESSION['admin_info']['auth'];
		if(is_array($auth['purview'])){
			foreach($auth['purview'] as $key=>$val)
			{
				if(!empty($val))
					$pck[] = '/'.str_replace("admin_","admin/",$key).".do";
			}
		}
		else {
			$this->setError('当前管理员还未分配权限。');
			return false;
		}
		return $pck;
	}

	function getName($id){
		$info = $this->find($id);
		return $info['menu_name'];
	}

	function getperviewid($id){
		$info = $this->find($id);
		return $info['has_im'];
	}
}
?>