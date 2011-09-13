<?php
//弹出框
class openw_Controller extends Controller{

	function init(){
	}
	
	function indexAction(){
		$this->show404();
	}

	function cityAction()
	{
		$citys = $zxs = array();
		$adata = $this->cache->getAreaDatas('area_province');//省份
		$bdata = $this->cache->getAreaDatas('area_citys');//省份
		foreach($adata as $a){
			if($a['id']<5){
				$zxs[] = $a;
			}else{
				$a['child'] = $bdata[$a['id']];
				$citys[] = $a;
			}
		}
		$this->assign('type',array('city','请选择城市'));
		$this->assign('zxs',$zxs);
		$this->assign('datas',$citys);
		$this->display('openw.tpl');
	}

	function funtypeAction()
	{
		$datas = array();
		$adata = $this->cache->getFuntypeDatas('funtype_level1');
		$bdata = $this->cache->getFuntypeDatas('funtype_level2');
		foreach($adata as $a){
			$a['child'] = $bdata[$a['id']];
			$datas[] = $a;
		}
		$this->assign('type',array('funtype','请选择岗位'));
		$this->assign('datas',$datas);
		$this->display('openw.tpl');
	}

	function dustrytypeAction()
	{
		$datas = array();
		$adata = $this->cache->getDustrytypeDatas('dustrytype_level1');
		$bdata = $this->cache->getDustrytypeDatas('dustrytype_level2');
		foreach($adata as $a){
			$a['child'] = $bdata[$a['id']];
			$datas[] = $a;
		}
		$this->assign('type',array('dustrytype','请选择行业'));
		$this->assign('datas',$datas);
		$this->display('openw.tpl');
	}
}
?>