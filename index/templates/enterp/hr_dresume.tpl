<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script>
var array=[<!--{$dids}-->];
var userstr='';
var user=[];
</script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 简历管理 -已下载的简历</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiweilist">
                        <div id="hrcentertop">
                            <span>
                                <ul>
									<li><a href="/enterp/resume/enroll.html">已录取人员</a></li>
									<li><a href="/enterp/resume/boxlist.html">简历收件箱</a></li>
									<li><a href="/enterp/resume/alist.html">视频面试管理</a></li>
                                </ul>
                            </span>
                        </div>
                        <h2>已下载的简历</h2>

                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                        	<form name="form2" method="post" action="">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                              	<div class="red" id="fenges">标准简历(<!--{$total}-->)</div>
                              	<span style="color: red">提示：如您需要将视频简历下载本地观看，请点击<a href="<!--{$baseurl}-->/images/SYSPlayer.exe">SYSplayer</a>下在本站专用播放器播放。</span>
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody>
									<tr class="list2">
										<td colspan="12" id="cc" style="padding: 0;">
										</td>
                                    </tr>


                                    <tr class="list2">
                                      <td bgcolor="#FFE8D2" class="tdCheckbox"><input type="checkbox" onclick="unChkSelectAll('fengge','chkall')" id="chkall" value="CC000427542J90250041000" name="PositionID2" /></td>
                                      <td bgcolor="#FFE8D2" class="bolditem" style="word-wrap: break-word;">全选</td>
                                      <td colspan="10" nowrap="" bgcolor="#FFE8D2" class=" centerAlign">&nbsp;
										<!--{if $totalpage>1}-->
											<div align="right">
											<a href="javascript:{}" onclick="getapagedata(1)" id="home">首页</a> <a href="javascript:{}" onclick="getapagedata(<!--{$page-1}-->)" id="up">上页</a> <a href="javascript:{}" onclick="getapagedata(<!--{$page+1}-->)" id="down">下页</a> <a href="javascript:{}" onclick="getapagedata(<!--{$totalpage}-->)" id="end" >尾页</a> 第<span class="red" id="apage"><!--{$page}--></span>/<span class="red"><!--{$totalpage}--></span>页，去
												<input value="1" name="PageList2" size="2" type="text" />页 
											  <input value="Go" onclick="getapagedata(document.managedVacancyForm.PageList2.value)" type="button" />
											</div>
										<!--{/if}-->
                                      </td>
                                      </tr>

                                    <tr class="list2" id="userlist" style="display:none;">
                                      <td colspan="12" class="tdCheckbox"><h2>邀请视频面试者名单<span id="pnumber">(2人)</span></h2></td>
                                    </tr>
                                    <tr class="list2">
                                      <td colspan="12" class="tdCheckbox"><div id="yaoqingmingdan"></div></td>
                                    </tr>


                                    <tr class="list2">
                                      <td colspan="12" class="tdCheckbox"> <div align="center">
                                        <input value="邀请视频面试" type="submit" onclick="if($('#interview').val()!=''){$('#type').val('down');document.forms[0].action='/enterp/send_interview/';}else{alert('请选择邀请对象！');return false;}"/>
										<input  type="hidden" name="interview" id="interview" value=""/>
										<input  type="hidden" name="aid" id="aid" value="<!--{$aid}-->"/>
										<input value=""  type="hidden" name="type" id="type" />
                                        <input value="删除" onclick="$('#type').val('down');document.forms[0].action='/enterp/resume/del.do';
" type="submit" />
                                       </td>
                                      </tr>
                                    </tbody>
                                </table>
                              </div>
                              
                              
                            </div>
							</form>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div><div id="lqselect" style="display:none;"><form action="/enterp/do/enroll.do"><input type="hidden" id="lquid" name="uid"/><input type="hidden" id="lqtype" name="t"/><div style="margin-top:6px;"><ul style="margin-left:10px;"><li style="list-style:none;line-height:25px;height:25px;"><b>选择要录取的职位：</b></li><li style="list-style:none;line-height:25px;height:25px;"><select style="_display:block" name="jobid"><!--{foreach from=$zwrows key=key item=item}--><option value="<!--{$item.id}-->"><!--{$item.title}--></option><!--{/foreach}--></select></li><li style="list-style:none;line-height:25px;height:25px;"><input type="submit" value="确定录取"/></li></ul></div></form></div>
