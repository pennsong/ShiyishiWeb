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

						<div id="hrcentertop">
							<span>
								<ul>
									<li><form  name="form2" method="post" action="/enterp/resume/downlist.html">
										<input value="重新邀请" type="submit" />
										<input  type="hidden" name="interview" id="interview" value=""/>
										</form>
									</li>
								</ul>
							</span>
						</div>
                        <h2>邀请面试</h2>
                        <div id="hrzhiweimain">
							<form name="form2" method="post" action="<!--{$pageurl}-->/save.do" onsubmit="return check_time();">
							<input value="<!--{$info.id}-->" name="info[id]"  type="hidden" id="id" />
							<input value="<!--{$aid}-->" name="aid"  type="hidden" id="aid" />
							<input value="1" name="info[status]"  type="hidden" id="status" />
							<input value="1" name="info[isnew]"  type="hidden" id="isnew" />
							<input value="2" name="info[interview_type]"  type="hidden" id="interview_type" />
							<input value="<!--{$ids}-->" name="ids"  type="hidden" id="ids" />
							<input id="gender" value="<!--{if $info.gender}--><!--{$info.gender}--><!--{else}--><!--{foreach from=$resume key=key item=item}--><!--{$item.gender}-->,<!--{/foreach}--><!--{/if}-->" name="info[gender]"  type="hidden" id="gender" />
							<input value="<!--{if $info.uid}--><!--{$info.uid}--><!--{else}--><!--{foreach from=$resume key=key item=item}--><!--{$item.uid}-->,<!--{/foreach}--><!--{/if}-->" name="info[uid]"  type="hidden" id="uid" />
							<input value="<!--{if $info.eid}--><!--{$info.eid}--><!--{else}--><!--{$e_user.id}--><!--{/if}-->" name="info[eid]"  type="hidden" id="phone" />
                        	<ul>
								<li>&nbsp;</li>
								<li>&nbsp;</li>
								<li><span class="glogintext">招聘职位：</span>
									<select name="info[jobid]"  id="jobid">
										<option value="0">选择面试职位</option>
									<!--{foreach from=$jobs key=key item=item}-->
										<option value="<!--{$item.id}--> "<!--{if $info.jobid==$item.id}--> selected<!--{/if}-->><!--{$item.title}--></option>
									<!--{/foreach}-->
									</select>
								</li>
                                <li><span class="glogintext">申请时间：</span>
									开始时间：<input type="tetx" name="startdate" id="startdate" value="<!--{$app.startdate}-->" class="Wdate" onClick="WdatePicker();settime('startdate',1);$('#error').hide();" style="width:120px;" /> 
									<select name="starttime"  id="starttime" class="Wdate" onchange="$('#error').hide();setOnetime('starttime_p',this.value);" style="width:80px;" >
									<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->" <!--{if $app.starttime==$item}-->selected="selected"<!--{/if}--> ><!--{$item}--></option>
									<!--{/foreach}-->
									</select>

									结束时间：<input type="tetx" name="enddate"  id="enddate" value="<!--{$app.startdate}-->"  class="Wdate" onClick="WdatePicker();settime('enddate',1);$('#error').hide();" style="width:120px;"/> 
									<select name="endtime"  id="endtime" class="Wdate" onchange="$('#error').hide();setOnetime('endtime_p',this.value);" style="width:80px;">
										<option value="">选择时间</option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->" <!--{if $app.endtime==$item}-->selected="selected"<!--{/if}-->><!--{$item}--></option>
									<!--{/foreach}-->
									</select>
									<span id="error" style="display:none;"><img src="/images/no.jpg"  align="absmiddle" /> 请将时间填写完整</span>

								</li>
								<li>
								</li>
								<li>
								</li>

								<!--{foreach from=$resume key=key item=items}-->
								<li id="user_<!--{$interview_arr[$key]}-->">
								<span class="glogintext"><!--{$items.uname}-->&nbsp;&nbsp;&nbsp;</span>
									开始时间：<input type="tetx" name="startdate_p[]"  value="<!--{$pidrows.$key.startdate_p}-->" class="Wdate startdate_p" style="width:120px;" onClick="WdatePicker();settime('startdate_p<!--{$items.id}-->',0);" id="startdate_p<!--{$items.id}-->"/> 
									<select name="starttime_p[]" id= "starttime_p<!--{$key}-->" class="Wdate" style="width:80px;" >
									<option value="">选择时间</option>
									<!--{foreach from=$time key=keys item=item}-->
										<option value="<!--{$item}-->"  <!--{if $pidrows.$key.starttime_p==$item}-->selected="selected"<!--{/if}-->><!--{$item $pidrows.$key.starttime_p}--></option>
									<!--{/foreach}-->
									</select>

									结束时间：<input type="tetx" name="enddate_p[]"  value="<!--{$pidrows.$key.enddate_p}-->"  class="Wdate enddate_p" style="width:120px;" onClick="WdatePicker();settime('enddate_p<!--{$items.id}-->',0);" id="enddate_p<!--{$items.id}-->"/> 
									<select name="endtime_p[]" id= "endtime_p<!--{$key}-->" class="Wdate"  style="width:80px;">
										<option value="">选择时间</option>
									<!--{foreach from=$time key=keys item=item}-->
										<option value="<!--{$item}-->"  <!--{if $pidrows.$key.endtime_p==$item}-->selected="selected"<!--{/if}-->><!--{$item}--></option>
									<!--{/foreach}-->
									</select>
									<a href="javascript:{}" onclick="if(confirm('您确认要删除邀请吗?')){ deleteuser(<!--{$interview_arr[$key]}-->);}" style="color:red" >删除</a>
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
var interview = Array();
var uid = Array();
var gender = Array();
<!--{foreach from=$interview_arr key=keys item=item}-->
	interview.push(<!--{$item}-->);
