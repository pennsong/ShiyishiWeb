<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
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

<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>职位列表</span></a></li>
  </ul>
</div>

<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin: 0px 0 0 0;">
    标题:
    <input name="title" type="text" value="<!--{$s.title}-->" style="width:50px;"/>
	公司:
	<select name="cid">	
	<option value="">公司</option>
	<!--{foreach from=$company item=item}-->
		<option value="<!--{$item.id}-->" <!--{ if $s.cid == $item.id}-->selected="selected"<!--{/if}-->><!--{$item.company}--></option>
	<!--{/foreach}-->
	</select>	
	时间:
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.s_date}-->" name="s_date"/>
	
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.e_date}-->" name="e_date"/>
	<input type="submit" name="search" value="搜索" />
</div>
</form>
<div style="clear:both;">
<form id="listform" name="listform" action="<!--{$pageurl}-->/check.do" method="post" target="post_main">
<input type="hidden" value="1" name='status' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal"></td>
	<td class="tal">标题</td>
    <td class="tal">公司</td>
	<td class="tal">职务</td>
	<td class="tal">内容</td>
	<td class="tal">开始日期</td>
	<td class="tal">结束日期</td>
	<td class="tal">日期</td>
    <td class="tal" width="10%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
	<td class="tal"><span class="fourm_name"><!--{$item.title}--></span></td>
    <td class="tal"><!--{$e_user[$item.cid].username}--></td>
	<td class="tal"><!--{$job_category[$item.jid].name}--></td>
    <td class="tal" style="width:250px;"><!--{$item.jtext}--></td>
	<td class="tal"><!--{$item.starttime|date_format:"%Y-%m-%d"}--></td>
	<td class="tal"><!--{$item.endtime|date_format:"%Y-%m-%d"}--></td>
    <td><!--{$item.createtime|date_format:"%Y-%m-%d"}--></td>
    <td>
	<!--<a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> |-->
	<a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除该用户吗?删除后不可恢复')" target="post_main">彻底删除</a>
	</td>
  </tr>
  <!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;">
<input type="button" onclick="checkAll(true);" value="全选" class="btn"/>
<input type="button" onclick="checkAll(false);" value="反选" class="btn"/> 
<input type="submit" value="删除" onclick="if(confirm('确定删除选定的会员吗?')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" /> </div>
<div class="rpage"><!--{include file=page.tpl}--></div>
</div>
</form>
</div>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
