<?php
class chargecard_Controller extends Controller{
	function init(){
		$this->chargecard = Load::model('chargecard');
	}
	
	function indexAction(){
		$this->_forward('list');
	}

	function listAction(){
		$url = $this->getPageUrl().'/list.do';
		$s['isactive'] = (int)$this->_get('isactive');
		$s['isuse'] = (int)$this->_get('isuse');
		$s['cardnum'] = $this->_get('cardnum');
		$s['fee'] = $this->_get('fee');
		$s['startdatetime'] = $this->_get('startdatetime');
		$s['enddatetime'] = $this->_get('enddatetime');
		$urls = $wheres = array();
		foreach($s as $key=>$val){
			if($val||$val===0){
				$urls[] = $key.'='.urlencode($val);
				if($key=='startdatetime'){
					$wheres[] = "startdatetime >= ".strtotime($val.' 00:00:00');
				}elseif($key=='enddatetime'){
					$wheres[] = "startdatetime <= ".strtotime($val.' 23:59:59');
				}else{
					$wheres[] = "$key = '$val'";
				}
			}
		}
		if($this->_get('excel')=='ok'){
			$file = 'chargecard_'.date("Ymd");
			if(!$s['enddatetime']) $wheres[] = "enddatetime > ".time();
			$str_header = $str_content = "";
			$str_header = "卡号,密码,面值,激活？,充值？,有效期\r";
			$rows = $this->chargecard->fetchAll($wheres,'id DESC',null,10000);
			foreach($rows as $row){
				$usedatetime = date("Y-m-d",$row['startdatetime']).' ~ '.date("Y-m-d",$row['enddatetime']);
				$str_content .= "NO.{$row['cardnum']},{$row['cardpwd']},{$row['fee']}元,".($row['isactive']==1 ? '已激活' : '未激活').",".($row['isuse']==1 ? '已充值' : '未充值').",{$usedatetime}\r";
			}
			header("Content-type:application/vnd.ms-excel");
			header("Content-Disposition:attachment;filename={$file}.csv"); 
			echo iconv("UTF-8","GBK",$str_header.$str_content);
			exit();
		}else{
			$url .= '?'.implode('&',$urls);
			$page = $this->_get('page',1);
			$rows = $this->chargecard->pageAll($page, 50, $url,$wheres,'id DESC');
			foreach ($rows as $key=>$val)
			{
				$rows[$key]['usedatetime'] = $val['usedatetime']>0 ? date("Y-m-d H:i",$val['usedatetime']) : '---';
				$rows[$key]['velidatetime'] = date("Y-m-d",$val['startdatetime']).' ~ '.date("Y-m-d",$val['enddatetime']);
			}	
			$this->assign('page',$page);
			$this->assign('s',$s);
			$this->assign('rows', $rows);
			$this->assign('excelurl', $url.'&excel=ok');
			$this->assign('turl',$url.(empty($urls) ? '?' : '&').'page='.$page);
			$this->display();
		}
	}

	function addAction(){
		$this->assign('info', array('startdatetime'=>date("Y-m-d",time()),'enddatetime'=>date("Y-m-d",strtotime("+6 month"))));
		$this->display('chargecard_info.tpl');
	}

	function editAction(){
		$id = $this->_get('id');
		if(!$info = $this->chargecard->find($id)){
			$this->showmsg('您请求的数据不存在',1);
		}
		$info['startdatetime'] = date("Y-m-d",$info['startdatetime']);
		$info['enddatetime'] = date("Y-m-d",$info['enddatetime']);
		$this->assign('info', $info);
		$this->display('chargecard_info.tpl');
	}

	function saveAction(){
		$info = $this->_get('info');
		if(!$info['id']){
			$info['startdatetime'] = strtotime($info['startdatetime']);
			$info['enddatetime'] = strtotime($info['enddatetime']);
			$totalnums = $this->_get('nums');
			$row1 = $this->chargecard->fetchRow("createdate >= '".date("Y-m")."-01 00:00:00'",null,'max(cardnum) as maxnumber');
			if($row1['maxnumber']){
				$maxnumber = $row1['maxnumber'];
			}else{
				$maxnumber = (int)(date("Ym").'18') * 10000;
			}
			for($i=1;$i<=$totalnums;$i++){
				$info['cardnum'] = $maxnumber+$i;
				$info['cardpwd'] = F::getRandomstr(6,'number');
				$id = $this->chargecard->save($info);
			}
		}else{
			if($this->chargecard->save($info) === false){
				$this->showmsg($this->chargecard->getError(),1);
			}
		}
		$this->showmsg('操作成功','list.do');
	}

	function checkAction(){
		$ids = $this->_get('ids');
		$isactive = $this->_get('isactive');
		if(empty($ids)){
			$id = $this->_get('id',0);
			if($id<=0){
				$this->wajaxmsg('没有选择要操作的对象');
			}
			$ids = array($id);
		}
		$this->chargecard->update(array('isactive'=>$isactive),"id IN (".implode(',',$ids).")");
    	$this->wajaxmsg($isactive==10 ? '批量删除成功' : '操作成功',1);
	}

	function removeAction(){
		$id = $this->_get('id');
		$page = $this->_get('page');
		if(!$rowCount = $this->chargecard->update(array('id'=>$id,'isactive'=>10))){
			$this->showmsg($this->chargecard->getError(),1);
		}
    	$this->showmsg('操作成功','list.do?page='.$page);
	}
}
?>