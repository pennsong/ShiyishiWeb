<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 控制面板 -修改公司设置</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                            <div id="hrcentertop">
                                <span>
                                    <ul>
                                        <li><a href="javascript:{};"  onclick="openwin('/enterp/company/add.html',title)">新建分支机构</a></li>
                                    </ul>
                                </span>
                            </div>
                        <h2>修改公司设置</h2>
                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                        	
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                              	<div class="" id="fenges">您还可以下载<span class="red bold">123</span>份简历</div>
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody><tr class="tabHead">
                                        <th width="39" class="blankTd"></th>
                                        <th colspan="2">机构名称</th>
                                        <th width="75" nowrap="" class="centerAlign">操作</th>
                                    </tr>
                                      <!--{foreach from=$subcompany key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td class="tdCheckbox"><input type="checkbox"  value="<!--{$item.id}-->" name="PositionID[]"/></td>
                                        <td colspan="2" class="bolditem" style="word-wrap: break-word;"><!--{$item.name}--></td>
                                        <td nowrap="" class="action centerAlign"><a href="javascript:{};" onclick="openwin('/enterp/company/add.html?id=<!--{$item.id}-->',title)">设置</a> <a href="/enterp/company/del.html?id=<!--{$item.id}-->">删除</a></td>
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
                                      <td colspan="4" class="tdCheckbox"> 
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
<script type="text/javascript">

function openwin(url,title) { 
	window.open (url, title, "height=150, width=300, toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no") ;
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
