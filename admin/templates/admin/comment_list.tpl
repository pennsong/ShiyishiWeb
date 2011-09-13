<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script language="JavaScript">
function checkAll(checked)
{
	var oid = 'ftable';
	var checkbox = document.getElementById(oid).getElementsByTagName("input");
	for(i=0;i<checkbox.length;i++){
		checkbox[i].checked = checked;
	}
}
var turl = '<!--{$turl}-->';
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do?status=1<!--{if $s.itemid}-->&itemid=<!--{$s.itemid}--><!--{/if}-->" <!--{if 1==$s.status}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>已审核</span></a></li>
<li><a href="<!--{$pageurl}-->/list.do?status=0<!--{if $s.itemid}-->&itemid=<!--{$s.itemid}--><!--{/if}-->" <!--{if '0'==$s.status}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>未审核</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="post">
<input type="hidden" value="<!--{$s.status}-->" name='status'/>
<!--{$typename}-->ID：<input type="text" value="<!--{$s.itemid}-->" name="itemid" style="width:40px;"/> 
时间段：<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.startdate}-->" name="startdate"/>至<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.enddate}-->" name="enddate"/>
关键字：<input type="text" name="kw" value="<!--{$s.kw}-->" />
<input class="btn" type="submit" name="search" value="搜 索"/>
</form>
</div>
<div style="clear:both;">
<h2> “<!--{if 1==$s.status}-->已审核<!--{else}-->未审核<!--{/if}-->” <!--{$typename}-->评论列表</h2>
<form id="listform" name="listform" action="<!--{$pageurl}-->/check.do" method="post" target="post_main">
<input type="hidden" value="1" name='status' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal"></td>
		<td class="tal">顺序</td>
		<td class="tal" width="20%">评论语</td>
		<td class="tal">用户</td>
		<td class="tal">EMAIL</td>
		<td class="tal"><!--{$typename}-->名称</td>
		<td class="tal">IP</td>
		<td class="tal">评论时间</td>
		<td class="tal" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
		<td><!--{$item.order_id}--></td>
		<td class="tal"><span class="fourm_name"><!--{$item.content|substr:'60':''}--></span></td>
		<td class="tal"><!--{$item.username}--></td>
		<td><!--{$item.email}--></td>
		<td><a href="<!--{$baseurl|replace:'admin':'www'}-->/view/<!--{$item.itemid}-->.html" target="_blank"><!--{$item.itemname}--></a></td>
		<td><!--{$item.userip}--></td>
		<td><!--{$item.createdate}--></td>
		<td><!--{if $item.status==1}--><a class="fourm-two" href="<!--{$pageurl}-->/check.do?id=<!--{$item.id}-->&status=0" target="post_main">无效</a> | <!--{else}--><a class="fourm-two" href="<!--{$pageurl}-->/check.do?id=<!--{$item.id}-->&status=1" target="post_main">审核</a> <!--{/if}--> <a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->&page=<!--{$page}-->">编辑</a> |  <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;"><input type="button" onclick="checkAll(true);" value="全选" class="btn"/> <input type="button" onclick="checkAll(false);" value="反选" class="btn"/> <!--{if $s.status=='0'}--><input type="submit" value="通过审核" onclick="if(confirm('确定通过审核选中的评论吗?')){document.getElementById('chkisactive').value='1';return true}else{return false}" class="btn" /> <!--{/if}--><!--{if $s.status==1}--><input type="submit" value="取消审核" onclick="if(confirm('确定取消审核选中的评论吗?')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" /> <!--{/if}--><input type="submit" value="删 除" onclick="if(confirm('确定删除吗?')){document.getElementById('chkisactive').value='10';return true}else{return false}" class="btn" /></div><div class="rpage"><!--{include file=page.tpl}--></div>
<br>
</form>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->