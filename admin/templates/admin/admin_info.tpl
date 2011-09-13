<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/index.do" class="btn2"><span>管理员管理</span></a></li>
<!--{if $info}-->
<li><a href="#" class="btn1"><span>管理员设置</span></a></li>
<!--{else}-->
<li><a href="#" class="btn1"><span>添加管理员</span></a></li>
<!--{/if}-->
</ul>

<form id="infoForm" name="sForm" action="<!--{$pageurl}-->/save.do" method="post">
<input type="hidden" name="formhash" value="<!--{formhash}-->" />
<input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
<input type="hidden" name="postaction" id="postaction" value="save" />
<h2>管理员资料设置</h2>
<table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
		<td class="td3" width="100">用户名:</td>
		<td class="td4"><!--{if $info.admin_name}--><!--{$info.admin_name}--><!--{else}--><input id="admin_name" name="info[admin_name]" type="text" value="<!--{$info.admin_name}-->" alt="用户名:4-20/英文数字/有空格/无内容/下划线/有全角/怪字符" /><!--{/if}--><span id="showResult_admin_name"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">密  码:</td>
		<td class="td4"><input id="admin_password" name="info[admin_password]" type="password"  <!--{if $info.admin_password}-->value="******"<!--{else}-->value=""<!--{/if}--> <!--{if !$info.admin_password}-->alt="密码:6-16/英文数字/有空格/无内容/下划线/有全角/怪字符"<!--{/if}--> /><span id="showResult_admin_password"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">姓  名:</td>
		<td class="td4"><input id="admin_realname" name="info[admin_realname]" type="text" value="<!--{$info.admin_realname}-->" alt="姓名:4-20/怪字符/无内容/有全角/有空格" /><span id="showResult_admin_realname"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">用户组:</td>
		<td class="td4">
			<!--{if $profile==1}-->
			<!--{$info.admin_zhiwuname}-->
			<!--{else}-->
			<select id="admin_zhiwu" name="info[admin_zhiwu]">
			<!--{foreach from=$zhiwus key=key item=item}-->
			<option value="<!--{$key}-->" <!--{if $key==$info.admin_zhiwu}-->selected<!--{/if}-->><!--{$item}--></option>
			<!--{/foreach}-->
			</select>
			<!--{/if}-->
		</tr>
	<tr class="tr4">
		<td class="td3">电子邮箱:</td>
		<td class="td4"><input id="admin_email" name="info[admin_email]" type="text" value="<!--{$info.admin_email}-->" alt="邮箱名:有全角/有空格/truemail/无内容" /><span id="showResult_admin_email"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">客服编号:</td>
		<td class="td4"><input id="admin_number" name="info[admin_number]" type="text" value="<!--{$info.admin_number}-->" alt="客服编号:7-20/无内容" /><span id="showResult_admin_number"></span></td>
	</tr>
	<tr class="tr4">
		<td class="td3">管辖城市:</td>
		<td class="td4" id="citybox">
		<!--{if $profile==1}-->
		<!--{foreach from=$citys key=key item=item}-->
		<!--{$item.name}--> 
		<!--{/foreach}-->
		<!--{else}-->
		<input type="checkbox" onclick="checkAll(this);"/>全部
		<!--{foreach from=$citys key=key item=item}-->
		<input name="info[admin_citys][]" type="checkbox" value="<!--{$item.id}-->" <!--{$item.checked}--> /><!--{$item.name}-->
		<!--{/foreach}-->
		<!--{/if}-->
		</td>
	</tr>
	<tr class="tr4">
		<td class="td3">用户描述:</td>
		<td class="td4"><textarea class="textarea" cols="50" rows="5" id="admin_desc" name="info[admin_desc]" alt="管理权限描述:怪字符"><!--{$info.admin_desc}--></textarea><span id="showResult_admin_desc"></span></td>
	</tr>
</table>
<br />
<!--{if $info}-->
<div> <input type="button" value="保 存" class="btn" onclick="submitCheck(1);" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="返 回" onclick="history.go(-1)" class="btn" /></div>
<!--{else}-->
<div> <input type="button" value="保 存" class="btn" onclick="submitCheck(1);" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="保存并继续新增" class="btn" onclick="submitCheck(2);" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="重 置" class="btn" /></div>
<!--{/if}-->
</form>
<script language="JavaScript">
function submitCheck(v)
{	
	var fm = oo('infoForm');
	if(fm_chk(fm)){
		if(v==2)oo('postaction').value = 'saveback';
		fm.submit();
	}
}
</script>
<!--{include file=footer.tpl}-->