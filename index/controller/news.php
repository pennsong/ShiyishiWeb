<?php
//新闻 演出动态 公告等页
class news_Controller extends Controller{

	function init(){
		$this->news = Load::model('news');
		$this->show = Load::model('show');
		$this->showcc = Load::model('showcc');
		$this->venue = Load::model('venue');
		$this->cat = Load::model('category');
		$this->news_cat = $this->cache->getNewsCatDatas();
		if(!$this->cityinfo){
			unset($_COOKIE['sys_cookie_city']);
		}
	}
	
	function indexAction(){
		$catid = (int)$this->_get('catid');
		$page = (int)$this->_get('page',1);
		$where = array();
		if($catid>0){
			$catname = $this->news_cat[$catid];
			$where[] = 'catid='.$catid;
		}else{
			$catname = '新闻列表';
		}
		//获取本月关注 及 热门演出
		if($this->cityinfo){
			$where[] = "cityids LIKE '%,".$this->cityinfo['id'].",%'";
		}
		$urls = array('t'=>2,'url'=>$this->getWebUrl().'/news/cat_'.$catid.'/');
		$allnews = $this->news->pageAll($page, 30, $urls,$where,'order_id desc,id desc','id,subject,catid,createdate');
		foreach ($allnews as $key=>$val)
		{
			$allnews[$key]['catname'] = $this->news_cat[$val['catid']];
			$allnews[$key]['createdate'] = date("m-d H:i",$val['createdate']);
		}

		$this->assign('catid',$catid);
		$this->assign('allnews',$allnews);
		$this->assign('gz_shows',$this->show->getAttShows($this->cityinfo));
		$this->assign('new_shows',$this->show->getNewShows($this->cityinfo));
		$this->assign('pagetitle',$this->cityinfo['area_name'].$catname);
		$this->assign('crumb',$catname);
		$this->display();
	}

	function viewAction(){
		$id = (int)$this->_get('id');
		if($id<=0 || !($info=$this->news->find($id))){
			$this->show404('该新闻不存在。');
		}
		$info['catname'] = $this->news_cat[$info['catid']];
		if($info['itemid']){
			$items = explode(',',$info['itemid']);
			$info['items'] = array();
			foreach($items as $itemid){
				$row['id'] = $itemid;
				$row['name'] = $this->show->getname($itemid);
				$info['items'][] = $row;
			}
		}
		$info['createdate'] = date("Y-m-d H:i:s",$info['createdate']);

		$this->assign('info',$info);
		$this->assign('gz_shows',$this->show->getAttShows($this->cityinfo));
		$this->assign('new_shows',$this->show->getNewShows($this->cityinfo));
		$this->assign('pagetitle',$info['subject']);
		$this->assign('crumb','<a href="'.$this->getWebUrl().'/news/cat_'.$info['catid'].'/">'.$info['catname'].'</a> &raquo; '.$info['subject']);
		$this->display('news_detail.tpl');
	}
}
?>