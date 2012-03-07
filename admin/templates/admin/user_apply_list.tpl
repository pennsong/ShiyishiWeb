<!--{include file=header.tpl}-->
<script src="<!--{$baseurl}-->/DatePicker/WdatePicker.js" type="text/javascript"></script>
<script>
var array=[<!--{$dids}-->];
function selectbox(obj){
	if(obj.checked==true){
		addarray(obj.value);
	}else{
		delarray(obj.value);
	}
}
function addarray(v){
	var is=0;
	for(i=0;i<array.length;i++){
		if(array[i]==v){
			is=1;
			break;
		}else{
			is=0;
		}
	}
	if(is==0){
		array.push(v);
	}
	setOperationList();
}

function delarray(v){
	for(i=0;i<array.length;i++){
		if(array[i]==v){
			array.splice(i,1);
		}
	}
	var is=0;
	for(i=0;i<larray.length;i++){
		if(larray[i]==v){
			is=1;
			break;
		}else{
			is=0;
		}
	}
	setOperationList();
}

function setOperationList(){
	str=array.join(",");
	$('#operationList').val(str);
}
function unChkSelectAll(){
	if($("#chkall").attr("checked") != ""){
		$(".checkList").attr("checked",true);
		for(var i=0;i<larray.length;i++){
			addarray(larray[i]);
		}
	}else{
		$(".checkList").attr("checked",false);
		for(var i=0;i<larray.length;i++){
			delarray(larray[i]);
		}
	}
}
function batSubmit()
{
	$("#batSubmit").attr('href', "<!--{$pageurl}-->/check.do?status=2&operationList="+$('#operationList').val());
}
function batReject()
{
	$("#batReject").attr('href', "<!--{$pageurl}-->/check.do?status=0&operationList="+$('#operationList').val()+"&reason="+$('#batReason').val());
}
</script>
<form id="searchForm" name="searchForm" action="<!--{$pageurl}-->/list.do" method="get">
<div style="float:left;">
  <ul class="nav3">
    <li><a href="<!--{$pageurl}-->/list.do" class="btn1"><span>会员推广奖励申领记录</span></a></li>
	<li><a href="<!--{$pageurl}-->/excel.do" class="btn2"><span>导出银行账号及金额</span></a></li>
  </ul>
</div>
<div style="float:right;margin:0px 0 0 0;#margin:0px 0 0 0;_margin:-30px 0 0 0;">
    UID:
    <input name="uid" type="text" value="<!--{$s.uid}-->" style="width:50px;"/>
	日期:
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.s_date}-->" name="s_date"/>
	~
    <input type="text" class="Wdate" onClick="WdatePicker()" value="<!--{$s.e_date}-->" name="e_date"/>
	<input type="submit" name="search" value="搜索" />
</div>
</form>
<script type="text/javascript">
	var larray=[];
</script>
<div style="clear:both;">
<div id="lqselect" style="display:none;"><form action="<!--{$pageurl}-->/check.do?status=0"><div style="margin-top:6px;"><input type="hidden" id="itemId" name="itemId" /><input type="text" id="reason" name="reason"/><input type="submit" value="确定驳回"/></div></form></div>
<table cellspacing="0" cellpadding="0" width="100%" id="ftable">
  <tr class="tr3 s3">
	<td class="tal"></td>  
	<td class="tal">用户ID</td>
	<td class="tal">EMAIL</td>
	<td class="tal">申领金额</td>
	<td class="tal">申领时间</td>
	<td class="tal">推广数据</td>
	<td class="tal">银行账号</td>
	<td class="tal">操作</td>
  </tr>
  <!--{foreach from=$rows item=item}-->
  <script type="text/javascript">
	larray.push(<!--{$item.id}-->);
	</script>
  <tr class="tr3">
	<td class="tdCheckbox"><input class="checkList" type="checkbox" onclick="selectbox(this)" id="box_<!--{$item.id}-->" value="<!--{$item.id}-->" name="PositionID[]"></td>
	<td><!--{$item.uid}--></td>
	<td class="tal"><span class="fourm_name"><!--{$item.email}--></span></td>
    <td class="tal">&yen;<!--{$item.money/10}--> 元</td>
	<td class="tal"><!--{$item.createdate}--></td>
	<td class="tal"><a class="fourm-two" href="<!--{$baseurl}-->/admin/user/record.do?uid=<!--{$item.uid}-->" title="查看朋友">朋友</a> | <a class="fourm-two" href="<!--{$baseurl}-->/admin/user/reward.do?uid=<!--{$item.uid}-->" title="查看奖励">奖励</a></td>
	<td class="tal"><a class="fourm-two" href="<!--{$baseurl}-->/admin/user/bank.do?uid=<!--{$item.uid}-->" title="查看银行账号">银行账号</a></td>
	<td class="tal">
	<!--{if $item.status==1}-->
		<a class="fourm-two" href="<!--{$pageurl}-->/check.do?status=2&itemId=<!--{$item.id}-->" onclick="return confirm('确定通过用户该笔款项？')" target="post_main">通过</a> 
		| 
		<a class="fourm-two" href="#" onclick="rejectReason(<!--{$item.id}-->)" target="post_main">驳回</a>
	<!--{elseif $item.status==2}-->
		<a class="fourm-two" href="<!--{$pageurl}-->/check.do?status=3&itemId=<!--{$item.id}-->" onclick="return confirm('确定发放用户该笔款项？')" target="post_main">已发放</a> 
		| 
		<a class="fourm-two" href="#" onclick="rejectReason(<!--{$item.id}-->)" target="post_main">驳回</a>
	<!--{elseif $item.status==3}-->	
		已发放
	<!--{elseif $item.status==0}-->
		已驳回
	<!--{/if}-->
	</td>
  </tr>
  <!--{/foreach}-->

  <tr>


	  	<td><input type="checkbox" onclick="unChkSelectAll()" id="chkall" value="CC000427542J90250041000" name="PositionID2" /></td>
	    <td>全选</td>
		<input  type="hidden" name="operationList" id="operationList" value=""/>
		<td></td>
		<td></td>
		<td><a id="batSubmit" class="fourm-two" href="#" onclick="batSubmit()" target="post_main">通过</a></td>
		</tr>
		<tr>
		<td></td>
		<td></td>
		<td>驳回原因:</td>
		<td><input type="text" id="batReason" name="batReason"/></td>
		<td><a id="batReject" class="fourm-two" href="#" onclick="batReject()" target="post_main">驳回</a></td>

  </tr>
</table>
<!--{include file=page.tpl}-->
</div>
</div>
<script src="<!--{$baseurl}-->/js/box.js" type="text/javascript"></script>
<script language="JavaScript">
var turl = window.location.href;
function msg(_m,_s){
	alert(_m);
	if(_s)window.location.href = turl;
}
function rejectReason(itemId){
$("#itemId").val(itemId);
var html = $('#lqselect').html();
$.box.show('',html,200,100,2);
}
</script>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file=footer.tpl}-->
