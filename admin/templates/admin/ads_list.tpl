<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>广告管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加广告</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/search.do" method="post">
标题：<input type="text" value="<!--{$s.subject}-->" name="subject" style="width:80px;"/>
<select name="adtype">
<option value="" >类型</option>
<!--{foreach from=$adtypes key=key item=item}-->
<option value="<!--{$key}-->" <!--{if $key==$s.adtype}-->selected<!--{/if}-->><!--{$item}--></option>
<!--{/foreach}-->
</select>
时间段：<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.startdate}-->" name="startdate"/>至<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.enddate}-->" name="enddate"/>
<input class="btn" type="submit" name="search" value="搜 索"/>
</form>
</div>
<div style="clear:both;">
<!--{include file=page.tpl}-->
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">广告名称</td>
		<td class="tal" width="8%">类型</td>
		<td class="tal" width="25%">有效期</td>
		<td class="tal" width="10%">自定义属性</td>
		<td class="tal" width="10%">调用代码</td>
		<td class="tal" width="10%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><span class="fourm_name"><!--{$item.subject}--></span></td>
		<td class="tal"><!--{$item.adtype}--></td>
		<td class="tal"><!--{$item.begintime}--> ~ <!--{$item.endtime}--></td>
		<td><!--{$item.attr}--></td>
		<td><a onclick="viewMore('<!--{$pageurl}-->/view.do?id=<!--{$item.id}-->');" style="cursor:pointer;">查看</a></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> |  <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<br>
<script language="JavaScript">
function viewMore(url){
	popup('查看调用详情',url,300,180);
}
</script>
<!--{include file=footer.tpl}-->