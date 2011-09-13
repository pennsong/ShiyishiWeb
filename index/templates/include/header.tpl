<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><!--{if $pagetitle}--><!--{$pagetitle}-->-<!--{/if}--><!--{$web.seo_title}--></title>
<meta name="description" content="<!--{if $seo_description}--><!--{$seo_description}--><!--{else}--><!--{$web.seo_description}--><!--{/if}-->">
<meta name="keywords" content="<!--{if $seo_keyword}--><!--{$seo_keyword}--><!--{else}--><!--{$web.seo_keyword}--><!--{/if}-->">
<link href="<!--{$baseurl}-->/styles/reset.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/styles/960_24_col.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/styles/main.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/images/favicon.ico" type="image/x-icon" rel="icon">
<script type="text/javascript" src="<!--{$baseurl}-->/js/base.js"></script>
</head>
<body>
<div id="wrap">
  <div id="main">
    <div id="header">
      <div id="top">
        <div id="mod_logo"><span class="floatLeft"><a href="<!--{$baseurl}-->/"><img src="<!--{$baseurl}-->/images/logo.jpg" /></a></span></div>
        <div id="mod_banner"><img src="<!--{$baseurl}-->/images/banner.jpg" /></div>
        <div id="mod_topnav"><span><!--{if $islogin}--><a href="<!--{$baseurl}-->/member/"><!--{$logininfo.email|substr:'16':''}--></a> | <a href="<!--{$baseurl}-->/logout.html" class="">退出</a><!--{elseif $isloginp}--><a href="<!--{$baseurl}-->/enterp/"><!--{$logininfo.company|substr:"16":""}--></a> | <a href="<!--{$baseurl}-->/enterp/do/logout.do" class="">退出</a><!--{else}--><a href="<!--{$baseurl}-->/enterp/login.html" class="bold">企业登录</a> | <a href="<!--{$baseurl}-->/enterp/register.html" class="bold">企业注册</a><!--{/if}--></span></div>
        <div id="mod_toptel"><span class="topteltext">视一视全国客服热线：</span><span class="toptelshuzi">010-51316156</span></div>
      </div>
      <div id="mod_nav">
        <div id="toptime">今天是
          <SCRIPT language=JavaScript> today=new Date();
 function initArray(){
   this.length=initArray.arguments.length
   for(var i=0;i<this.length;i++)
   this[i+1]=initArray.arguments[i]  }
   var d=new initArray(
     "星期日",
     "星期一",
     "星期二",
     "星期三",
     "星期四",
     "星期五",
     "星期六");
document.write(
     "<font style='font-size:9pt;font-family: 宋体'> ",
     today.getFullYear(),"年",
     today.getMonth()+1,"月",
     today.getDate(),"日   ",
     d[today.getDay()+1],
     "</font>" ); 
          </SCRIPT>
        </div>
        <ul>
          <li><a href="<!--{$weburl}-->/">首页</a></li>
          <li><a href="<!--{$weburl}-->/jobs.html">找工作</a></li>
          <li><a href="<!--{$weburl}-->/enterp/resume/search.html">招人才</a></li>
          <li><a href="<!--{$weburl}-->/interview.html">在线面试大厅</a></li>
          <li><a href="<!--{$weburl}-->/rule.html">奖励规则</a></li>
        </ul>
      </div>
    </div>