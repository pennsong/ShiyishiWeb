<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
            	<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 视一视简历库 - 面试录制视频列表</div>
                <div class="clearfix"></div>
                        <div id="hrcenter">
                            <div id="hrzhiweilist">
                        <h2>面试邀请列表</h2>
                        <div class="clearfix"></div>
                        
                        <div id="fengge">
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody>
								  <tr class="tabHead">
                                        <th width="36" class="blankTd"></th>
                                        <th width="146" nowrap="" class=" centerAlign">姓名</th>
                                        <th width="62" nowrap="" class=" centerAlign">性别</th>
                                        <th width="70" nowrap="">招聘职务</th>
                                        <th width="87" nowrap="" id="suspendAnchor" class=" centerAlign">面试日期</th>
                                        <th width="87" nowrap="" class="centerAlign">操作</th>
                                    </tr>
                                    <!--{foreach from=$recode_video key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td class="tdCheckbox">
											<input type="checkbox"  value="<!--{$item.id}-->" name="PositionID[]">
										</td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.uname}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.gender==1}-->男<!--{else}-->女<!--{/if}--></td>
                                        <td style="word-wrap: break-word;"><!--{$item.title}--></td>
                                        <td class=" centerAlign"><!--{$item.interview_date|date_format:"%Y-%m-%d %H:%M"}--></td>
                                        <td nowrap="" class="action centerAlign">
											<a target="_blank" href="<!--{$pageurl}-->/video.do?id=<!--{$item.vid}-->">观看</a> 
										</td>
                                        </tr>
                                    <!--{/foreach}-->
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