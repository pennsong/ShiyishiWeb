<?php
class admin_Model extends Model{
	function init(){
		$this->admin = Load::table('admin');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->admin->pageAll($page, $count, $url, $where, $order);
	}
	
	function find($id){
		return $this->admin->find($id);
	}

	function remove($id){
		return $this->admin->delete($id);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if($this->isError())
			return false;
		setcookie('formhash', '', -86400, '/');
		return $this->admin->save($info);
	}

	function update($info){

		if($this->isError())
			return false;
		return $this->admin->save($info);
	}
	
	function search($sql,$where = null,$order = null){		
		return $rsrow = $this->admin->queryRow($sql);
	}

	function getName($id){
		$info = $this->find($id);
		return $info['admin_name'];
	}

	function getAdminNames(){
		$cache = Load::lib('cache_file');
		if(!$row = $cache->get('adminNames')){
			$rows = $this->admin->fetchAll('admin_state=1');
			foreach($rows as $admin){
				$row[$admin['id']]['admin_name'] = $admin['admin_name'];
				$row[$admin['id']]['admin_realname'] = $admin['admin_realname'];
			}
			$cache->set('adminNames',$row);
		}
		return $row;
	}
	
	function checkinfo($info){
		header('Content-Type:text/html;charset=GB2312'); 
		if(isset($info['admin_name'])) 
		{ 
			$this->checkadmin_name($info['admin_name']);
		}
	}
	
	function checkadmin_name($admin_name){
		$res = $this->admin->fetchRow("admin_name ='".$admin_name."'");
		if($res>0) 
		{ 
			echo " <img src='/images/no.jpg' align='absmiddle'  /> 用户名已存在"; 
		}
	}

	function checkadmin_login($admin_name,$admin_pwd){
		$res = $this->admin->fetchRow("admin_name ='".$admin_name."' AND admin_password ='".md5($admin_pwd)."'");
		if(empty($res)) 
		{ 
			return false;
		}
		return $res;
	}

}
?>