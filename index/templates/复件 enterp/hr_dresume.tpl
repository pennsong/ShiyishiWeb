<!--{include file="include/header.tpl"}-->
<script>
var array=[];
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
									<li><a href="/enterp/resume/boxlist.html">简历收件箱</a></li>
									<li><a href="/enterp/resume/alist.html">视频面试管理</a></li>
                                </ul>
                            </span>
                        </div>
                        <h2>已下载的简历</h2>

                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                        	<form name="form2" method="post" action="/enterp/resume/invited.do">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                              	<div class="red" id="fenges">标准简历(<!--{$total}-->)</div>
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody><tr class="tabHead">
                                      <th width="36" class="blankTd"></th>
                                        <th width="50">编号</th>
                                        <th width="165">姓名</th>
                                        <th width="146" nowrap="" class=" centerAlign">应聘职位</th>
                                        <th width="62" nowrap="" class=" centerAlign">性别</th>
                                        <th width="70" nowrap="">工作年限</th>
										<th width="124" nowrap="" class="centerAlign">毕业院校</th>
                                        <th width="62" nowrap="" class=" centerAlign">年龄</th>
                                        <th width="62" nowrap="" class=" centerAlign">学历</th>
                                        <th width="68" nowrap="" class=" centerAlign">现居住地</th>
                                        <th width="87" nowrap="" id="suspendAnchor" class=" centerAlign">投递日期</th>
                                        <th width="87" nowrap="" class="centerAlign">操作</th>
                                    </tr>

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
                                        <input value="邀请视频面试" type="submit" onclick="$('#type').val('down');document.forms[0].action='/enterp/send_interview/';"/>
										<input value=""  type="hidden" name="interview" id="interview" value=""/>
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
        	</div>
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
		$("#cc").html('');
		$("#cc").html(data);
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
}

function setinterview(){
	str=array.join(","); 
	$('#interview').val(str);
}
</script>
<!--{include file="include/footer.tpl"}-->