<?php
//基础(单个)页面
class pages_Controller extends Controller{
	
	function init(){
		$this->pages = Load::model('pages');
	}
	
	function indexAction()
	{
		$parmN = $this->_get('parm');
		$where = "pagename='{$parmN}' AND status='show'";
		$pageinfo = $this->pages->fetchRow($where);
		if(!$pageinfo){
			$this->show404('很抱歉！您请求的页面不存在...');
		}
		$pageinfo['content'] = str_replace('{WEBURL}',BASE_URL,$pageinfo['content']);
		$sitetpl = $pageinfo['template'] ? $pageinfo['template'] : 'page_default.tpl';

		//加载今日销售数量 虚拟增加的
		$countermodel = Load::model('counter');
		$this->assign('sellnum', $countermodel->getCounter());
		//加载送礼是的配置数据
		$confdata = Load::conf('conf');
		$this->assign('xages', $confdata['xage']);
		$this->assign('xwhos', $confdata['xwho']);
		$this->assign('xress', $confdata['xres']);

		$this->assign('pageinfo',$pageinfo);
		$this->assign('pagetitle',$pageinfo['pagetitle']);
		$this->display($sitetpl);
	}
}
?>
