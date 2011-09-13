<?php
class duty_Model extends Model{
	function init(){
		$this->duty = Load::table('admin_duty');
		$this->cache = Load::lib('cache_file');
		$this->key = 'duty';
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
		$rows = $this->duty->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['duty_name'];
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

	function fetchAll($where,$order='order_id ASC'){
		return $this->duty->fetchAll($where, $order);
	}

	function find($id){
		return $this->duty->find($id);
	}

	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子菜单');
			return false;
		}
		$this->cache->remove($this->key);
		return $this->duty->delete($id);
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->duty->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->cache->remove($this->key);
		return true;
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}
		if(isset($info['duty_name'])){
			if(!$info['duty_name']){
				$this->setError('分组名字不能为空');
			}
		}

		if($this->isError())
			return false;

		$this->cache->remove($this->key);
		setcookie('formhash', '', -86400, '/');
		return $this->duty->save($info);
	}

	//获取组权限
	function getDutyAuth($group = '')
	{
		// get auth purview
		if(empty($group))return array();
		$authGroup = $this->duty->fetchRow("duty_link = '{$group}'");
		$authGroup['purview'] = unserialize($authGroup['purview']);
		return $this->getDutypurview($authGroup['purview']);
	}

	function getDutypurview($auth)
	{
		$authGroup['purview'] = $auth;
		try {
		$ext = array();
		if (is_array($authGroup['purview'])) {
			foreach ($authGroup['purview'] as $k=>$v)
			{
				foreach ($v as $vk=>$val){
					$val = str_ireplace('，',',',$val);
					if (strpos($val,',')) {
						$ext = explode(',',$val);
						unset($authGroup['purview'][$k][$vk]);
						$authGroup['purview'][$k] = F::array_values_merge($ext,$authGroup['purview'][$k]);
					}
				}
			}
		}
		}catch (Exception $e){};
		return $authGroup;
	}
	
	//获取组信息
	function getDuty($id = 0)
	{
		$rs = $this->duty->fetchRow("id = $id");
	
		if ($rs) {
			$auth = $this->getDutyAuth($rs['duty_link']);
			$rs['purview'] = $auth['purview'];
			return $rs;
		}else {
			return $this->getDutyAuth('guest');
		}
		
	}

	function getcache($key=null){
		if(!$key)$key = $this->key;
		if(!$row = $this->cache->get($key)){
			$row = $this->flushcache($key,true);
		}
		return $row;
	}

	function flushcache($key='',$return=false){
		if(!$key)$key = $this->key;
		$rows = $this->fetchAll(null,"parent_id asc,order_id ASC");
		$newdata = array();
		foreach($rows as $k=>$v){
			$newdata[$this->key][$v['id']] = $v['duty_name'];
			$newdata['duty_one'][$v['id']] = $v['duty_name'];
		}
		$this->cache->set($this->key,$newdata[$this->key]);
		$this->cache->set('duty_one',$newdata['duty_one']);
		if($return) return $newdata[$key];
	}

	function getName($id){
		$info = $this->find($id);
		return $info['duty_name'];
	}
}
?>