<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/checkform.js" type="text/javascript"></script>
<form id="infoForm" name="sForm" action="<!--{$baseurl}-->/admin/member/save.do" method="post" onsubmit="return fm_chk(this);">
  <input type="hidden" name="formhash" value="<!--{formhash}-->" />
  <input type="hidden" name="info[id]" value="<!--{$info.id}-->" />
  <table cellspacing="0" cellpadding="0" width="100%">
	<tr class="tr4">
      <td class="td3" width="80">登录名:</td>
      <td class="td4">
        <!--{$info.loginname}--></td>
    </tr>
    <tr class="tr4">
      <td class="td3">Email:</td>
      <td class="td4"><input id="email" name="info[loginemail]" type="text" value="<!--{$info.loginemail}-->" alt="邮箱名:有全角/有空格/邮件/无内容" />
        <span id="showResult_email"></span></td>
    </tr>
    <tr class="tr4">
      <td class="td3">状态:</td>
      <td class="td4"><select name="info[state]">
	  <!--{if $info.state==0}-->
	  <option value="1" >激活账户并开通课程</option>
	  <!--{/if}-->
	  <!--{if $info.state>0&&$info.state!=9}-->
	  <option value="-1">取消激活该账号</option>
	  <!--{/if}-->
	  <!--{if $info.state==1}-->
	  <option value="4">关闭课程</option>
	  <!--{/if}-->
	  <!--{if $info.state==2}-->
	  <option value="2">开通课程</option>
	  <!--{/if}-->
	  <!--{if $info.state==9}-->
	  <option value="3">激活该账号</option>
	  <!--{/if}-->
    </select></td>
    </tr>
  </table>
  <br />
  <div style="margin-left:90px;">
    <input type="submit" value="保 存" class="btn" />
    &nbsp;&nbsp;
    <input type="button" value="返 回" onclick="parent.$.box.close();" class="btn" />
  </div>
</form>
<script language="JavaScript">
function getcity(obj)
{
	var objvalue=obj.value;
	var targetid = 'cityid';
	$.ajax({
	type:"POST",
	url:"/admin/ajax/getcity.do",
	dataType:"html",
	data:'pid='+objvalue,
	beforeSend:function(XMLHttpRequest)
	{
		$("#showResult"+obj.id).text("正在查询...");
	},
	success:function(msg)
	{
		if(!msg){$("#cityid").css("display","none");}
		else{
			msg = msg.split("||");
			document.getElementById(targetid).options.length = 0;
			if(msg.length>0){
				for(var i=0;i<msg.length;i++){
					
					var val = msg[i].split(":");
					document.getElementById(targetid).options.add(new Option(val[1],val[0]));
				}
			}
			$("#cityid").css("display","block");
			$("#showResult"+obj.id).css("display","none");
		}
	}
	});
}
</script>