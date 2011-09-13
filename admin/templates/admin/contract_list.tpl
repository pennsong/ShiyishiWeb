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
    <li><a href="<!--{$pageurl}-->/add.do" class="btn1"><span>添加合同</span></a></li>
  </ul>
</div>


<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;">
	合同状态：
	<select name="status" onchange="window.location.href = '/admin/contract/list.do?status='+this.value;">
	   <option  <!--{if $status==1}--> selected<!--{/if}--> value="1">执行中合同</option>
	   <option  <!--{if $status==2}--> selected<!--{/if}--> value="2">已到期合同</option>
	   <option  <!--{if $status==3}--> selected<!--{/if}--> value="3">全部合同</option>
   </select>
</div>

<div style="clear:both;">
<form id="listform" name="listform" action="<!--{$pageurl}-->/check.do" method="post" target="post_main">
<input type="hidden" value="1" name='status' id='chkisactive'/>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal"></td>
	<td class="tal">合同号</td>
    <td class="tal">文字简历总量</td>
    <td class="tal">文字简历剩余数</td>
    <td class="tal">视频简历总量</td>
    <td class="tal">视频简历剩余数</td>
	<td class="tal">有效期</td>
    <td class="tal" width="10%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
	<td class="tal"><span class="fourm_name"><!--{$item.code}--></span></td>
    <td class="tal"><!--{$item.wordall}--></td>
    <td class="tal"><!--{$item.word}--></td>
    <td class="tal"><!--{$item.videoall}--></td>
    <td class="tal"><!--{$item.video}--></td>
    <td class="tal"><!--{$item.startdate|date_format:"%Y-%m-%d"}-->～<!--{$item.enddate|date_format:"%Y-%m-%d"}--></td>
    <td><a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">编辑</a> | <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除该用户吗?删除后不可恢复')" target="post_main">彻底删除</a>
	</td>
  </tr>
  <!--{/foreach}-->
</table>
<div style="float:left;width:365px;margin-top:8px;"><input type="button" onclick="checkAll(true);" value="全选" class="btn"/> <input type="button" onclick="checkAll(false);" value="反选" class="btn"/> 
<input type="submit" value="删除" onclick="if(confirm('确定删除选定的用户吗?')){document.getElementById('chkisactive').value='0';return true}else{return false}" class="btn" />
</div><div class="rpage"><!--{include file=page.tpl}--></div>
</div>
</form>
</div>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
