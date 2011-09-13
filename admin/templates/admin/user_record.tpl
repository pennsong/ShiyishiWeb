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
var turl = window.location.href;
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
</script>
<div style="float:left;">
  <ul class="nav3">
    <li><a href="#" class="btn1"><span>查看“<!--{$uinfo.email}-->”的朋友会员</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?status=1" class="btn2"><span>返回会员列表</span></a></li>
  </ul>
</div>
<div style="clear:both;">
<form id="listform" name="listform" action="<!--{$pageurl}-->/check.do" method="post" target="post_main">
<input type="hidden" value="1" name='status' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal"></td>
    <td class="tal">Email</td>
	<td class="tal">手机号</td>
	<td class="tal">查看简历</td>
	<td class="tal">注册日期</td>
	<td class="tal">状态</td>
    <td class="tal" width="10%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
    <td class="tal"><!--{$item.email}--></td>
	<td class="tal"><!--{$item.mobile}--></td>
	<td class="tal"><a class="fourm-two" href="<!--{$baseurl}-->/admin/txtresume.do?uid=<!--{$item.id}-->">文字</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/videoresume.do?uid=<!--{$item.id}-->">视频</a></td>
    <td><!--{$item.regdate|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	<td><!--{if $item.status==1}-->正式会员<!--{elseif $item.status==0}-->待审核<!--{else}-->已删除<!--{/if}--></td>
    <td><a class="fourm-two" href="javascript:manageuser('<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->');">编辑</a> |<!--{if $item.status>=0}--> <a class="fourm-two" href="<!--{$pageurl}-->/check.do?id=<!--{$item.id}-->&status=-1" onclick="return confirm('确定删除该用户吗?删除后还可恢复')" target="post_main">删除</a> <!--{else}--> <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除该用户吗?删除后不可恢复')" target="post_main">彻底删除</a><!--{/if}--></td>
  </tr>
  <!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;"><input type="button" onclick="checkAll(true);" value="全选" class="btn"/> <input type="button" onclick="checkAll(false);" value="反选" class="btn"/> <!--{if $s.status==1}--><input type="submit" value="删除" onclick="if(confirm('确定删除选定的会员吗?')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" /> <!--{elseif $s.status==0}--><input type="submit" value="审核" onclick="if(confirm('确定通过审核选中的会员吗?')){document.getElementById('chkisactive').value='1';return true}else{return false}" class="btn" />  <!--{else}--><input type="submit" value="恢复" onclick="if(confirm('确定激活选中的会员吗?')){document.getElementById('chkisactive').value='1';return true}else{return false}" class="btn" /> <!--{/if}--></div><div class="rpage"><!--{include file=page.tpl}--></div>
</div>
</form>
</div>
<script language="JavaScript">
function manageuser(url){
    popup('会员管理',url,410,250);
}
function backfunc(){
	$.box.close();
	self.window.location.reload();
}
</script>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
