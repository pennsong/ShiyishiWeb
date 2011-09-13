<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="glogin2">
    <div id="gloginright2">
      <h2></h2>
      <div class="wcdingdan"> <span class="chenggong">登录面试大厅</span><br />
        <br />
        <form action="<!--{$baseurl}-->/do/leader.do" onsubmit="return checkThis();" method="post"><input type="hidden" name="id" value="<!--{$id}-->"/><input type="password" name="passwd" id="passwd"/> <input type="submit" name="subM" value="进入"/></form>
        <br />
	  </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<script type="text/javascript">
function checkThis(){
	var pd = $("#passwd").val();
	if(!pd){
		alert("请输入密码！");
		return false;
	}
	return true;;
}
</script>
<!--{include file="include/footer.tpl"}-->