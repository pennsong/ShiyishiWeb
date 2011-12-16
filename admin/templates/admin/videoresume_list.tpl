<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
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
	<li><a href="<!--{$pageurl}-->/list.do?status=0" <!--{if $s.status==0}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>未审核列表</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?status=1" <!--{if 1==$s.status}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>已审核列表</span></a></li>
  </ul>
</div>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<input name="status" type="hidden" value="<!--{$s.status}-->"/>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    UID:
    <input name="uid" type="text" value="<!--{if $s.uid>0}--><!--{$s.uid}--><!--{/if}-->"/>
	<input type="submit" name="search" value="搜索" />
</div>
</form>
<div style="clear:both;">
<form id="listform" name="listform" action="<!--{$pageurl}-->/check.do" method="post" target="post_main">
<input type="hidden" value="1" name='status' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal">UID</td>
	<td class="tal">Email</td>
	<td class="tal">手机号</td>
	<td class="tal">更新日期</td>
	<td class="tal">上传日期</td>
    <td class="tal">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><!--{$item.uid}--></td>
	<td class="tal"><!--{$item.email}--></td>
	<td class="tal"><!--{$item.mobile}--></td>
    <td><!--{$item.modifydate|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	<td><!--{$item.createdate}--></td>
    <td><a class="fourm-two" href="javascript:viewVod('<!--{$pageurl}-->/view.do?id=<!--{$item.id}-->');">查看</a> |<!--{if $item.status==1}--> <a class="fourm-two" href="<!--{$pageurl}-->/check.do?id=<!--{$item.id}-->&status=0" onclick="return confirm('确定取消审核吗？')" target="post_main">取消审核</a> <!--{else}--> <a class="fourm-two" href="<!--{$pageurl}-->/check.do?id=<!--{$item.id}-->&status=1" onclick="return confirm('确定审核该视频简历吗？')" target="post_main">通过审核</a><!--{/if}--></td>
  </tr>
  <!--{/foreach}-->
</table>
</form>
</div>
<script language="JavaScript">
function viewVod(url){
    popup('查看视频简历',url,476,418);
}
function backfunc(){
	$.box.close();
	self.window.location.reload();
}
</script>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
