<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
           	  <div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 控制面板 - 合同执行情况</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                        <h2>合同执行情况</h2>
                        <div class="clearfix"></div>
                        <div id="hrzhiweilisttop">
                            合同状态：
                            <select name="status" onchange="window.location.href = '/enterp/contract/?status='+this.value;">
							   <option  <!--{if $status==1}--> selected<!--{/if}--> value="1">执行中合同</option>
							   <option  <!--{if $status==2}--> selected<!--{/if}--> value="2">已到期合同</option>
							   <option  <!--{if $status==3}--> selected<!--{/if}--> value="3">全部合同</option>
                           </select>
                        </div>
                        <div id="fengge">
                        	
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody><tr class="tabHead">
                                        <th width="299">合同号</th>
                                        <th width="133" nowrap="" class=" centerAlign">文字简历总量</th>
                                        <th width="130" nowrap="" class=" centerAlign">文字简历剩余数</th>
                                    <th width="124" nowrap="" class=" centerAlign">视频简历总量</th>
                                    <th width="107" nowrap="" class=" centerAlign">视频简历剩余数</th>
                                        <th width="128" nowrap="" class=" centerAlign">有效期</th>
                                        </tr>
										 <!--{foreach from=$contract key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td style="word-wrap: break-word;" class="bolditem"><a href="/enterp/contract/info.html?id=<!--{$item.id}-->"><!--{$item.code}--></a></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.wordall}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.word}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.videoall}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.video}--></td>
                                        <td class=" centerAlign"><!--{$item.startdate|date_format:"%Y-%m-%d"}-->～<!--{$item.enddate|date_format:"%Y-%m-%d"}--></td>
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
                                      <td colspan="6" class="tdCheckbox"> 
                                       </td>
                                      </tr>
                                    
                                    </tbody>
                                </table>
                              </div>
                              
                              
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
        	</div>
<!--{include file="include/footer.tpl"}-->
