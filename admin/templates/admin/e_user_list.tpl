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

<div style="margin:0px 0 0 50px;#margin:0px 0 0 50px;_margin:0px 0 0 50px;">
	用户状态：
	<select name="status" onchange="window.location.href = '/admin/e_user/list.do?status='+this.value;">
	   <option  <!--{if $status==1}--> selected<!--{/if}--> value="1">未审核</option>
	   <option  <!--{if $status==2}--> selected<!--{/if}--> value="2">已审核</option>
	   <option  <!--{if $status==-1}--> selected<!--{/if}--> value="-1">已删除</option>
   </select>
    企业会员（<!--{$pass}-->）、未审核（<!--{$nopass}-->）
</div><div style="clear:both;"></div>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do?status=<!--{$status}-->" method="post">
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:0px 0 0 0;">
    用户ID:
    <input name="id" type="text" value="<!--{if $s.id>0}--><!--{$s.id}--><!--{/if}-->" style="width:40px;"/>
	姓名:
    <input name="username" type="text" value="<!--{$s.username}-->" style="width:120px;"/>
    Email:
    <input name="email" type="text" value="<!--{$s.email}-->" style="width:120px;"/>
	注册时间:
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
	<td class="tal">ID</td>
	<td class="tal">公司名</td>
	<!--{if $status != 1 }-->
	<td class="tal">用户名</td>
	<!--{/if}-->
    <td class="tal">Email</td>
    <td class="tal">子公司</td>
    <td class="tal">地址</td>
	<td class="tal">注册日期</td>
	<td class="tal">录用记录</td>
    <td class="tal" width="15%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
	<td class="tal"><!--{$item.id}--></td>
	<td class="tal"><span class="fourm_name"><a href="<!--{$pageurl}-->/userjob.do?cid=<!--{$item.id}-->"><!--{$item.company}--></a></span></td>
	<!--{if $status != 1 }-->
	<td class="tal"><span class="fourm_name"><!--{$item.username}--></span></td>
	<!--{/if}-->
    <td class="tal"><!--{$item.email}--></td>
   <td class="tal"><a href="<!--{$pageurl}-->/usersub.do?cid=<!--{$item.id}-->">子公司</a></td>
    <td class="tal"><a href="<!--{$pageurl}-->/userarea.do?cid=<!--{$item.id}-->&pid=<!--{$item.live_gnd_p}-->"><!--{$item.proname}--></a> - <a href="<!--{$pageurl}-->/userarea.do?cid=<!--{$item.id}-->&cityid=<!--{$item.live_gnd_c}-->"><!--{$item.cityname}--></a></td>
    <td><!--{$item.createtime|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	<td><a class="fourm-two" href="<!--{$baseurl}-->/admin/e_user/enroll.do?id=<!--{$item.id}-->" title="查看录用记录">录用记录</a></td>
    <td>
	<a class="fourm-two" href="<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->">修改</a> 

	| <a class="fourm-two" href="<!--{$pageurl}-->/info.do?id=<!--{$item.id}-->">查看</a> 

	<!--{if $item.username && $status != 2 }-->
		| <a class="fourm-two" href="<!--{$pageurl}-->/pass.do?id=<!--{$item.id}-->">
		<!--{if $status == -1 }-->
			恢复
		<!--{else}-->
			通过
		<!--{/if}-->
		</a> 
	<!--{/if}-->

	<!--{if $status == -1 }-->
	| <a class="fourm-two" href="<!--{$pageurl}-->/del.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除该用户吗?删除后不可恢复')" target="post_main">彻底删除</a>
	<!--{else}-->
	| <a class="fourm-two" href="<!--{$pageurl}-->/remove.do?id=<!--{$item.id}-->" onclick="return confirm('确定删除该用户吗?')" target="post_main">删除</a>
	<!--{/if}-->
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
