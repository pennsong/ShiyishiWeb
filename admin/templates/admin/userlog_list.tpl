<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>用户来访纪录</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="post">
用户Email:
    <input name="useremail" type="text" value="<!--{$s.useremail}-->" style="width:100px;"/>
来源:
    <input name="source" type="text" value="<!--{$s.source}-->" style="width:100px;"/>
IP:
    <input name="onlineip" type="text" value="<!--{$s.onlineip}-->" style="width:100px;"/>
时间段：<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.startdate}-->" name="startdate"/>至<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.enddate}-->" name="enddate"/>
<input class="btn" type="submit" name="search" value="搜 索" />
</form>
</div></div>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">做了什么...</td>
		<td class="tal">访问地址</td>
		<td class="tal">REFERER_URL</td>
		<td class="tal">IP</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><span class="fourm_name"><!--{$item.dothing}--></span></td>
		<td><!--{$item.logurl}--></td>
		<td><a title="<!--{$item.refererurl}-->"><!--{$item.refererurl|substr:40}--></td>
		<td><!--{$item.onlineip}--></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<!--{include file=footer.tpl}-->