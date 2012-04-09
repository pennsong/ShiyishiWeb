<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 视一视简历库 -搜索简历</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                        <h2>搜索简历</h2>

                        <div id="hrjlss">
							<form name="form1" method="post" action="/enterp/resume/search.html">
                            <ul>
                                <li style="padding:5px 0 5px 0;">Resume Searching Condition：
                            	</li>
                            	<li style="padding:5px 0 5px 0;">搜索简历:
								<select name="funtype_1" id="zhiweishuxin" onchange="setZhiweileibie();">
								<option value="">按行业搜索(Select Industry)</option>
								 <!--{foreach from=$funtype item=item}-->
								 <option value="<!--{$item.id}-->" <!--{if $funtype_1==$item.id}--> selected<!--{/if}-->><!--{$item.thename}-->(<!--{$item.enname}-->)</option>
								 <!--{/foreach}-->
								</select>
								<select name="funtype_2" id="ft">
								</select>

							</li>


                              <li>工作年限：<select  id="year" name="year">
										<option value="0" <!--{if $year==0}--> selected<!--{/if}-->>不限</option>
                                        <option value="-1" <!--{if $year==-1}--> selected<!--{/if}-->>无经验</option>
										<!--{foreach from=$years key=key item=item}-->
											<option value="<!--{$key}-->"<!--{if $year==$key}--> selected<!--{/if}-->><!--{$item}-->年</option>
										<!--{/foreach}-->
                                      </select>
                                      学    历：<select name="degree">
													<option value="0">不限</option>
												<!--{foreach from=$degrees key=key item=item}-->
													<option value="<!--{$key}-->"<!--{if $degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
												<!--{/foreach}-->
												</select>
                                          现居住地：
												  <select name="live_gnd_p" onchange="setCity(this,'live_gnd_c');">
													<option value="0">不限</option>
													<!--{foreach from=$adatas key=key item=item}-->
														<option value="<!--{$item.id}-->"<!--{if $live_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
													<!--{/foreach}-->
												  </select>
												  <select name="live_gnd_c" id="live_gnd_c" <!--{if !$aldatas}--> style="display:none;"<!--{/if}-->>
													<!--{if $aldatas}-->
													<!--{foreach from=$aldatas key=key item=item}-->
													<option value="<!--{$item.id}-->"<!--{if $live_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
													<!--{/foreach}-->
													<!--{/if}-->
												  </select><span id="showResult_live_gnd_c"></span>
										</li>
                                            <li>按更新日期搜索：
												<select  name="days">
													<option <!--{if $days==3}--> selected<!--{/if}--> value="3">最近3天</option>
													<option <!--{if $days==7}--> selected<!--{/if}--> value="7">最近一周</option>
													<option <!--{if $days==14}--> selected<!--{/if}--> value="14">最近两周</option>
													<option <!--{if $days==30}--> selected<!--{/if}--> value="30">最近一个月</option>
													<option <!--{if $days==0}--> selected<!--{/if}--> value="0">所有日期</option>
												</select>
												</li>
                                            <li><input type="text" maxlength="100" size="25" onclick="this.value='';" value="多关键词可用空格分隔" class="textgrey" name="keywords"> </li>
                                            <li><input type="image" src="/images/ssrc.gif" /></li>
                                            </ul>
										</form>

                        </div>
                        <div class="clearfix"></div>
                        	<!--{if $total}-->
                        <div id="fengge">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                              	<div class="red" id="fenges">标准简历(<!--{$total}-->)</div>
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody>
								  <form name="form2" method="post" action="/enterp/resume/down.do">
								  <tr class="tabHead">
                                        <th width="36" class="blankTd"></th>
                                        <th width="112">编号</th>
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
                                    <!--{foreach from=$resumes key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td class="tdCheckbox"><input type="checkbox"  value="<!--{$item.id}-->" name="PositionID[]">
										</td>
                                        <td style="word-wrap: break-word;" class="bolditem"><!--{$item.uid}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.f2}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
                                        <td style="word-wrap: break-word;"><!--{$item.work}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.schoolname}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.age}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$degrees[$item.degree]}--></td>
                                        <td class=" centerAlign"><!--{$item.area}--></td>
                                        <td class=" centerAlign"><!--{$item.modifydate|date_format:"%y-%m-%d"}--></td>
                                        <td nowrap="nowrap" class="action centerAlign"><a  target="_blank"  href="/enterp/resume/view.html?id=<!--{$item.id}-->&t=cn">查看</a> <a href="#"></a></td>
                                    </tr>
                                    <!--{/foreach}-->

                                    
                                    <tr class="list2">
                                      <td bgcolor="#FFE8D2" class="tdCheckbox"><input type="checkbox" onclick="unChkSelectAll('fengge','chkall')" id="chkall" value="CC000427542J90250041000" name="PositionID2" /></td>
                                      <td bgcolor="#FFE8D2" class="bolditem" style="word-wrap: break-word;">全选</td>
                                      <td colspan="9" nowrap="" bgcolor="#FFE8D2" class=" centerAlign">
                                        <div align="right">
										<a href="<!--{$url}-->">首页</a> <a href="<!--{$url}--><!--{if $page>1}-->&page=<!--{$page-1}--><!--{/if}-->">上页</a> <a href="<!--{$url}--><!--{if $page<$totalpage}-->&page=<!--{$page+1}--><!--{/if}-->">下页</a> <a href="<!--{$url}-->&page=<!--{$totalpage}-->">尾页</a> 第<span class="red"><!--{$page}--></span>/<span class="red"><!--{$totalpage}--></span>页，去
											<input value="1" name="PageList2" size="2" type="text" />页 
                                          <input value="Go" onclick="gotoPage('<!--{$url}-->',document.managedVacancyForm.PageList2.value)" type="button" />
                                        </div>
                                      </td>
                                      </tr>
                                    </form>
                                    </tbody>
                                </table>
                              </div>
                              
                              
                            </div>
                        </div>
						<!--{/if}-->
                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div>
