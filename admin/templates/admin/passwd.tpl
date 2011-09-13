<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn1"><span>密码修改</span></a></li>
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post" onsubmit="return fm_chk(this);">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$admininfo.id}-->" />
<h2>基本资料设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="100">用户名:</td>
		<td class="td4"><!--{$admininfo.admin_name}--><!--{if $admininfo.admin_realname}-->【<!--{$admininfo.admin_realname}-->】<!--{/if}--></td>
	</tr>
	<tr class="tr4">
		<td class="td3">旧密码:</td>
		<td class="td4"><input id="oldpasswd" name="info[oldpasswd]" type="password" value="" alt="旧密码:空/长度@5-16/英文数字" /><span id="showResult_oldpasswd"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">新密码:</td>
		<td class="td4"><input id="newpassword" name="info[admin_password]" type="password" alt="新密码:空/长度@5-16/英文数字" /><span id="showResult_newpassword"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">确认密码:</td>
		<td class="td4"><input id="newpassword1" name="info[newpasswd1]" type="password" value="" alt="确认密码:空/确认@newpassword" /><span id="showResult_newpassword1"></span></td>
	</tr>
</table>
<br />
<div style="padding-left:125px;"> <input type="submit" value="保 存" class="btn" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
</form>
<script language="JavaScript">
onload = function(){fm_ini();}
</script>
<!--{include file=footer.tpl}-->