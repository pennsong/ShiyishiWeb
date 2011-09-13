<!--{include file=header.tpl}-->
<div style="float:left;">
<ul class="nav3">
<li><a href="#" class="btn1"><span>网银管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加网银</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<select name="paytype" onchange="document.getElementById('searchForm').submit();">
<option value="99bill" <!--{if '99bill'==$paytype}-->selected<!--{/if}-->>快  钱</option>
<option value="yeepay" <!--{if 'yeepay'==$paytype}-->selected<!--{/if}-->>易付通</option>
</select>
</form>
</div>
<div style="clear:both;">
<form action="<!--{$pageurl}-->/order.do" method="post">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="5%">[顺序]</td>
		<td class="tal">网银名称</td>
		<td class="tal">标识</td>
		<td class="tal">网银图标</td>
		<td class="tal">类别</td>
		<td class="tal">状态</td>
		<td class="tal" width="10%" style="padding-left:30px">操 作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><input class="input tac" name="displayorder[<!--{$item.id}-->]" value="<!--{$item.displayorder}-->" size="2" type="text"></td>
		<td class="tal"><span class="fourm_name"><!--{$item.bankname}--></span></td>
		<td><!--{$item.bankid}--></td>
		<td><img alt="<!--{$item.bankname}-->" src="http://www.mynewlearn.com/images/bank/<!--{$item.banklogo}-->"/></td>
		<td><!--{$item.paytype}--></td>
		<td><!--{$item.status}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>

<br>
<center><input type="submit" class="btn" value="提 交" /> <input type="reset" class="btn" value="重 置" /></center>
</form>
</div>
<!--{include file=footer.tpl}-->