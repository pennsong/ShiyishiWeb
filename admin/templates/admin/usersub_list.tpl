<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
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
var turl = '<!--{$turl}-->'
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>

<div style="clear:both;">
<form id="listform" name="listform" action="<!--{$pageurl}-->/usersubdel.do" method="post" target="post_main">
<input type="hidden" value="<!--{$cid}-->" name='cid' id='cid'/>

<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal"></td>
	<td class="tal">ID</td>
    <td class="tal">名称</td>
	<td class="tal">日期</td>
    <td class="tal" width="10%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
	<td class="tal"><span class="fourm_name"><!--{$item.id}--></span></td>
    <td class="tal"><!--{$item.name}--></td>
    <td class="tal"><!--{$item.createdate}--></td>
    <td>
	<a class="fourm-two" href="<!--{$pageurl}-->/ usersubdel.do?cid=<!--{$cid}-->" onclick="return confirm('确定删除该用户吗?删除后不可恢复')" target="post_main">彻底删除</a>
	</td>
  </tr>
  <!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;">
<input type="button" onclick="checkAll(true);" value="全选" class="btn"/>
<input type="button" onclick="checkAll(false);" value="反选" class="btn"/> 
<input type="submit" value="删除" onclick="if(confirm('确定删除选定的会员吗?')){return true}else{return false}" class="btn" /> </div>
<div class="rpage"><!--{include file=page.tpl}--></div>
</div>
</form>
</div>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
