<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 简历管理 - 已录取人员列表</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiweilist">
                        <div id="hrcentertop">
                            <span>
                                <ul>
                                    <li><a href="/enterp/resume/tmplist.html">简历暂存夹</a></li>                                
									<li><a href="/enterp/resume/downlist.html">已下载简历</a></li>
									<li><a href="/enterp/resume/boxlist.html">简历收件箱</a></li>
                                </ul>
                            </span>
                        </div>
                        <h2>已录取人员</h2>

                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody>
									<tr class="list2">
										<td colspan="12" id="cc" style="padding: 0;">
										<table width="100%" cellspacing="1" cellpadding="0" border="0">
											<tr class="tabHead">
											<th width="50">编号</th>
											<th width="165">姓名</th>
											<th width="146" nowrap="" class=" centerAlign">期望职位</th>
											<th width="62" nowrap="" class=" centerAlign">性别</th>
											<th width="70" nowrap="">工作年限</th>
											<th width="124" nowrap="" class="centerAlign">毕业院校</th>
											<th width="62" nowrap="" class=" centerAlign">年龄</th>
											<th width="62" nowrap="" class=" centerAlign">学历</th>
											<th width="68" nowrap="" class=" centerAlign">现居住地</th>
											<th width="87" nowrap="" id="suspendAnchor" class=" centerAlign">投递日期</th>
											<th width="87" nowrap="" class="centerAlign">操作</th>
										</tr>
										<!--{foreach from=$resume key=key item=item}-->
										<tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
										<td style="word-wrap: break-word;" class="bolditem"><!--{$item.uid}--></td>
										<td style="word-wrap: break-word;" class="bolditem"><!--{$item.uname}--></td>
										<td nowrap="" class=" centerAlign"><!--{$item.f2}--></td>
										<td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
										<td style="word-wrap: break-word;"><!--{$item.work}--></td>
										<td nowrap="" class=" centerAlign"><!--{$item.schoolname}--></td>
										<td nowrap="" class=" centerAlign"><!--{$item.age}--></td>
										<td nowrap="" class=" centerAlign"> <!--{$degrees.cn[$item.degree]}--></td>
										<td class=" centerAlign"><!--{$item.area}--></td>
										<td class=" centerAlign"><!--{$item.posttime|date_format:"%y-%m-%d"}--></td>
										<td nowrap="" class="action centerAlign"> <a  target="_blank" href="/enterp/resume/view.html?id=<!--{$item.id}-->&t=cn">查看<!--{if $item.viewed == 1}-->(v)<!--{/if}--></a> 
											<!--{if $item.rtype==3}-->
												<a  href="/enterp/resume/video.html?id=<!--{$item.id}-->" target="_blank" >视频</a> 
											<!--{/if}-->
										</td>
										</tr>
										<!--{/foreach}-->
										</table>
										</td>
                                    </tr>
                                    <tr class="list2">
                                      <td colspan="12" nowrap="" bgcolor="#FFE8D2" class=" centerAlign">&nbsp;
										<div align="right"><!--{include file=page.tpl}--></div>
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