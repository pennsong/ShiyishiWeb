<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<form id="listform" name="listform" action="<!--{$baseurl}-->/member/do/myjob.do" method="post" target="post_main">
<input type="hidden" value="int" name="act" />
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <h2>我的在线面试</h2>
        <table width="100%" cellspacing="1" cellpadding="0" id="ftable">
          <tr>
            <th width="4%"></th>
            <th width="21%">面试职位</th>
            <th width="24%">公司名称</th>
            <th width="12%">面试类型</th>
            <th width="14%">面试时间</th>
            <th width="13%">邀请</th>
            <th width="12%">操作</th>
          </tr>
		  <!--{foreach from=$rows item=item}-->
          <tr>
            <td><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
            <td><a href="<!--{$baseurl}-->/jobs/view/<!--{$item.jobid}-->.html" target="_blank"><!--{$item.jobname}--></a></td>
            <td><a href="<!--{$baseurl}-->/company/view/<!--{$item.eid}-->.html" target="_blank"><!--{$item.ename}--></a></td>
            <td><p><!--{if $item.interview_type==1}-->普通<!--{else}-->视频<!--{/if}-->面试</p></td>
			<td><p><!--{$item.interview_date|date_format:"%Y-%m-%d %H:%M"}--></p></td>
            <td><!--{$item.invite_date}--></td>
            <td><a href="<!--{$baseurl}-->/member/do/myjob.do?act=int&id=<!--{$item.id}-->" target="post_main">删除</a></td>
          </tr>
		  <!--{foreachelse}-->
          <tr>
            <td colspan="6" align="center">暂无任何面试机会，建议您<a href="<!--{$weburl}-->/jobs.html" target="_blank">查找职位</a></td>
          </tr>
		  <!--{/foreach}-->
          <!--{if $rows}-->
		  <tr>
            <td><input type="checkbox" onclick="checkAll(this.checked);" id="checkall" /></td>
            <td><div align="left" onclick="document.getElementById('checkall').checked=true;checkAll(true);">全选</div></td>
            <td colspan="5"><div align="right"><!--{include file=page.tpl}--></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td colspan="5"><input type="submit" name="button2" id="button2" value="删除" /></td>
          </tr>
		  <!--{/if}-->
        </table>
        <div class="topmargin10px"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
</form>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
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
<!--{include file="include/footer.tpl"}-->