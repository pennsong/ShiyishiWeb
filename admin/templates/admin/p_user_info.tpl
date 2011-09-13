<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<form id="infoForm" name="sForm" action="<!--{$baseurl}-->/admin/e_user/save.do" method="post">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
  <input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
  <input type="hidden" name="postaction" id="postaction" value="save" />
  <table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
      <td class="td3" width="80">用户名:</td>
      <td class="td4">
		<!--{if $info.username}-->
			<!--{$info.username}-->
			<input name="info[username]" type="hidden" value="<!--{$info.username}-->" />
		<!--{else}-->
			<input id="username" name="info[username]" type="text" value="<!--{$info.username}-->" style="width:150px;" alt="用户名:4-20/有空格/无内容/有全角/怪字符" />
			<span id="showResult_username"></span>
		<!--{/if}-->
		</td>
    </tr>
    <tr class="tr4">
      <td class="td3">Email:</td>
      <td class="td4"><input id="email" name="info[email]" type="text" value="<!--{$info.email}-->" style="width:150px;" alt="邮箱名:有全角/有空格/邮件/无内容" />
        <span id="showResult_email"></span></td>
    </tr>
<!--{if $password}-->
    <tr class="tr4">
      <td class="td3">密码:</td>
      <td class="td4"><input id="password" name="info[password]" type="password" value="<!--{$info.password}-->"<!--{if $info.id}--> disabled="disabled"<!--{else}--><!--{/if}--> style="width:150px;" alt="密码:空/长度@6-20" /><!--{if $info.id}--><input type="checkbox" name="modpass" onclick="modpasswd(this);"><!--{/if}-->
        <span id="showResult_password"></span></td>
    </tr>
	<tr class="tr4">
      <td class="td3">重复密码:</td>
      <td class="td4"><input id="password2" name="info[password2]" type="password" value="<!--{$info.password}-->"<!--{if $info.id}--> disabled="disabled"<!--{/if}--> style="width:150px;" alt="重复密码:空/确认@password"/>
        <span id="showResult_password2"></span></td>
    </tr>
<!--{else}-->
	<input id="password" name="info[password]" type="hidden" value="666666" />
	<input type="hidden" name="modpass" value='1' />
<!--{/if}-->
  </table>
  <br />
  <div style="margin-left:120px;">
    <input type="button" value="保 存" class="btn" onclick="submitCheck(1);" />
  </div>
</form>
<script language="JavaScript">
function modpasswd(_obj){
	if(_obj.checked==true){
		oo("password").disabled = false;
		oo("password2").disabled = false;
		oo("password").value = '';
		oo("password").focus();
		oo("password2").value = '';
	}else{
		oo("password").disabled = true;
		oo("password2").disabled = true;
		oo("password").value = '';
		oo("password2").value = '';
		psuccess(oo('password'));
		psuccess(oo('password2'));
	}
}
function psuccess(obj){
	obj.style.borderTop='1px solid #AFAFAF'
	obj.style.borderLeft='1px solid #E2E2E4'
	obj.style.borderBottom='1px solid #E8E9ED'
	obj.style.borderRight='1px solid #DFE1E0'
	obj.style.background='#FAFBFD';
	if(oo("showResult_"+obj.id)){
		oo("showResult_"+obj.id).style.display = 'none';
	}
}

function submitCheck(v)
{	
	var fm = oo('infoForm');
	if(fm_chk(fm)){
		if(v==2)oo('postaction').value = 'saveback';
		fm.submit();
	}
}
</script>