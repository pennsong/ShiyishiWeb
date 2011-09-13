<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>新闻管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加新闻</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="post">
<select name="catid">
<option value="" >请选择类别</option>
<!--{foreach from=$cats key=key item=item}-->
<option value="<!--{$key}-->" <!--{if $key==$s.catid}-->selected<!--{/if}-->><!--{$item}--></option>
<!--{/foreach}-->
</select>
<select name="cityid">
<option value="" >请选择城市</option>
<!--{foreach from=$citys key=key item=item}-->
<option value="<!--{$item.id}-->" <!--{if $item.id==$s.cityid}-->selected<!--{/if}-->><!--{$item.name}--></option>
<!--{/foreach}-->
</select>
时间段：<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.startdate}-->" name="startdate"/>至<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.enddate}-->" name="enddate"/>
关键字：<input type="text" name="kw" value="<!--{$s.kw}-->" />
<input class="btn" type="submit" name="search" value="搜 索"/>
</form>
</div>
<div style="clear:both;">
<!--{include file=page.tpl}-->
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="5%">顺序</td>
		<td class="tal" width="30%">标题</td>
		<td class="tal">类别</td>
		<td class="tal">所属城市</td>
		<td class="tal">关键词</td>
		<td class="tal">演出ID</td>
		<td class="tal">添加时间</td>
		<td class="tal" width="10%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td><!--{$item.order_id}--></td>
		<td class="tal"><span class="fourm_name"><a href="<!--{$baseurl}-->/news/<!--{$item.id}-->.html" target="_blank"><!--{$item.subject}--></a></span></td>
		<td class="tal"><!--{$item.catname}--></td>
		<td><!--{$item.citys}--></td>
		<td><!--{$item.keywords}--></td>
		<td><!--{$item.itemid}--></td>
		<td><!--{$item.createdate}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> |  <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<br>
<!--{include file=footer.tpl}-->