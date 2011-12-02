<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 职位管理 - 已发布职位列表</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiweilist">
                        <h2>已发布职位列表</h2>
                        <div id="hrzhiweilisttop">
                        	<span>关键字：
                              <select name="vacancySearch">
                                    <option selected="" value="0">职位名称</option>
                                </select>
                                <input name="" type="text" /> <input class="chakan" name="" type="button" /> 
                            </span>
                            所属部门：
                            <select name="" onchange="window.location.href = '/enterp/publish_job/list.do?sub='+this.value;">
							<option value="">请选择</option>
								<!--{foreach from=$subcompany key=key item=subs}-->
									<option value="<!--{$subs.id}-->" <!--{if $subs.id==$sub}-->selected<!--{/if}-->><!--{$subs.name}--></option>
								<!--{/foreach}-->
                        	</select>
                        </div>
                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                        	<div id="fengeright">
                                <p><!--<span class="fengerightspan">发布余额：<span class="red">4</span>个</span>--> <img src="/images/jia.gif" width="14" height="14" align="texttop" /> <a href="/enterp/publish_job/">发布新职位</a></p>
                            </div>
                            <ul id="tabs">
                              <li><a <!--{if $t==1 || !$t}-->class="current"<!--{/if}--> href="/enterp/publish_job/list.do?<!--{if $sub}-->sub=<!--{$sub}-->&<!--{/if}-->t=1">发布中职位</a></li>
                              <li><a <!--{if $t==2 || !$t}-->class="current"<!--{/if}--> href="/enterp/publish_job/list.do?<!--{if $sub}-->sub=<!--{$sub}-->&<!--{/if}-->t=2">已到期职位</a></li>
                              <li><a <!--{if $t==3 || !$t}-->class="current"<!--{/if}--> href="/enterp/publish_job/list.do?<!--{if $sub}-->sub=<!--{$sub}-->&<!--{/if}-->t=3">已暂停职位</a></li>
                              <li><a <!--{if $t==4 || !$t}-->class="current"<!--{/if}--> href="/enterp/publish_job/list.do?<!--{if $sub}-->sub=<!--{$sub}-->&<!--{/if}-->t=4">已删除职位</a></li>
                              <li><a <!--{if $t==5 || !$t}-->class="current"<!--{/if}--> href="/enterp/publish_job/list.do?<!--{if $sub}-->sub=<!--{$sub}-->&<!--{/if}-->t=5">所有职位</a></li>
                              <div class="clearfix"></div>
                            </ul>
                            <div class="clearfix"></div>
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                              	<div id="fenges">符合搜索条件的职位共有 <span class="red"><!--{$total}--></span> 个</div>
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                    <tbody><tr class="tabHead">
                                        <th width="36" class="blankTd"></th>
                                        <th width="167">职位名称</th>
                                        <th width="76" nowrap="" class=" centerAlign">发布日期</th>
                                        <th width="76" nowrap="" class=" centerAlign">截止日期</th>
                                        <th width="109" nowrap="">所属部门</th>
                                        <th width="68" nowrap="" class="centerAlign">工作地点</th>
										<!--<th width="68" nowrap="" class=" centerAlign">应聘简历</th>-->
                                        <th width="83" nowrap="" class="centerAlign">操作</th>
                                    </tr>
									<!--{foreach from=$jobs key=key item=item}-->
										<tr class="list2" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
											<td class="tdCheckbox">
												<!--<input type="checkbox" value="<!-{$item.id}->" name="PositionID[]">-->
											</td>
										
											<td style="word-wrap: break-word;" class="bolditem">
												<!--{$item.title}-->
											</td>
											<td nowrap="" class=" centerAlign"><!--{$item.startdate|date_format:"%Y-%m-%d"}--></td>
											<td nowrap="" class=" centerAlign">
												<span class="deadline"><!--{$item.enddate|date_format:"%Y-%m-%d"}--></span>
											</td>
											<td style="word-wrap: break-word;">
											<!--{if $item.scid==0}-->
												<!--{$e_user}-->
											<!--{else}-->
												<!--{foreach from=$subcompany key=key item=subs}-->
													<!--{if $subs.id==$item.scid}--><!--{$subs.name}--><!--{/if}-->
												<!--{/foreach}-->
											<!--{/if}--></td>
											<td class="centerAlign"><span><!--{$adata[$item.live_gnd_p].name}--> , <!--{$city[$item.live_gnd_p][$item.live_gnd_c].name}--></span></td>
											<!--<td class=" centerAlign"><a href="">10</a></td>-->
											<td nowrap="" class="action centerAlign">
												<!--{if $t == 3}-->
													<a  href="/enterp/publish_job/?jid=<!--{$item.id}-->" >修改</a> 
												<!--{else}-->
												<a  href="/jobs/view/<!--{$item.id}-->.html" target="_blank">查看</a> 
												<a  href="/enterp/publish_job/?jid=<!--{$item.id}-->" >修改</a> 
												<!--{/if}-->
												<!--{if $item.status}-->
													<a title="暂时停止职位" href="/enterp/publish_job/stop.do?id=<!--{$item.id}-->">暂停</a>
												<!--{/if}-->
												<!--{if $item.status==0}-->
													<a title="取消暂时停止职位" href="/enterp/publish_job/stop.do?id=<!--{$item.id}-->&p=1">取消暂停</a>
												<!--{/if}-->
												<!--{if $item.status>0}-->
													<a title="删除职位" href="/enterp/publish_job/del.do?id=<!--{$item.id}-->">删除</a>
												<!--{/if}-->
												<!--{if $item.status==-1}-->
													<a title="取消删除职位" href="/enterp/publish_job/del.do?id=<!--{$item.id}-->&p=2">取消删除</a>
												<!--{/if}-->
											</td>
										</tr>
									<!--{/foreach}-->
                                    <tr class="list2">
                                      <td bgcolor="#FFE8D2" class="tdCheckbox"><!--<input type="checkbox" onclick="unChkSelectAll('fengge','chkall')" id="chkall" value="CC000427542J90250041000" name="PositionID2" />--></td>
                                      <td bgcolor="#FFE8D2" class="bolditem" style="word-wrap: break-word;"><!--全选--></td>
                                      <td colspan="9" nowrap="" bgcolor="#FFE8D2" class=" centerAlign">
                                        <div align="right">
											<a href="<!--{$url}-->">首页</a> <a href="<!--{$url}--><!--{if $page>1}-->&page=<!--{$page-1}--><!--{/if}-->">上页</a> <a href="<!--{$url}--><!--{if $page<$totalpage}-->&page=<!--{$page+1}--><!--{/if}-->">下页</a> <a href="<!--{$url}-->&page=<!--{$totalpage}-->">尾页</a> 第<span class="red"><!--{$page}--></span>/<span class="red"><!--{$totalpage}--></span>页，去
											<input value="1" name="PageList2" size="2" type="text" />页 
                                          <input value="Go" onclick="gotoPage('<!--{$url}-->',document.managedVacancyForm.PageList2.value)" type="button" />
                                        </div>
                                      </td>
                                      </tr>
                                    </tbody>
                                </table>
                              </div>
                        </div>

                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div>

<script type="text/javascript">
function gotoPage(url,i){
	window.location.href = url+'&page='+i;
}
function unChkSelectAll(pstr,mstr){
	if($("#"+mstr).attr("checked") != ""){
		$("#"+pstr+" input:checkbox").attr("checked",true);
	}else{
		$("#"+pstr+" input:checkbox").attr("checked",false);
	}
}


</script>
<!--{include file="include/footer.tpl"}-->
