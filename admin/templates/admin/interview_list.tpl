<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script language="JavaScript">
function checkAll(checked)
{
	var oid = 'ftable';
	var checkbox = document.getElementById(oid).getElementsByTagName("input");
	if(checked){
		for(i=0;i<checkbox.length;i++){
				checkbox[i].checked = checked;
		}
	}else{
		for(i=0;i<checkbox.length;i++){
			if(checkbox[i].checked){
				checkbox[i].checked = '';
			}else{
				checkbox[i].checked = 'true';
			}
		}
	}
}
var turl = '<!--{$turl}-->'
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<div style="clear:both;">
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>视频审核列表</span></a></li>
  </ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:0px 0 0 0;">
	视频申请状态：
	<select name="status" onchange="window.location.href = '<!--{$pageurl}-->/list.do?s='+this.value;">
	   <option  <!--{if $s==0}--> selected<!--{/if}--> value="0">未审核</option>
	   <option  <!--{if $s==1}--> selected<!--{/if}--> value="1">通过申请</option>
	   <option  <!--{if $s==2}--> selected<!--{/if}--> value="2">删除的申请</option>
   </select>
</div>

<form id="listform" name="listform" action="<!--{$pageurl}-->/del.do" method="post" target="post_main">
<input type="hidden" value="-1" name='status' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal"></td>
	<td class="tal">ID</td>
	<td class="tal">公司名</td>
	<td class="tal">面试人</td>
<!--{if $s}-->
    <td class="tal">房间</td>
<!--{/if}-->
    <td class="tal">开始时间</td>
    <td class="tal">结束时间</td>

    <td class="tal">通过时间</td>
    <td class="tal">禁止时间</td>

    <td class="tal">申请时间</td>
    <td class="tal">小时</td>
	<td class="tal">状态</td>
    <td class="tal" width="10%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
	<td class="tal"><span class="fourm_name"><!--{$item.id}--></span></td>
	<td class="tal"><span class="fourm_name"><!--{$item.company}--></span></td>
	<td class="tal"><span class="fourm_name"><!--{$item.uname}--></span></td>
<!--{if $s}-->
   <td class="tal"><!--{$item.room}--></td>
<!--{/if}-->
   <td class="tal"><!--{$item.starttime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
    <td class="tal"></a><!--{$item.endtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>

    <td class="tal"></a><!--{$item.passtime}--></td>
    <td class="tal"></a><!--{$item.nopasstime}--></td>

    <td class="tal"></a><!--{$item.createtime}--></td>
    <td class="tal"></a><!--{$item.hours}-->小时</td>
    <td class="tal"></a><!--{if $item.status==1}-->通过审核<!--{else}-->未审核<!--{/if}--></td>
    <td><!--{if $item.status==1}--><a class="fourm-two" href="<!--{$pageurl}-->/addleader.do?aid=<!--{$item.id}-->">邀请</a> | <!--{/if}--><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?ids=<!--{$item.id}-->&status=<!--{if $item.status==1}-->0<!--{else}-->1<!--{/if}-->"><!--{if $item.status==1}-->禁止<!--{else}-->通过<!--{/if}--></a><!--{if $s<2}--> | <a class="fourm-two" href="<!--{$pageurl}-->/del.do?ids=<!--{$item.id}-->">删除</a><!--{/if}-->
	</td>
  </tr>
  <!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;"><input type="button" onclick="checkAll(true);" value="全选" class="btn"/> <input type="button" onclick="checkAll(false);" value="反选" class="btn"/> 
<!--{if $s<2}-->
<input type="submit" value="删除" onclick="if(confirm('确定删除选定的用户吗?')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" />
<!--{/if}-->
<input type="submit" value="<!--{if $s==1}-->禁止<!--{else}-->通过<!--{/if}-->" onclick="if(confirm('确定<!--{if $s==1}-->禁止<!--{else}-->通过<!--{/if}-->选定的用户吗?')){document.getElementById('chkisactive').value='<!--{if $s==1}-->0<!--{else}-->1<!--{/if}-->'; document.forms[0].action='<!--{$pageurl}-->/edit.do'; return true}else{return false}" class="btn" />
</div><div class="rpage"><!--{include file=page.tpl}--></div>
</div>
</form>
</div>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
