<!--{include file="include/header.tpl"}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
		<div id="content" class="container_24">
        	<div class="grid_24">
				<!--{include file="login_club.tpl"}-->
<div id="hrlocation"><img src="/images/Icon1.gif" /> 您现在的位置是：<a href="/enterp/">企业用户中心首页</a> - 简历管理 -申请视频面试</div>
                <div class="clearfix"></div>
                <div id="hrcenter">
                    <div id="hrzhiwei">
                        <h2>视频面试记录</h2>
						<div id="fengge">
                        	<div id="fengeright">
                                <p><img src="/images/jia.gif" width="14" height="14" align="texttop" /> <a href="/enterp/resume/downlist.html">申请视频面试</a></p>
                            </div>
                            <div id="panes">
                              <div id="fenggemain" style="display: block;">
                                <table width="100%" cellspacing="1" cellpadding="0" border="0" id="recordtable" class="listTab">
                                  <tbody><tr class="tabHead">
                                      <th width="36" class="blankTd"></th>
                                        <th width="112">房间</th>
                                        <th width="146" nowrap="" class=" centerAlign">开始时间</th>
                                        <th width="62" nowrap="" class=" centerAlign">结束时间</th>
                                        <th width="70" nowrap="">申请时间</th>
										<th width="124" nowrap="" class="centerAlign">状态</th>
                                    </tr>
                                    <!--{foreach from=$interview key=key item=item}-->
                                    <tr class="list1" onmouseover="this.style.backgroundColor='#FFE8D2'" onmouseout="this.style.backgroundColor=''">
                                        <td class="tdCheckbox"></td>
                                       <td style="word-wrap: break-word;" class="bolditem"><!--{if $item.room}--><!--{$item.room}--><!--{else}-->未分配<!--{/if}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.starttime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
                                        <td style="word-wrap: break-word;"><!--{$item.endtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{$item.createtime}--></td>
                                        <td nowrap="" class=" centerAlign"><!--{if $item.status==1}-->审核通过<!--{else}-->未通过<!--{/if}--></td>
                                        </tr>
                                    <!--{/foreach}-->

                                    <tr class="list2">
                                      <td bgcolor="#FFE8D2" class="tdCheckbox"></td>
                                      <td bgcolor="#FFE8D2" class="bolditem" style="word-wrap: break-word;"></td>
                                      <td colspan="9" nowrap="" bgcolor="#FFE8D2" class=" centerAlign">
                                        <div align="right">
										<a href="<!--{$url}-->">首页</a> <a href="<!--{$url}--><!--{if $page>1}-->?page=<!--{$page-1}--><!--{/if}-->">上页</a> <a href="<!--{$url}--><!--{if $page<$totalpage}-->?page=<!--{$page+1}--><!--{/if}-->">下页</a> <a href="<!--{$url}-->?page=<!--{$totalpage}-->">尾页</a> 第<span class="red"><!--{$page}--></span>/<span class="red"><!--{$totalpage}--></span>页，去
											<input value="1" name="PageList2" size="2" type="text" id="page" />页 
                                          <input value="Go" onclick="gotoPage('<!--{$url}-->')" type="button" />
                                        </div>
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

function gotoPage(url){
	var i = $('#page').val();
	if (url.indexOf("?")!=-1){
		window.location.href = url+'&page='+i;
	}else{
		window.location.href = url+'?page='+i;
	}
}

function check_time(){
	var sd = $('#startdate').val();
	var st = $('#starttime').val();
	var ed = $('#enddate').val();
	var et = $('#endtime').val();
	if(sd=='' || st=='' || ed=='' || et==''){
		$('#error').show();
		return false;
	}
	return true;
}
</script>
<!--{include file="include/footer.tpl"}-->