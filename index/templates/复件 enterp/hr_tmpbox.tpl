<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 视一视简历库 -简历暂存夹</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                        <div id="hrcentertop">
                            <span>
                                <ul>
                                    <li><a href="/enterp/resume/downlist.html">已下载的简历</a></li>
                                </ul>
                            </span>
                        </div>
                        <h2>简历暂存夹</h2>
						<!--
                        <div id="hrzhiweilisttop">
                            公司名称：
                              <select onchange="return selTimeSpan_onchange()" name="selTimeSpan"><option selected="" value="3">北京华章人力顾问</option></select>
                        </div>
						-->
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
                                        <td style="word-wrap: break-word;" class="bolditem"><!--{$item.id}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.f2}-->(<!--{$item.area}-->)</td>
                                        <td style="word-wrap: break-word;"><!--{$item.work}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.schoolname}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.age}--></td>
                                        <td nowrap="" class=" centerAlign"> <!--{$degrees[$item.degree]}-->
										</td>
                                        <td class=" centerAlign"><!--{$item.area}--></td>
                                        <td class=" centerAlign"><!--{$item.createdate|date_format:"%y-%m-%d"}--></td>
                                        <td nowrap="" class="action centerAlign"><a  target="_blank"  href="/enterp/resume/view.html?id=<!--{$item.id}-->&t=cn">查看</a> <a href="/enterp/resume/del.do?PositionID=<!--{$item.id}-->&type=tmp" onclick="if(confirm('确定删除?')==false){return false}else{ return true;}">删除</a></td>
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

                                    <tr class="list2">
                                      <td colspan="11" class="tdCheckbox"> <div align="center">
										<input value="下载简历"  type="submit" />
                                        <input value=""  type="hidden" name="type" id="type" />
                                        <input value="删除" onclick="$('#type').val('box');document.forms[1].action='/enterp/resume/del.do';
" type="submit" /></div>
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

function unChkSelectAll(pstr,mstr){
	if($("#"+mstr).attr("checked") != ""){
		$("#"+pstr+" input:checkbox").attr("checked",true);
	}else{
		$("#"+pstr+" input:checkbox").attr("checked",false);
	}
}
</script>
<!--{include file="include/footer.tpl"}-->