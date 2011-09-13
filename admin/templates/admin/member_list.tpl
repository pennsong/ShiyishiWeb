<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="two">课程账户管理</a></li>
    <li><a href="<!--{$excelurl}-->">导出当前账户</a></li>
  </ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    <select name="proid" onchange="document.getElementById('searchForm').submit();">
      <option value="" >产品类别</option>
      <!--{foreach from=$cats key=key item=item}-->
      <option value="<!--{$key}-->" <!--{if $key==$s.proid}-->selected<!--{/if}-->><!--{$item.proname}--></option>
      <!--{/foreach}-->
    </select>
	<select name="state" onchange="document.getElementById('searchForm').submit();">
      <option value="" >是否开通课程</option>
	  <option value="1" <!--{if 1==$s.state}-->selected<!--{/if}-->>账号已激活课程已开通</option>
	  <option value="2" <!--{if 2==$s.state}-->selected<!--{/if}-->>账号已激活课程未开通</option>
      <option value="0" <!--{if '0'==$s.state}-->selected<!--{/if}-->>账号未激活课程未开通</option>
	  <option value="-1" <!--{if 9==$s.state}-->selected<!--{/if}-->>账号已被取消激活</option>
    </select>
</div>
<div style="clear:both;float:left;text-align:right;border-top:solid 1px #333;border-bottom:solid 1px #333;width:100%;padding-right:5px;height:28px;line-height:28px;">
    登录名:
    <input name="loginname" type="text" value="<!--{$s.loginname}-->" style="width:50px;"/>
    Email:
    <input name="loginemail" type="text" value="<!--{$s.loginemail}-->" style="width:120px;"/>
    激活日期:
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.date_s}-->" name="date_s"/> ~ <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.date_e}-->" name="date_e"/>
    <input type="submit" name="search" value="搜索" />
</div>
</form>
<div style="clear:both;">

<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
    <td class="tal">登录名</td>
    <td class="tal">密码</td>
    <td class="tal">Email</td>
	<td class="tal">产品</td>
	<td class="tal">课程等级</td>
    <td class="tal">激活码</td>
    <td class="tal">状态</td>
	<td class="tal">课程ID</td>
	<td class="tal">激活日期</td>
    <td class="tal" style="padding-left:20px;">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <tr class="tr3">
    <td class="tal"><!--{$item.loginname}--></td>
	<td><!--{$item.loginpassword}--></td>
	<td><!--{$item.loginemail}--></td>
	<td><!--{$item.proname}--></td>
	<td><!--{$item.prograde}--></td>
	<td><!--{$item.activecode}--></td>
	<td><!--{$item.state}--></td>
	<td><!--{$item.courseid}--></td>
	<td><!--{$item.createdate}--></td>
    <td><a class="fourm-two" href="javascript:manageuser('<!--{$pageurl}-->/edit.do?id=<!--{$item.id}-->');">编辑</a> |</td>
  </tr>
  <!--{/foreach}-->
</table>
<!--{include file=page.tpl}-->
</div>
<script language="JavaScript">
function manageuser(url){
    popup('编辑课程账户',url,410,180);
}
function backfunc(){
	$.box.close();
	self.window.location.reload();
}
</script>
<!--{include file=footer.tpl}-->
