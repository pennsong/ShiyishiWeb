<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>首页幻灯管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加首页幻灯</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="post">
<select name="cityid" onchange="document.getElementById('searchForm').submit();">
<option value="0" >全国</option>
<!--{foreach from=$citys key=key item=item}-->
<option value="<!--{$item.id}-->" <!--{if $item.id==$s.cityid}-->selected<!--{/if}-->><!--{$item.name}--></option>
<!--{/foreach}-->
</select>
</form>
</div>
<div style="clear:both;">
<!--{include file=page.tpl}-->
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="5%">顺序</td>
		<td class="tal">主题</td>
		<td class="tal" width="35%">描述</td>
		<td class="tal">所属城市</td>
		<td class="tal">添加时间</td>
		<td class="tal" width="10%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td><!--{$item.order_id}--></td>
		<td class="tal"><span class="fourm_name"><!--{$item.title}--></span></td>
		<td class="tal"><!--{$item.description}--></td>
		<td><!--{$item.citys}--></td>
		<td><!--{$item.createdate}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> |  <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<br>
<!--{include file=footer.tpl}-->