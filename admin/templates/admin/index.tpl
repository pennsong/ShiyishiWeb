<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><!--{$web.seo_title}-->后台管理系统</title>
<script src="<!--{$baseurl}-->/js/common.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<link href="<!--{$baseurl}-->/css/layout.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
$(function(){
	LayoutSize();

	$(window).resize(function(){
		LayoutSize();
	});

	$("#SideBtn").click(function(){
		SideSwitch(this);
	});
	
	//topMenu();
});

//框架大小控制
function LayoutSize(){
	var ww=$(window).width();//窗体宽度
	var wh=$(window).height();//窗体高度
	var th=45;//顶部高度
	var fh=32;//功能条高度
	var sw=140;//侧栏宽度
	var mw=($("#SideBtn").attr("title")=="隐藏边栏")?ww-sw:ww;//内容宽度
	
	$("#Main").width(mw);
	$("#Main").height(wh-th-fh);
	$("#Side").height(wh-th-fh);
}

//侧边面板控制
function SideSwitch(s){
	var w=$(window).width();
	var pw=$("#Side").width();
	if ($(s).attr("title")=="隐藏边栏"){
		$("#Side").css({left: -pw}); 
		$("#Main").css({left: 0,width: w}); 
		$(s).css({left: 0});
		$(s).addClass("hide");
		$(s).attr("title","显示边栏");
	}else{
		$(s).css({left: pw}); 
		$(s).attr("title","隐藏边栏");
		$(s).removeClass("hide");
		$("#Side").css({left: 0}); 
		$("#Main").css({left: pw,width: w-pw}); 
	}
}

//页面信息
function egg(e){if(typeof window.k=="undefined"){window.k=""}var e=e||event;if(e.keyCode==116) window.k="";window.k+=e.keyCode+",";if(window.k=="38,38,40,40,37,37,39,39,"){alert(unescape("%u9ED1%u9ED1%u5236%u9020"));window.k="";}}document.onkeydown=egg;
</script>
</head>
<body onload="<!--{if $admininfo.admin_zhiwu==1}-->leftmenu('0');<!--{else}-->leftmenu('0');<!--{/if}-->">
<div id="Top">
  <div class="logo"><a href="<!--{$web.weburl}-->"><img src="<!--{$baseurl}-->/images/logo.gif" height="43" alt="<!--{$web.webname|default:'票虫网'}-->"/></a></div>
  <div id="Menu"><div id="showmenu" style="display:none"></div>
    <ul>
      <!--{foreach from=$menus key=key item=item}-->
      <li onMouseOver="showguide(this,'<!--{$key}-->');"><a href="#" onClick="return leftmenu('<!--{$key}-->');"><!--{$item.menu_name}--></a></li>
      <!--{/foreach}-->
    </ul>
  </div>
</div>
<div id="Func">
  <div class="nav">
    <dl>
      <dt><a href="<!--{$web.weburl}-->" target="_blank">站点首页</a></dt>
      <dd><a href="<!--{$baseurl}-->">后台首页</a></dd>
    </dl>
  </div>
  <div class="passpost">
    <p>用户名：<!--{$admininfo.admin_name}-->【<a href="<!--{$baseurl}-->/admin/passwd.do" target="main">修改密码</a>】</p>
    <p>姓名：<a href="<!--{$baseurl}-->/admin/profile.do" target="main" title="修改个人资料"><u><!--{$admininfo.admin_realname}--></u></a></p>
    <p><!--{$admininfo.admin_zhiwuname}--> <a href="javascript:;" onClick="window.top.main.location.reload();" title="刷新主页面">刷新</a> <a href="javascript:;" onClick="window.top.main.history.go(-1);" title="后退到前一页">后退</a> <a href="<!--{$baseurl}-->/logout.do">注销</a></p>
  </div>
</div>
<div id="Side">菜单载入中...</div>
<div id="SideBtn" title="隐藏边栏"></div>
<div id="Main">
  <iframe name="main" frameborder="0" src="/admin/index/home.do" allowTransparency="true"></iframe>
</div>
<div id="menu" style="display:none"></div>
<script language="JavaScript">
var menus = <!--{$json_menus}-->;
function leftmenu(id,selectid){
	id = id || '0';
	var leftmenu = $('#Side'),
		item = menus[id]['children'],
		html = '',menu,target_url;
	for(var i in item){
		menu = item[i];
		var subs = menu['children'];
		html += '<dl><dt>' + menu['menu_name'] + '</dt>';
		for(var j in subs){
			var sub = subs[j];
			var link = '<!--{$baseurl}-->'+sub['menu_link'];
			if(!target_url){
				target_url = link;
			}
			if(selectid && selectid == sub['id']){
				html += '<dd class="one"><a href="'+link+'" target="main">'+sub['menu_name']+'</a></dd>';
				target_url = link;
			}else{//<dd><a href="#">订单管理</a></dd>
				html += '<dd><a href="'+link+'" target="main">'+sub['menu_name']+'</a></dd>';
			}
		}
		html += '</dl>';
	}
	

	leftmenu.html(html);
	//leftmenu.find('a').attr('hideFocus',true);
	var leftmenu_li = leftmenu.find('dd');
	leftmenu_li.click(function(){
		var self = $(this);
		leftmenu_li.removeClass('one');
		self.addClass('one');
		//return false;
	});
	
	if(!selectid){
		leftmenu_li.eq(0).click();
	}
	window.top.main.location.href=target_url;
	//closeguide();
	//showtitle();

	return false;
}

//leftmenu();
//<div class="sub-menu"><a href="#">订单管理</a><a href="#">优惠卷管理</a><a href="#">CPA</a><a href="#">网银管理</a><a href="#">产品设置</a><a href="#">优惠活动</a></div>
function showguide(li,id){
	var showmenu = $('#showmenu'),
		item = menus[id]['children'],
		html  = '', menu;
	for(var i in item){
		menu = item[i];
		var subs = menu['children'];
		for(var j=0 in subs){
			var sub = subs[j];
			html += '<a href="#" menuid="'+id+'" item="'+sub['id']+'">'+sub['menu_name']+'</a>';
		}
	}
	//alert(html);
	showmenu.html( html);
	var offset  = $(li).offset();
	showmenu.show();
	showmenu.css({'top':offset.top+40+'px','left':offset.left+'px'});
	/*
	showmenu.mouseover(function(){
		//$(li).css({'color': '#2C2C2C', 'text-decoration': 'none', 'background': '#FFEFD7'});
		li.className = 'hovd';
	});
	showmenu.showmenu(function(){
		//$(li).css({'color': '#2C2C2C', 'text-decoration': 'none', 'background': '#FFEFD7'});
		li.className = 'hovd';
	});*/
	$(document).bind('mouseout',doc_mouseout);
	var showmenu_a = showmenu.find('a');
	//showmenu_a.attr('hideFocus',true);
	showmenu_a.click(function(){
		var self = $(this);
		leftmenu(self.attr('menuid'), self.attr('item'));
		return false;
	});
}

function closeguide(){
	var showmenu = $('#showmenu');
	showmenu.hide();
	$(document).unbind("mouseout",doc_mouseout);
}

function doc_mouseout(e){
	var obj = document.getElementById('showmenu'),
	_x = e.pageX,
	_y = e.pageY,
	_x1 = obj.offsetLeft + 2,
	_x2 = obj.offsetLeft + obj.offsetWidth,
	_y1 = obj.offsetTop - 20,
	_y2 = obj.offsetTop + obj.offsetHeight;

	if(_x<_x1 || _x>_x2 || _y<_y1 || _y>_y2){
		closeguide();
	}
}

</script>
</body>
</html>
