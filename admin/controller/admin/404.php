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

	function getsubvenueAction(){
		$citys = $this->cache->getAreaDatas();
		$model = Load::model('venue');
		$pid = (int)$this->_get('pid',0);
		$rows = $model->fetchAll("parent_id='".$pid."'",'order_id asc,homerank desc,id desc');
		$html = '';
		foreach($rows as $key=>$item){
			$item['cityname'] = $citys[$item['cityid']]['name'];
			$html .= '<tr class="tr31" id="subtr_'.$pid.'_'.$key.'">
						<td class="tal"></td>
						<td class="tal"><input type="checkbox" name="ids[]" value="'.$item['id'].'">'.$item['venuename'].'</td>
						<td>'.$item['vanueen'].'</td>
						<td class="tal">'.$item['cityname'].'</td>
						<td>'.$item['address'].'</td>
						<td>'.$item['homerank'].'</td>
						<td>'.$item['createdate'].'</td>
						<td><a class="fourm-two"><span class="jifen2" style="cursor:auto"></span></a> <a class="fourm-two" href="'.$baseurl.'/admin/show/list.do?venueid='.$item['id'].'"><span class="cateset" title="查看演出记录"></span></a> <a class="fourm-two" href="'.$baseurl.'/admin/venue/edit.do?id='.$item['id'].'"><span class="edit" title="编辑"></span></a>  <a class="fourm-two" href="'.$baseurl.'/admin/venue/remove.do?id='.$item['id'].'" onclick="return confirm(\'确定删除?\')"><span class="del" title="删除"></span></a></td>
					</tr>';
		}
		$this->ajaxmsg($html);
	}

	function geturevAction(){
		$amodel = Load::model('user_rec');
		$uid = (int)$this->_get('uid',0);
		$rows = $amodel->fetchUnionAll('user','a.uid=b.id',"a.uid='".$uid."' and a.isdef=0",'a.id desc','a.*,b.username');
		$html = '';
		foreach($rows as $key=>$item){
			$html .= '<tr class="tr31" id="subtr_'.$uid.'_'.$key.'">
						<td></td>
						<td></td>
						<td><strong><font color="green">'.$item['reciver'].'</font></strong></td>
						<td>'.$item['recphone'].'</td>
						<td>'.$item['recaddress'].'</td>
						<td>'.$item['reczip'].'</td>
						<td>'.$item['createdate'].'</td>
					  </tr>';
		}
		$this->ajaxmsg($html);
	}
}
?>