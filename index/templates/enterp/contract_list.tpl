<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 控制面板 - 简历消费明细</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                        <h2>简历消费明细</h2>
                        <div class="clearfix"></div>
                        <div id="hrmingxi">
                        	<ul>
                                <li>合同号：<!--{$info.code}--></li>
                                <li>文字简历下载总量：<span class="red bold"><!--{$info.wordall}--></span></li>
                                <li>文字简历剩余数：<!--{$info.word}--></li>
                                <li>视频简历下载总量：<span class="red bold"><!--{$info.videoall}--></span></li>
                                <li>视频简历剩余数：<!--{$info.video}--></li>
                                <li>起止时间：<!--{$info.startdate|date_format:"%Y-%m-%d"}-->～<!--{$info.enddate|date_format:"%Y-%m-%d"}--></li>
                            </ul>
                            
                        </div>
                        <div id="fengge">
                        	
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody><tr class="tabHead">
                                        <th width="60">发生时间</th>
                                        <th width="112" nowrap="" class=" centerAlign">登录点</th>
                                        <th width="96" nowrap="" class=" centerAlign">用户</th>
                                        <th width="205" nowrap="" class=" centerAlign">简历</th>
                                        <th width="207" nowrap="" class=" centerAlign">下载简历类型</th>
                                        </tr>
                                    

									 <!--{foreach from=$list key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td style="word-wrap: break-word;" class="bolditem"><!--{$item.posttime|date_format:"%Y-%m-%d"}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.company}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.username}--></td>
                                        <td class=" centerAlign"><!--{$item.rname}--></td>
                                        <td class=" centerAlign">下载<!--{ if $item.status==1}-->文字<!--{/if}--><!--{ if $item.status==2}-->视频<!--{/if}--><!--{ if $item.status==1}-->文字和视频<!--{/if}-->简历</td>
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
                                      <td colspan="7" class="tdCheckbox"> 
                                       
                                        <div align="center">
                                          <input value="返回合同列表" onclick="window.location.href='/enterp/contract/';" type="button" />
                                      </div></td>
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
