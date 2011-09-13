<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>弹窗</title>
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/pop.css">
</head>
<body style="margin:0px;padding:0px;">
<div class="x_main">
  <div class="blue_center_box x_main_width bg_ffffff">
    <div class="x_k">
      <div class="title"><span><!--{$type.1}--></span><a onclick="parent.$.box.close();" class="close"></a></div>
	  <div class="x_info"><!--{if $zxs}--> <p><b>直辖市：</b><!--{foreach from=$zxs item=v}--><a onclick="parent.checkOK('<!--{$type.0}-->',<!--{$v.id}-->,'<!--{$v.name}-->');"><!--{$v.name}--></a>&nbsp;<!--{/foreach}--></p><!--{/if}-->
	  <!--{foreach from=$datas item=p}--><p><b><!--{$p.name}-->：</b><!--{foreach from=$p.child item=c}--><a onclick="parent.checkOK('<!--{$type.0}-->',<!--{$c.id}-->,'<!--{$c.name}-->');"><!--{$c.name}--></a>&nbsp;<!--{/foreach}--></p><!--{/foreach}-->
	  </div>
	  <div class="all_width"><span class="btn"><a onclick="parent.close();">取 消</a></span></div>
    </div>
  </div>
</div>
</body>
</html>
