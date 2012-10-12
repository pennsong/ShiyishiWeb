<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 简历管理 -简历收件箱</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                            <div id="hrcentertop">
                                <span>
                                    <ul>
                                   		<li><a href="/enterp/resume/tmplist.html">简历暂存夹</a></li>
                                   		<li><a href="/enterp/resume/enroll.html">已录取人员</a></li>
                                        <li><a href="/enterp/resume/downlist.html">已下载的简历</a></li>
                                    </ul>
                                </span>
                            </div>
                        <h2>简历收件箱</h2>
                        <div id="hrzhiweilisttop">
                            <div id="hrcentertop">
                                <span>
                                    <ul>
                                        <li>
											<form name="form1" method="post" action="/enterp/resume/boxlist.do">
											搜索简历：<input type="text" value="<!--{if $key!=''}--><!--{$key}--><!--{else}-->请填写职位名称<!--{/if}-->" onclick="this.value='';" name="key" /> 
											开始时间：<input type="tetx" name="startdate" value="<!--{$startdate}-->" class="Wdate" onClick="WdatePicker()" style="width:120px;" /> 结束时间：<input type="tetx" name="enddate" value="<!--{$enddate}-->"  class="Wdate" onClick="WdatePicker()" style="width:120px;"/> <input type="submit" value="搜索" />
											</form>
										</li>
                                    </ul>
                                </span>
                            </div>

                            查看最新简历：
                            <select onchange="select_posttime('/enterp/resume/boxlist.do',this.value)" name="days">
								<option <!--{if $days==0}--> selected<!--{/if}--> value="0">近期时间</option>
								<option <!--{if $days==3}--> selected<!--{/if}--> value="3">最近3天</option>
								<option <!--{if $days==7}--> selected<!--{/if}--> value="7">最近一周</option>
								<option <!--{if $days==14}--> selected<!--{/if}--> value="14">最近两周</option>
								<option <!--{if $days==30}--> selected<!--{/if}--> value="30">最近一个月</option>
							</select>
                        </div>
                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                        	<form name="form2" method="post" action="/enterp/resume/down.do">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                              	<div class="red" id="fenges">标准简历(<!--{$total}-->)</div>
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody>
								  <tr class="tabHead">
                                        <th width="36" class="blankTd"></th>
                                        <th width="112">编号</th>
                                        <th width="146" nowrap="" class=" centerAlign">应聘职位</th>
                                        <th width="62" nowrap="" class=" centerAlign">性别</th>
                                        <th width="70" nowrap="">工作年限</th>
										<th width="124" nowrap="" class="centerAlign">毕业院校</th>
										<th width="124" nowrap="" class="centerAlign">专业</th>
                                        <th width="62" nowrap="" class=" centerAlign">学历</th>
                                        <th width="62" nowrap="" class=" centerAlign">年龄</th>
                                        <th width="68" nowrap="" class=" centerAlign">现居住地</th>
                                        <th width="87" nowrap="" id="suspendAnchor" class=" centerAlign">投递日期</th>
                                        <th width="87" nowrap="" class="centerAlign">操作</th>
                                    </tr>
                                    <!--{foreach from=$resume key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td class="tdCheckbox"><input type="checkbox"  value="<!--{$item.id}-->" name="PositionID[]"/>
										</td>
                                        <td style="word-wrap: break-word;" class="bolditem"><!--{$item.uid}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.title}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
                                        <td style="word-wrap: break-word;"><!--{$item.work}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.schoolname}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.major}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$degrees.cn[$item.degree]}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.age}--></td>
										</td>
                                        <td class=" centerAlign"><!--{$item.area}--></td>
                                        <td class=" centerAlign"><!--{$item.posttime|date_format:"%y-%m-%d"}--></td>
                                        <td nowrap="" class="action centerAlign"><a class="songDefA" target="_blank" href="/enterp/resume/view.html?id=<!--{$item.id}-->&t=cn&from=boxlist">查看<!--{if $item.viewed == 1}-->(v)<!--{/if}--></a> <a href="/enterp/resume/del.do?PositionID=<!--{$item.id}-->&type=box" onclick="if(confirm('确定删除?')==false){return false}else{ return true;}">删除</a></td>
                                        </tr>

                                    <!--{/foreach}-->

                                    <tr class="list2">
                                      <td bgcolor="#FFE8D2" class="tdCheckbox"><input type="checkbox" onclick="unChkSelectAll('fengge','chkall')" id="chkall" value="CC000427542J90250041000" name="PositionID2" /></td>
                                      <td bgcolor="#FFE8D2" class="bolditem" style="word-wrap: break-word;">全选</td>
                                      <td colspan="10" nowrap="" bgcolor="#FFE8D2" class=" centerAlign">
										<!--{if $totalpage>1}-->
                                        <div align="right">
										<a href="<!--{$url}-->">首页</a> <a href="<!--{$url}--><!--{if $page>1}-->&page=<!--{$page-1}--><!--{/if}-->">上页</a> <a href="<!--{$url}--><!--{if $page<$totalpage}-->&page=<!--{$page+1}--><!--{/if}-->">下页</a> <a href="<!--{$url}-->&page=<!--{$totalpage}-->">尾页</a> 第<span class="red"><!--{$page}--></span>/<span class="red"><!--{$totalpage}--></span>页，去
											<input value="1" name="PageList2" size="2" type="text" />页 
                                          <input value="Go" onclick="gotoPage('<!--{$url}-->',document.managedVacancyForm.PageList2.value)" type="button" />
                                        </div>
										<!--{/if}-->
                                      </td>
                                      </tr>
                                    <tr class="list2">
                                      <td colspan="11" class="tdCheckbox"> <div align="center">
                                        <input value=""  type="hidden" name="type" id="type" />
 </div>
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

function openwin(url,title) { 
	window.open (url, title, "height=300, width=300, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") ;
}

function unChkSelectAll(pstr,mstr){
	if($("#"+mstr).attr("checked") != ""){
		$("#"+pstr+" input:checkbox").attr("checked",true);
	}else{
		$("#"+pstr+" input:checkbox").attr("checked",false);
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
</script>
<!--{include file="include/footer.tpl"}-->