<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>邮件模板管理</span></a></li>
<!--{if $info.id}-->
<li><a href="#" class="btn1"><span>邮件模板设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加邮件模板</span></a></li>
<!--{/if}-->
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<h2>邮件模板信息设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<!--{if $info.createdate}-->
	<tr class="tr4">
		<td class="td3" width="150">添加时间:</td>
		<td class="td4"><input type="text" value="<!--{$info.createdate}-->" disabled="disabled"/></td>
	</tr>
	<!--{/if}-->
	<tr class="tr4">
		<td class="td3" width="150">名称标识:</td>
		<td class="td4"><input id="mailname" name="info[name]" type="text" value="<!--{$info.name}-->" alt="名称标识:无内容" style="width:300px;"/><span id="showResult_mailname"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">邮件标题:</td>
		<td class="td4"><input id="mailsubject" name="info[mailsubject]" type="text" value="<!--{$info.mailsubject}-->" alt="邮件标题:无内容" style="width:300px;" /><span id="showResult_mailsubject"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">状态:</td>
		<td class="td4"><input name="info[status]" type="radio" value="show" <!--{if $info.status!='hide'}-->checked<!--{/if}-->/> 有效 &nbsp; <input name="info[status]" type="radio" value="hide" <!--{if $info.status=='hide'}-->checked<!--{/if}-->/> 无效</td>
	</tr>
	<tr class="tr4">
		<td class="td3">邮件内容:</td>
		<td class="td4"><!--{$info.mailcontent}--></td>
	</tr>
</table>
<br />
<div style="padding-left:70px;"><input type="button" value="返 回" onclick="history.go(-1)" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
</form>
<!--{include file=footer.tpl}-->