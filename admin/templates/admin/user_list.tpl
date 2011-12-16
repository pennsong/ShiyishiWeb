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
<div>
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do?status=1" <!--{if 1==$s.status}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>正式会员(<!--{$count.a}-->)</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?status=0" <!--{if $s.status==0}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>未审核会员(<!--{$count.b}-->)</span></a></li>
	<li><a href="<!--{$pageurl}-->/list.do?status=-1" <!--{if $s.status==-1}-->class="btn1"<!--{else}-->class="btn2"<!--{/if}-->><span>已删除会员(<!--{$count.c}-->)</span></a></li>
	<li><a href="javascript:manageuser('<!--{$baseurl}-->/admin/user/add.do');" class="btn2"><span>添加</span></a></li>
  </ul>
</div>
<div style="clear:both;"></div>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    UID:
    <input name="id" type="text" value="<!--{if $s.id>0}--><!--{$s.id}--><!--{/if}-->" style="width:40px;"/>
	Email:
    <input name="email" type="text" value="<!--{$s.email}-->" style="width:120px;"/>
	手机:
    <input name="mobile" type="text" value="<!--{$s.mobile}-->" style="width:120px;"/>
	注册时间:
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.s_date}-->" name="s_date"/>
	~
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
	<td class="tal">Email</td>
	<td class="tal">手机号</td>
	<td class="tal">查看简历</td>
	<td class="tal">注册日期</td>
	<td class="tal">状态</td>
	<td class="tal">推广计划</td>
    <td class="tal" width="10%" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><input type="checkbox" name="ids[]" value="<!--{$item.id}-->"></td>
    <td class="tal"><!--{$item.id}--></td>
	<td class="tal"><!--{$item.email}--></td>
	<td class="tal"><!--{$item.mobile}--></td>
	<td class="tal"><!--{if $item.resume_txt==1 || $item.resume_txt==3}--><a class="fourm-two" href="<!--{$baseurl}-->/admin/txtresume.do?uid=<!--{$item.id}-->">文字</a><!--{/if}--><!--{if $item.resume_vod==1 && $item.auth}--> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/videoresume.do?uid=<!--{$item.id}-->">视频</a><!--{/if}--></td>
    <td><!--{$item.regdate|date_format:"%Y-%m-%d %H:%M:%S"}--></td>
	<td width="60"><!--{if $item.resume_status==1}-->求职中<!--{elseif $item.resume_status==2}-->已录取<!--{else}-->免打扰<!--{/if}--></td>
    <td><a class="fourm-two" href="<!--{$baseurl}-->/admin/user/record.do?uid=<!--{$item.id}-->" title="查看朋友">朋友</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/user/reward.do?uid=<!--{$item.id}-->" title="查看朋友被录入记录">朋友奖励</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/user/rewardme.do?uid=<!--{$item.id}-->" title="查看自己被录入记录">录用记录</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/user/bank.do?uid=<!--{$item.id}-->" title="查看银行账号">银行账号</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/user_apply.do?uid=<!--{$item.id}-->" title="查看申领记录">申领记录</a> 
	<!--{if $item.resume_status==2}-->
		| <a class="fourm-two" href="<!--{$baseurl}-->/admin/user/status.do?uid=<!--{$item.id}-->" title="简历解锁">简历解锁</a>
	<!--{/if}-->
	
	</td>
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
