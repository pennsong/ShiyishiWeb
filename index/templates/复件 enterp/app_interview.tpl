<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 简历管理 -申请视频面试</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
                        <h2>申请视频面试</h2>
                        <div id="hrzhiweimain">
							<form name="form2" method="post" action="/enterp/resume/appinvited.do?str=<!--{$str}-->" onsubmit="return check_time();">
                        	<ul>
								<li>&nbsp;</li>
								<li>&nbsp;</li>
                                <li><span class="glogintext">申请时间：</span>
									开始时间：<input type="tetx" name="startdate" id="startdate" value="<!--{$startdate}-->" class="Wdate" onClick="WdatePicker();$('#error').hide();" style="width:120px;" /> 
									<select name="starttime"  id="starttime" class="Wdate" onchange="$('#error').hide();" style="width:80px;">
									<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"><!--{$item}--></option>
									<!--{/foreach}-->
									</select>

									结束时间：<input type="tetx" name="enddate"  id="enddate" value="<!--{$enddate}-->"  class="Wdate" onClick="WdatePicker();$('#error').hide();" style="width:120px;"/> 
									<select name="endtime"  id="endtime" class="Wdate" onchange="$('#error').hide();" style="width:80px;">
										<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"><!--{$item}--></option>
									<!--{/foreach}-->
									</select>
									<span id="error" style="display:none;"><img src="/images/no.jpg"  align="absmiddle" /> 请将时间填写完整</span>

                                </li>
								<li><span class="glogintext">&nbsp;</span><span class="hui">视频大厅的使用时间是按照整时计算的，不足一小时的按一个小时计算</span></li>
								<li><span class="glogintext">&nbsp;</span><span class="hui">申请时间段的前后各20分钟为系统赠送时间</span></li>
                                <li><span class="glogintext">&nbsp;</span><input type="image" src="/images/tijiao.gif" /><input type="hidden" name="action" value="action" /></li>
								<li>&nbsp;</li>
								<li>&nbsp;</li>
                            </ul>
							</form>
                        </div>
                        <div class="clearfix"></div>
                  </div>
                </div>
        	</div>
<script type="text/javascript">
function setSubData(_o,_t){
	var pid = _o.value;
	var _tid = _o.id.replace('_o','_t')
	var tobj = document.getElementById(_tid);
	$("#"+_tid).hide();
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("请选择有效信息！！！");
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getsubdatabypid.do",
			dataType:"html",
			data:'rtype=cn&type='+_t+'&pid='+pid,
			success:function(msg)
			{
				if(msg){
					msg = msg.split(":");
					if(msg.length>0){
						$("#"+_tid).show();
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}
		});
	}
}

function gotoPage(url){
	var i = $('#page').val();
	if (url.indexOf("?")!=-1){
		window.location.href = url+'&page='+i;
	}else{
		window.location.href = url+'?page='+i;
	}
}

function check_time(){
	var sd = $('#startdate').val();
	var st = $('#starttime').val();
	var ed = $('#enddate').val();
	var et = $('#endtime').val();
	if(sd=='' || st=='' || ed=='' || et==''){
		$('#error').show();
		return false;
	}
	return true;
}
</script>
<!--{include file="include/footer.tpl"}-->