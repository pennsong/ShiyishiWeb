<?php
class adminlog_Model extends Model{
	function init(){
		$this->adminlog = Load::table('admin_log');
	}

	function pageAll($page, $count, $url, $where = null, $order = null){
		return $this->adminlog->pageAll($page, $count, $url, $where, $order);
	}

	function find($id){
		return $this->adminlog->find($id);
	}

	function remove($id){
		$this->adminlog->delete($id);
		$adminlogext = Load::model('adminlogext');
		return $adminlogext->remove($id);
	}

	function removeBy($where){
		return $this->adminlog->removeBy($where);
	}

	function fetchRow($where){
		return $this->adminlog->fetchRow($where);
	}

	function save($info){
		if(is_array($info) && !empty($info) && !in_array($info['action'],array('index','list','add','import','edit','search'))){
			if(in_array($info['action'],array('purview','login'))&&!$_POST) return '';
			if($info['action']=='view'&&$info['model']=='adminlog') return '';
			if($info['model']=='tool_users'||$info['model']=='ajax') return '';
			$log['adminid'] = $_SESSION['admin_info']['id'];
			$log['adminname'] = $_SESSION['admin_info']['admin_name'].'【'.$_SESSION['admin_info']['admin_zhiwuname'].'】';
			$log['action'] = $info['action'];
			$log['model'] = $info['model'];
			$log['logurl'] = 'http://'.$_SERVER['HTTP_HOST'].$_SERVER['REQUEST_URI'];
			$log['dothing'] = $_SESSION['admin_info']['admin_name'].'【'.$_SESSION['admin_info']['admin_zhiwuname'].'】在 #TIME# ';
			$doname = '';
			if(!empty($_POST)){
				if(isset($_POST['info'])){
					$data = $_POST['info'];
					$doname = $data['id'];
					if($log['action']=='save'){
						if($data['id']>0){
							$log['action'] = 'edit';
						}else{
							$log['action'] = 'add';
						}
					}elseif($log['action']=='done'){
						$log['action'] = 'import';
					}
					foreach($data as $key=>$val){
						if(strstr($key,'name')){
							$doname = $val;
							break;
						}
					}
					if($log['model']=='group'){
						if($_POST['m']=='group')$doname = '职务组ID='.$doname;
						if($_POST['m']=='user')$doname = '管理员ID='.$doname;
					}
				}else{
					$data = $_POST;
				}
			}else{
				$data = $_GET;
				if(!empty($data['s']))$doname = urldecode($data['s']);
			}
			if(isset($data['user_password']))$data['user_password']='******';
			$actionname = array('list'=>'查看#modelname#列表','add'=>'添加#modelname# '.$doname,'edit'=>'修改#modelname#[ID='.$data['id'].']为 '.$doname,'import'=>'导入#modelname# '.$doname,'order'=>'对#modelname#进行了排序','clear'=>'清理了#modelname#','search'=>'搜索#modelname#，关键词为：'.$doname,'remove'=>'删除#modelname#[ID='.$data['id'].']'.$doname,'create'=>'创建#modelname#','purview'=>'对'.$doname.'进行了权限设置','login'=>'登陆系统','logout'=>'退出系统','view'=>'查看#modelname#[ID='.$data['id'].']的详细信息','excel'=>'导出#modelname#的会员资料');//有待补充
			$modelname = $log['model'];
			if($log['model']=='passwd')$modelname = '管理密码';
			else{
				$menu_link = '/admin/'.$log['model'].'.do';
				$menu = Load::model('menu');
				$menuinfo = $menu->fetchRow("menu_link='{$menu_link}'");
				if($menuinfo){
					if($dot = strrpos($menuinfo['menu_name'],'管理')){
						$modelname = substr($menuinfo['menu_name'],0,$dot);
					}else 
						$modelname = $menuinfo['menu_name'];
				}
			}
			
			$log['onlineip'] = $_SESSION['admin_info']['login_ip'];
			$log['dothing'] .= str_replace('#modelname#',$modelname,$actionname[$log['action']]);
			$id = $this->adminlog->save($log);
			$adminlogext = Load::model('adminlogext');
			$adminlogext->save(array('id'=>$id,'requestvar'=>serialize($data)));
		}
	}
}
?>