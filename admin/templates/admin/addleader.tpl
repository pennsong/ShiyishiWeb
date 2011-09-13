<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<div style="clear:both;">
<div style="float:left;margin:0px 0 0 50px;#margin:0px 0 0 50px;_margin:-30px 0 0 50px;height:30px;">
邀请领导观看面试
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;height:30px;">

</div>
<div id="msyqld" style="clear:both;">
      <div id="msyqldmain">
        <ul>
          <li>手机：<input type="text" id="mobilephone" name="mobilephone" value="输入领导的手机号" onfocus="if(this.value=='输入领导的手机号'){this.value='';}" onblur="if(this.value==''){this.value='输入领导的手机号';}" style="width:95px;"/> <input type="button" value="邀请" onclick="YaoQingLD();"></li>
        </ul>
      </div>
    </div>
</div>
<script>
function YaoQingLD(){
	var val = $("#mobilephone").val();
	if(!val){
		alert("手机号不能为空");
	}else if(!(/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(val))){
		alert("手机号输入格式不正确");
	}else{
		$.ajax({
			type:"POST",
			url:"/admin/interview/initleader.do",
			dataType:"html",
			data:'mobile='+val+'&aid='+<!--{$aid}-->,

			success:function(msg)
			{
				if(msg=='success'){
					alert("领导邀请短信已经发出。");
				}else if(msg=='had'){
					alert("最多只能邀请一位领导,本次邀请将覆盖赏赐邀请。");
				}else if(msg=='error'){
					alert("非法操作.");
				}else{
					alert("面试已结束");
				}
			}
		});
	}
}

</script>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
