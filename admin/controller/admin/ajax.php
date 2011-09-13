<?php

class ajax_Controller extends Controller{

	function init(){
	}

	function getcityAction(){
		$parentid = $this->_get('pid');
		if(empty($parentid))
			exit;
		$area_city = $this->cache->getAreaDatas('area_city');
		$option = '';
		foreach($area_city[$parentid] as $key=>$val)
		{
			$option .= $val['id'].':'.$val['name'].'||';
		}
		$this->ajaxmsg(rtrim($option,"||"));
	}

	function getsubcityAction(){
		$model = Load::model('area');
		$pid = (int)$this->_get('pid',0);
		$rows = $model->fetchAll("parent_id='".$pid."'",'order_id asc,id desc');
		$html = '';
		foreach($rows as $key=>$item){
			$html .= '<tr class="tr31" id="subtr_'.$pid.'_'.$key.'">
						<td class="tal">
							<input class="input tac" name="orderid['.$item['id'].']" value="'.$item['order_id'].'" size="2" type="text">
							<span class="fourm_name" style="padding-left:10px;">|- '.$item['area_name'].'</span>
						</td>
						<td>'.$item['area_en'].'</td>';
						if($item['type']==1){
							$nnnn = '重点城市';
						}elseif($item['type']==2){
							$nnnn = '非重点城市';
						}elseif($item['type']==-1){
							$nnnn = '区';
						}else{
							$nnnn = '非非重点城市';
						}
			$html .= '	<td>'.$nnnn.'</td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/area/edit.do?id='.$item['id'].'">编辑</a></td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/area/remove.do?id='.$item['id'].'" onclick="return confirm(\'确定删除?\')">删除</a></td>
					</tr>';
		}
		$this->ajaxmsg($html);
	}

	function getcitysAction(){
		$id = (int)$this->_get('id');
		$data = '';
		if($id>0){
			$citys = $this->cache->getAreaDatas('area_citys');
			if(isset($citys[$id])){
				foreach($citys[$id] as $row){
					$data .= $row['id'].','.$row['name'].',';
				}
			}
		}
		$this->ajaxmsg($data);
	}
	//获取子职位
	function getsubftypeAction(){
		$model = Load::model('funtype');
		$pid = (int)$this->_get('pid',0);
		$rows = $model->fetchAll("parent_id='".$pid."'",'order_id asc,id desc');
		$html = '';
		foreach($rows as $key=>$item){
			$html .= '<tr class="tr31" id="subtr_'.$pid.'_'.$key.'">
						<td class="tal">
							<input class="input tac" name="orderid['.$item['id'].']" value="'.$item['order_id'].'" size="2" type="text">
							<span class="fourm_name" style="padding-left:10px;">|- '.$item['thename'].'</span>
						</td>
						<td>'.$item['enname'].'</td>
						<td>'.$item['createdate'].'</td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/funtype/edit.do?id='.$item['id'].'">编辑</a></td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/funtype/remove.do?id='.$item['id'].'" onclick="return confirm(\'确定删除?\')">删除</a></td>
					</tr>';
		}
		$this->ajaxmsg($html);
	}
	//获取子行业
	function getsubdtypeAction(){
		$model = Load::model('dustrytype');
		$pid = (int)$this->_get('pid',0);
		$rows = $model->fetchAll("parent_id='".$pid."'",'order_id asc,id desc');
		$html = '';
		foreach($rows as $key=>$item){
			$html .= '<tr class="tr31" id="subtr_'.$pid.'_'.$key.'">
						<td class="tal">
							<input class="input tac" name="orderid['.$item['id'].']" value="'.$item['order_id'].'" size="2" type="text">
							<span class="fourm_name" style="padding-left:10px;">|- '.$item['thename'].'</span>
						</td>
						<td>'.$item['enname'].'</td>
						<td>'.$item['createdate'].'</td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/funtype/edit.do?id='.$item['id'].'">编辑</a></td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/funtype/remove.do?id='.$item['id'].'" onclick="return confirm(\'确定删除?\')">删除</a></td>
					</tr>';
		}
		$this->ajaxmsg($html);
	}

	//获取二级专业
	function getsubmajorAction(){
		$model = Load::model('major');
		$pid = (int)$this->_get('pid',0);
		$rows = $model->fetchAll("parent_id='".$pid."'",'order_id asc,id desc');
		$html = '';
		foreach($rows as $key=>$item){
			$html .= '<tr class="tr31" id="subtr_'.$pid.'_'.$key.'">
						<td class="tal">
							<input class="input tac" name="orderid['.$item['id'].']" value="'.$item['order_id'].'" size="2" type="text">
							<span class="fourm_name" style="padding-left:10px;">|- '.$item['thename'].'</span>
						</td>
						<td>'.$item['enname'].'</td>
						<td>'.$item['createdate'].'</td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/funtype/edit.do?id='.$item['id'].'">编辑</a></td>
						<td><a class="fourm-two" href="'.$baseurl.'/admin/funtype/remove.do?id='.$item['id'].'" onclick="return confirm(\'确定删除?\')">删除</a></td>
					</tr>';
		}
		$this->ajaxmsg($html);
	}
}
?>