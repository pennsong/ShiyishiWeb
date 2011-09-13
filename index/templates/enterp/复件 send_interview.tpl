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
								<li><span class="glogintext">姓名：</span><!--{foreach from=$resume key=key item=item}--><!--{$item.uname}--> <!--{/foreach}--></li>
								<li><span class="glogintext">email：</span><!--{foreach from=$resume key=key item=item}--><!--{$item.email}--> <!--{/foreach}--></li>
								<li><span class="glogintext">手机号：</span><!--{foreach from=$resume key=key item=item}--><!--{$item.phone}--> <!--{/foreach}--></li>

								<li><span class="glogintext">招聘职务：</span>
									<select name="info[jobid]"  id="jobid">
									<!--{foreach from=$jobs key=key item=item}-->
										<option value="<!--{$item.id}--> "<!--{if $info.jobid==$item.id}--> selected<!--{/if}-->><!--{$item.title}--></option>
									<!--{/foreach}-->
									</select>
								</li>

								<li id="interview_time" ><span class="glogintext">视频房间时间：</span>
									<select name="interview"  id="interview">
									<!--{foreach from=$interview key=key item=item}-->
										<option value='<!--{$item.starttime|date_format:"%Y-%m-%d %H:%M:%S"}-->~<!--{$item.endtime|date_format:"%Y-%m-%d %H:%M:%S"}-->' ><!--{$item.starttime|date_format:"%Y-%m-%d %H:%M:%S"}--> ~ <!--{$item.endtime|date_format:"%Y-%m-%d %H:%M:%S"}--></option>
									<!--{/foreach}-->
									</select>
									面试时间请选择在视频房间时间范围内。
								</li>

								<li><span class="glogintext">面试时间：</span>
									<input type="tetx" name="startdate" id="startdate" value="<!--{$startdate}-->" class="Wdate" onClick="WdatePicker();$('#error').hide();" style="width:120px;" /> 
									<select name="starttime"  id="starttime" class="Wdate" onchange="$('#error').hide();" style="width:80px;">
									<option value=""></option>
									<!--{foreach from=$time key=key item=item}-->
										<option value="<!--{$item}-->"<!--{if $info.starttime==$item}--> selected<!--{/if}-->><!--{$item}--></option>
									<!--{/foreach}-->
									</select>
									<span id="error" style="display:none;"><img src="/images/no.jpg"  align="absmiddle" /> 请将时间填写完整</span>
                                </li>
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

<!--{if $info.interview_type==2}--> 
$('#interview_time').show();
<!--{/if}-->

function check_time(){
	var sd = $('#startdate').val();
	var st = $('#starttime').val();
	if(sd=='' || st==''){
		$('#error').show();
		return false;
	}
	return true;
}


</script>
<!--{include file="include/footer.tpl"}-->