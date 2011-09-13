<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 简历管理 -邀请面试</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei" >
                        <h2>邀请面试</h2>
                        <div id="hrzhiweimain">
							<form name="form2" method="post" action="<!--{$pageurl}-->/save.do" onsubmit="return check_time();">
							<input value="<!--{$info.id}-->" name="info[id]"  type="hidden" id="id" />
							<input value="1" name="info[status]"  type="hidden" id="status" />
							<input value="1" name="info[isnew]"  type="hidden" id="isnew" />
							<input value="2" name="info[interview_type]"  type="hidden" id="interview_type" />
							<input value="<!--{$ids}-->" name="ids"  type="hidden" id="ids" />
							<input value="<!--{if $info.gender}--><!--{$info.gender}--><!--{else}--><!--{foreach from=$resume key=key item=item}--><!--{$item.gender}-->,<!--{/foreach}--><!--{/if}-->" name="info[gender]"  type="hidden" id="gender" />
							<input value="<!--{if $info.uid}--><!--{$info.uid}--><!--{else}--><!--{foreach from=$resume key=key item=item}--><!--{$item.uid}-->,<!--{/foreach}--><!--{/if}-->" name="info[uid]"  type="hidden" id="uid" />
							<input value="<!--{if $info.eid}--><!--{$info.eid}--><!--{else}--><!--{$e_user.id}--><!--{/if}-->" name="info[eid]"  type="hidden" id="phone" />
                        	<ul>
								<li>&nbsp;</li>
								<li>&nbsp;</li>
								<li><span class="glogintext">招聘职务：</span>
									<select name="info[jobid]"  id="jobid">
									<!--{foreach from=$jobs key=key item=item}-->
										<option value="<!--{$item.id}--> "<!--{if $info.jobid==$item.id}--> selected<!--{/if}-->><!--{$item.title}--></option>
									<!--{/foreach}-->
									</select>
								</li>
                                <li><span class="glogintext">申请时间：</span>
									开始时间：<input type="tetx" name="startdate" id="startdate" value="<!--{$startdate}-->" class="Wdate" onClick="WdatePicker();settime('startdate');$('#error').hide();" style="width:120px;" /> 
									<select name="starttime"  id="starttime" class="Wdate" onchange="$('#error').hide();" style="width:80px;">
									<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"><!--{$item}--></option>
									<!--{/foreach}-->
									</select>

									结束时间：<input type="tetx" name="enddate"  id="enddate" value="<!--{$enddate}-->"  class="Wdate" onClick="WdatePicker();settime('enddate');$('#error').hide();" style="width:120px;"/> 
									<select name="endtime"  id="endtime" class="Wdate" onchange="$('#error').hide();" style="width:80px;">
										<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"><!--{$item}--></option>
									<!--{/foreach}-->
									</select>
									<span id="error" style="display:none;"><img src="/images/no.jpg"  align="absmiddle" /> 请将时间填写完整</span>

								</li>
								<li>
								</li>
								<li>
								</li>

								<!--{foreach from=$resume key=key item=item}-->
								<li>
								<span class="glogintext"><!--{$item.uname}--> &nbsp;&nbsp;&nbsp;</span>
									开始时间：<input type="tetx" name="startdate_p"  value="<!--{$startdate}-->" class="Wdate startdate_p" style="width:120px;" onClick="WdatePicker();"/> 
									<select name="starttime_p[]"  class="Wdate" style="width:80px;">
									<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"><!--{$item}--></option>
									<!--{/foreach}-->
									</select>

									结束时间：<input type="tetx" name="enddate_p"  value="<!--{$enddate}-->"  class="Wdate enddate_p" style="width:120px;" onClick="WdatePicker();"/> 
									<select name="endtime_p[]"  class="Wdate"  style="width:80px;">
										<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"><!--{$item}--></option>
									<!--{/foreach}-->
									</select>

                                </li>
								<!--{/foreach}-->
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
function settime(str){
	var day=$('#'+str).val();
	$('.'+str+'_p').val(day);
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