<script type="text/javascript">

function unChkSelectAll(pstr,mstr){
	if($("#"+mstr).attr("checked") != ""){
		$("#"+pstr+" input:checkbox").attr("checked",true);
	}else{
		$("#"+pstr+" input:checkbox").attr("checked",false);
	}
}

function setSubData(_o,_t){
	var pid = _o.value;
	var _tid = _o.id.replace('_o','_t')
	var tobj = document.getElementById(_tid);
	$("#"+_tid).hide();
	tobj.options.length = 0;
	if(!pid || pid<=0){
		//alert("请选择有效信息！！！");
		;
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


function setCity(_o,_tid){
	var pid = _o.value;
	var tobj = document.getElementById(_tid);
	tobj.options.length = 0;
	if(!pid || pid<=0){
		$("#live_gnd_c").hide();
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getcitysbypid.do",
			dataType:"html",
			data:'pid='+pid,
			success:function(msg)
			{
				if(!msg){
					$("#live_gnd_c").hide();
				}else{
					msg = msg.split(":");
					if(msg.length>0){
						$("#live_gnd_c").show();
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							tobj.options.add(new Option(val[1],val[0]));
						}
					}else{
						$("#live_gnd_c").hide();
					}
				}
			}
		});
	}
}

function setZhiweileibie(_val){
	_val = typeof(_val) != 'undefined' ? _val : null;
	var tobj = document.getElementById("ft");
	tobj.options.length = 0;
	tobj.options.add(new Option("按职位名称搜索(Select Position)",""));
	$.ajax({
		type:"POST",
		url:"/ajax/getZhiweileibieWithEn.do",
		dataType:"html",
		data:'zhiweishuxin='+$("#zhiweishuxin").val(),
		success:function(msg)
		{
			if (msg.length>0)
			{
				msg = msg.split(":");
				if(msg.length>0){
					for(var i=0;i<msg.length;i++){
						var val = msg[i].split("|");
						if (val[0] == _val)
						{
							tobj.options.add(new Option(val[1],val[0], false, true));
						}
						else
						{
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}

		}
	});
}

$(document).ready(function(){
	setZhiweileibie(<!--{$funtype_2}-->);
});	


</script>
<!--{include file="include/footer.tpl"}-->
