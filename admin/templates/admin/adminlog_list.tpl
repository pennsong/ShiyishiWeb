<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<div style="float:left;">
<ul class="nav3">
<li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>管理员日志管理</span></a></li>
</ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/search.do" method="post">
<select name="model" style="width:88px;">
<option value="" >请选择栏目</option>
<!--{html_options options=$menus_keynames selected=$s.model}-->
</select>
<select name="saction" style="width:90px;">
<option value="" >请选择行为</option>
<!--{html_options options=$admin_action selected=$s.action}-->
</select>
<select name="adminid" style="width:130px;">
<option value="" >请选择操作管理员</option>
<!--{foreach from=$adminnames key=key item=item}-->
<option value="<!--{$key}-->" <!--{if $key==$s.adminid}-->selected<!--{/if}-->><!--{$item.admin_name}-->[<!--{$item.admin_realname}-->]</option>
<!--{/foreach}-->
</select>
时间段：<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.startdate}-->" name="startdate"/>至<input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.enddate}-->" name="enddate"/>
<input class="btn" type="button" name="search" value="搜 索" onclick="searchCheck('search');"/><input class="btn" type="button" name="clear" value="清 除" onclick="searchCheck('clear');" style="margin-left:5px;"/>

</form>
</div></div>
<div style="clear:both;">
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
	<tr class="tr3 s3">
		<td class="tal" width="12%">操作管理员</td>
		<td class="tal" width="10%">操作栏目</td>
		<td class="tal" width="8%">行为</td>
		<td class="tal">做了什么...</td>
		<td class="tal" width="10%">IP</td>
		<td class="tal" width="6%">详细</td>
		<td class="tal" width="6%" style="text-align:center">操作</td>
	</tr>
<!--{foreach from=$rows item=item}-->
	<tr class="tr3">
		<td class="tal"><span class="fourm_name"><!--{$item.adminname}-->-<!--{$item.adminid}--></span></td>
		<td><!--{$item.model}--></td>
		<td><!--{$item.action}--></td>
		<td><!--{$item.dothing}--></td>
		<td><!--{$item.onlineip}--></td>
		<td><a onclick="viewMore('<!--{$pageurl}-->/view.do?id=<!--{$item.id}-->');" style="cursor:pointer;">查看</a></td>
		<td><a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->&page=<!--{$page}-->" onclick="return confirm('确定删除?')">删除</a></td>
	</tr>
<!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
<br>
<script language="JavaScript">
function viewMore(url){
	popup('查看日志详情',url);
}

function searchCheck(v)
{	
	var fm = document.getElementById('searchForm');
	if(v=='clear'){
		if(confirm('确定删除所有符合条件的日志吗？请谨慎，此操作不可逆！')){
			fm.action = '<!--{$pageurl}-->/clear.do';
			fm.submit();
		}
	}else{
		fm.submit();
	}
	
}
</script>
<!--{include file=footer.tpl}-->