<!--{/foreach}-->

<!--{foreach from=$resume key=key item=item}-->
	uid.push(<!--{$item.uid}-->);
<!--{/foreach}-->

<!--{foreach from=$resume key=key item=item}-->
	gender.push(<!--{$item.gender}-->);
<!--{/foreach}-->

$('#interview').val(interview.join(","));
function deleteuser(i){
	$('#user_'+i).html();
	$('#user_'+i).hide();
	for(x=0;x<interview.length;x++){
		if(interview[x]==i){
			interview.splice(x,1);
			uid.splice(x,1);
			gender.splice(x,1);
		}
	}
	$('#interview').val(interview.join(","));
	$('#uid').val(uid.join(",")+',');
	$('#gender').val(gender.join(",")+',');
}

function setOnetime(key,objItemValue){
	for(x=0;x<interview.length;x++){
		document.getElementById(key+x).value = objItemValue;
	}
}


function resettime(str){
	var now='<!--{$day}-->';
	var v=$('#'+str).val();
	var arr=v.split("-");
	var arr1=now.split("-");
	var oldtime=new Date(arr[0],arr[1],arr[2]);
	var oldtimes=oldtime.getTime();
	var nowtime=new Date(arr1[0],arr1[1],arr1[2]);
	var nowtimes=nowtime.getTime();
	if(nowtimes>oldtimes){
		alert('申请时间只能由今天开始！');
		$('#'+str).val('');
	}
}

function settime(str,i){
	resettime(str);
	if(i==1){
		var day=$('#'+str).val();
		$('.'+str+'_p').val(day);
	}
}

function check_time(){
	var sd = $('#startdate').val();
	var st = $('#starttime').val();
	var ed = $('#enddate').val();
	var et = $('#endtime').val();
	var sc = $('#jobid').val();
	if(sc==0){
		alert('请选择职位');
		return false;
	}
	if(sd=='' || st=='' || ed=='' || et==''){
		$('#error').show();
		return false;
	}
	return true;
}
</script>
<!--{include file="include/footer.tpl"}-->