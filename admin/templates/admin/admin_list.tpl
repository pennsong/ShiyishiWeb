<!--{include file=header.tpl}-->
<div style="width:800px;"><div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>管理员管理</span></a></li>
<li><a href="<!--{$pageurl}-->/add.do" class="btn2"><span>添加管理员</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form action="<!--{$pageurl}-->/list.do" method="post">
<input type="text" name="s" value="<!--{$s}-->" />
<select name="stype">
<option value="admin_name" <!--{if $stype == 'admin_name'}-->selected<!--{/if}-->>用户名</option>
<option value="admin_number" <!--{if $stype == 'admin_number'}-->selected<!--{/if}-->>客服编号</option>
<option value="admin_email" <!--{if $stype == 'admin_email'}-->selected<!--{/if}-->>电子邮件</option>
</select>
<input class="btn" type="submit" name="submit" value="搜 索" />
</form>
</div></div>
<div style="clear:both;">
<!--{include file=page.tpl}-->
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal">用户名</td>
		<td class="tal">客服编号</td>
		<td class="tal">姓名</td>
		<td class="tal">管理组</td>
		<td class="tal">电子邮件</td>
		<td class="tal">管辖地区</td>
		<td class="tal">最后登录时间</td>
		<td class="tal" width="15%" style="padding-left:20px;">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><!--{$item.admin_name}--></td>
		<td class="tal"><span class="fourm_name"><!--{$item.admin_number}--></span></td>
		<td class="tal"><span class="fourm_name"><!--{$item.admin_realname}--></span></td>
		<td><!--{$item.admin_zhiwu}--></td>
		<td><!--{$item.admin_email}--></td>
		<td><!--{$item.admin_citys}--></td>
		<td><!--{$item.admin_lastlogintime}--></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> |  <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<br>
</div>
<!--{include file=footer.tpl}-->