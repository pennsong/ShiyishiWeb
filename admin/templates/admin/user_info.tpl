<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<form id="infoForm" name="sForm" action="<!--{$baseurl}-->/admin/user/save.do" method="post">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
  <input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
  <input type="hidden" name="postaction" id="postaction" value="save" />
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="tr4">
      <td class="td3">Email:</td>
      <td class="td4"><input id="email" name="info[email]" type="text" value="<!--{$info.email}-->" style="width:150px;"<!--{if $info.id}--> readonly<!--{else}--> alt="邮箱名:有全角/有空格/邮件/无内容"<!--{/if}--> />
        <span id="showResult_email"></span></td>
    </tr>
	<tr class="tr4">
      <td class="td3">手机号:</td>
      <td class="td4"><input name="oldmobile" type="hidden" value="<!--{$info.mobile}-->" /><input id="mobile" name="info[mobile]" type="text" value="<!--{$info.mobile}-->" style="width:150px;" />
        <span id="showResult_mobile"></span></td>
    </tr>
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
		oo("password").value = '********';
		oo("password2").value = '********';
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