<script type="text/javascript">
function userlist(){
	userstr='';
	for(i=0;i<array.length;i++){
		userstr+='<a href="javascript:{}" onclick="deluserlist('+array[i]+')">'+user[array[i]]+'</a>';
	}
	$('#yaoqingmingdan').html(userstr);
}
function deluserlist(v){
	delarray(v);
	userlist();
}
var apage=<!--{$page}-->;
var total=<!--{$totalpage}-->;
function pageword(){
	if(apage==1){
		$("#up").html('');
		$("#home").html('');
		$("#down").html('下页');
		$("#end").html('尾页');
	}else if(apage==total) {
		$("#down").html('');
		$("#end").html('');
		$("#up").html('上页');
		$("#home").html('首页');
	}else{
		$("#up").html('上页');
		$("#home").html('首页');
		$("#down").html('下页');
		$("#end").html('尾页');
	}
	$("#apage").html(apage);
}
pageword();
function getapagedata(page){
	if(page>total)
		page=total;
	if(!page)
		page=1;
	apage=page;
	$.post("/enterp/resume/dlist.html",{"page":page},function(data){
		var arr = data.split('<_@S#S@_>');
		if(arr[0]=='1'){
			$("#cc").html('');
			$("#cc").html(arr[1]);
		}else{
			window.location.href="/enterp/login.html";
		}
		pageword();
		initlist();
	});	
}

getapagedata(1);

function unChkSelectAll(pstr,mstr){
	if($("#"+mstr).attr("checked") != ""){
		$("#"+pstr+" input:checkbox").attr("checked",true);
		for(var i=0;i<larray.length;i++){
			addarray(larray[i]);
		}
	}else{
		$("#"+pstr+" input:checkbox").attr("checked",false);
		for(var i=0;i<larray.length;i++){
			delarray(larray[i]);
		}
	}
}

function gotoPage(url,i){
	window.location.href = url+'&page='+i;
}

function select_posttime(url,i){
	window.location.href = url+'?days='+i;
}

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
var str='';
function selectbox(obj){
	if(obj.checked==true){
		addarray(obj.value);
	}else{
		delarray(obj.value);
	}
}

function addarray(v){
	var is=0;
	for(i=0;i<array.length;i++){
		if(array[i]==v){
			is=1;
			break;
		}else{
			is=0;
		}
	}
	if(is==0){
		array.push(v);
	}
	personnum();
	userlist();
	setinterview();
}

function delarray(v){
	for(i=0;i<array.length;i++){
		if(array[i]==v){
			array.splice(i,1);
		}
	}
	personnum();
	userlist();
	var is=0;
	for(i=0;i<larray.length;i++){
		if(larray[i]==v){
			is=1;
			break;
		}else{
			is=0;
		}
	}
	if(is){
		$('#box_'+v).attr("checked",false);
	}
	setinterview();
}

function personnum(){
	$('#pnumber').html('('+array.length+')人');
	if(array.length){
		$('#userlist').show();
	}else{
		$('#userlist').hide();
	}
}

function initlist(){
	for(i=0;i<array.length;i++){
		if($('#box_'+array[i]).length){
			$('#box_'+array[i]).attr("checked",true);
		}
	}
	userlist();
	personnum();
	setinterview();
}

function lquser(uid,t){
	if(!confirm('请贵单位如实填报被录用人员名单，您填报的被录用人员一个月内不能在本网站重新求职；如填报虚假信息，给他人造成的伤害及损失由贵单位负责。')){
		return false
	}else{
		$('#lquid').val(uid);
		$('#lqtype').val(t);
		var html = $('#lqselect').html();
		$.box.show('',html,200,100,2);
		if ($.browser.msie && $.browser.version<6) $("select").hide();;
	}
}

function setinterview(){
	str=array.join(",");
	$('#interview').val(str);
}
var turl = window.location.href;
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<iframe id="frame_main" name="frame_main" style="display:none;"></iframe>
<!--{include file="include/footer.tpl"}-->