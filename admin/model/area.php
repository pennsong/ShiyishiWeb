<?php
class area_Model extends Model{
	protected $_parent = array();
	
	function init(){
		$this->area = Load::table('area');
		$this->cache = Load::lib('cache_file');
		$this->memkey = 'area';
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
		$rows = $this->area->findBy($parentid, 'parent_id');
		foreach($rows as $row){
			$row['prename'] = $pre_name.$row['area_name'];
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

	function find($id){
		return $this->area->find($id);
	}

	function getName($id){
		$info = $this->find($id);
		return $info['area_name'];
	}

	function getzxs(){
		return $this->fetchAll('parent_id<0','order_id asc');
	}

	function fetchAll($where = null, $order = null, $fields = null, $limit=null,$groupby = null){
		return $this->area->fetchAll($where, $order, $fields, $limit,$groupby);
	}

	function fetchRow($where = null, $order = null){
		return $this->area->fetchRow($where, $order);
	}
	
	function remove($id){
		if($this->children($id)){
			$this->setError('请先删除子地区');
			return false;
		}
		$return = $this->area->delete($id);
		$this->flushcache();
		return $return;
	}

	function order($order){
		foreach($order as $id => $orderid){
			$this->area->update(array('id' => $id, 'order_id' => $orderid));
		}
		$this->flushcache();
		return true;
	}

	function update($info){
		return $this->area->update($info);
	}

	function save($info){
		if($_POST['formhash'] != $_COOKIE['formhash']){
			$this->setError('对不起，您提交的表单已经过期，请重新提交！');
			return false;
		}

		if(!$info['area_name']){
			$this->setError('地区中文名字不能为空');
		}

		if(!$info['area_en']){
			$this->setError('地区英文名字不能为空');
		}
		
		if (!$this->check_area_en_E($info['id'],$info['area_en']))
		{
			$this->setError('地区英文名字已存在');;
		}

		if($this->isError())
			return false;

		setcookie('formhash', '', -86400, '/');
		$return = $this->area->save($info);
		$this->flushcache();
		return $return;
	}
	
	function _get_parent($id){
		$rs = $this->find($id);
		if(is_array($rs)){
			$this->_parent[] =$rs;
		}else {
			return false;
		}	
		if($rs['parent_id']){
			$this->_get_parent($rs['parent_id']);
		}
		asort($this->_parent);
		return $this->_parent;
	}
	
	function getcache($key=null){
		if(!$key) $key = $this->memkey;
		if(!$row = $this->cache->get($key)){
			$row = $this->flushcache($key,true);
		}
		return $row;
	}

	function flushcache($memkey='',$return=false){
		if(!$memkey) $memkey = $this->memkey;
		$newdata = array();
		$row = $this->area->fetchAll(null,'parent_id asc,order_id asc,id asc');
		foreach($row as $key=>$val){
			if($val['parent_id']!=0 && $val['type']>0){
				$newdata['area'][$val['id']] = array('id'=>$val['id'],'name'=>$val['area_name'],'en'=>$val['area_en'],'type'=>$val['type']);
			}
			if($val['parent_id']<=0){
				$newdata['area_province'][$val['id']] = array('id'=>$val['id'],'name'=>$val['area_name'],'en'=>$val['area_en']);
			}else{
				$newdata['area_citys'][$val['parent_id']][$val['id']] = array('id'=>$val['id'],'name'=>$val['area_name'],'en'=>$val['area_en']);
			}
		}
		$this->cache->set('area' ,$newdata['area']);
		$this->cache->set('area_province' ,$newdata['area_province']);
		$this->cache->set('area_citys' ,$newdata['area_citys']);
		if($return) return $newdata[$memkey];
	}
	//add by penn copy from index/model/area.php's getNameByIdsEn to replace getNameByIds	
	function getNameByIds($ids,$limit=2){
		if(!$ids)return null;
		$tmparr = array_unique(explode(',',trim($ids,",")));
		$names = array();
		$i=1;
		foreach($tmparr as $vid){
			if($i>$limit)break;
			if($vid<=0)continue;
			$name = $this->getName($vid);
			if($name)
				$names[] = $name;
			$i++;
		}
		return implode("，",$names);
	}

	function check_area_en($area_id,$area_en){
		if (!$area_en){
			echo " <img src='/images/no.jpg' align='absmiddle'  /> 英文名称不能为空";
			return false;
		}
		if ($area_id){
			$rows = $this->fetchAll("area_en = '$area_en' and id!=$area_id",'order_id');
		}else{
			$rows = $this->fetchAll("area_en = '$area_en'",'order_id');
		}
		if(count($rows)>0){
			echo " <img src='/images/no.jpg' align='absmiddle'  /> 英文名称已存在";
			return false;
		}else{
			echo " <img src='/images/yes.jpg' align='absmiddle'  />"; 
			return true;
		}			
	}
	
	function check_area_en_E($area_id,$area_en){
		if (!$area_en){
			return false;
		}
		if ($area_id){
			$rows = $this->fetchAll("area_en = '$area_en' and id!=$area_id",'order_id');
		}else{
			$rows = $this->fetchAll("area_en = '$area_en'",'order_id');
		}
		if(count($rows)>0){
			return false;
		}else{
			return true;
		}			
	}
}
?>