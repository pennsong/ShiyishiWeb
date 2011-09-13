<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
            	<div id="hrcenter">
                	<!--{include file="login_club.tpl"}-->
                	<!--{include file="left_menu.tpl"}-->
                    <div id="hrcenterright">
                    	<div id="gcenterrightc">
                            <h2>修改密码</h2>
							<form name="form1" method="post" action="/enterp/editpasswod/edit.do" onsubmit="return submit_data();">
                            <div id="gloginrightmain">
                                <ul>
                                    <li><span class="glogintext">旧密码：</span><input  type="password" class="k" name="password_old" id="password_old" onclick="$('#password_old_text').html('');" type="text" /><span id="password_old_text" ></span></li>
                                    <li><span class="glogintext">新密码：</span><input type="password" class="k" name="password0" id="password0" onclick="$('#password0_text').html('');" type="text" onfocus="check_oldpassword();" /><span id="password0_text" ></span></li>
                                    <li><span class="glogintext">确认新密码：</span><input type="password" class="k" name="password1" id="password1" onclick="$('#password1_text').html('');" type="text" onblur="check_password();"/><span id="password1_text" ></span></li>
                                </ul>
                             </div>
                             <div id="gloginrightmain">
                                <ul>
                                    <li><span class="glogintext">&nbsp;</span><input type="image" src="/images/baocun.gif" /></li>
                                </ul>
                             </div>
							</form>
                          <div class="topmargin10px"></div>
                         </div>
                    	
                  </div>
                    <div class="clearfix"></div>
                </div>
        	</div>
<script>
function submit_data(){
	var password_old = $('#password_old').val();
	var password0 = $('#password0').val();
	var password1 = $('#password1').val();
	password_old = password_old.replace(/^\s+|\s+$/g,"");
	if(password_old==''){
		$('#password_old_text').html("请填写旧密码");
		return false;
	}
	if(password0 != password1){
		$('#password1_text').html("新密码输入不一致");
		return false;
	}
	return true;
}

function check_password(){
	var password0 = $('#password0').val();
	var password1 = $('#password1').val();
	if(password0 != password1){
		$('#password1_text').html("新密码输入不一致");
	}
}

function check_oldpassword(){
	var password_old = $('#password_old').val();
	password_old = password_old.replace(/^\s+|\s+$/g,"");
	if(password_old==''){
		$('#password_old_text').html("请填写旧密码");
	}
}

</script>
<!--{include file="include/footer.tpl"}-->