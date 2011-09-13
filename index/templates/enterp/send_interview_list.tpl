<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 视一视简历库 - 面试邀请列表</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                        <div id="hrcentertop">
                            <span>
                                <ul>
                                    <li><a href="<!--{$pageurl}-->/list.html?s=0">已删除的邀请</a></li>
                                </ul>
                            </span>
                        </div>
                        <h2>面试邀请列表</h2>
                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                        	<form name="form2" method="post" action="<!--{$pageurl}-->/del.do">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody>
								  <tr class="tabHead">
                                        <th width="36" class="blankTd"></th>
                                        <th width="112">编号</th>
                                        <th width="70" nowrap="">面试类型</th>
                                        <th width="146" nowrap="" class=" centerAlign">姓名</th>
                                        <th width="62" nowrap="" class=" centerAlign">性别</th>
                                        <th width="70" nowrap="">招聘职务</th>
                                        <th width="87" nowrap="" id="suspendAnchor" class=" centerAlign">面试日期</th>
                                        <th width="87" nowrap="" class="centerAlign">操作</th>
                                    </tr>
                                    <!--{foreach from=$send_interview key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td class="tdCheckbox"><input type="checkbox"  value="<!--{$item.id}-->" name="PositionID[]">
										</td>
                                        <td style="word-wrap: break-word;" class="bolditem"><!--{$item.id}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.interview_type==1}-->普通<!--{else}-->视频<!--{/if}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.uname}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
                                        <td style="word-wrap: break-word;"><!--{$item.title}--></td>
                                        <td class=" centerAlign"><!--{$item.interview_date|date_format:"%Y-%m-%d %H:%M"}--></td>
                                        <td nowrap="" class="action centerAlign">
										<!--{if $s==1}-->
											<a  href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">修改</a> 
										<!--{/if}-->
										<a href="<!--{$pageurl}-->/<!--{if $s==1}-->del<!--{else}-->pass<!--{/if}-->.do?PositionID=<!--{$item.id}-->" onclick="if(confirm('确定操作?')==false){return false}else{ return true;}"><!--{if $s==1}-->删除<!--{else}-->恢复<!--{/if}--></a>
										</td>
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
                                        <input value=""  type="hidden" name="type" id="type" />
                                        <input value="<!--{if $s==1}-->删除<!--{else}-->恢复<!--{/if}-->" onclick="$('#type').val('box');document.forms[0].action='<!--{$pageurl}-->/<!--{if $s==1}-->del<!--{else}-->pass<!--{/if}-->.do';
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

function gotoPage(url){
	var i = $('#page').val();
	if (url.indexOf("?")!=-1){
		window.location.href = url+'&page='+i;
	}else{
		window.location.href = url+'?page='+i;
	}
}

</script>
<!--{include file="include/footer.tpl"}-->