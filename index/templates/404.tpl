<!--{include file="include/header.tpl"}-->
<link href="<!--{$baseurl}-->/styles/message.css" rel="stylesheet" type="text/css">
<div class="main">
  <div class="gray_top_box wcdd_left_width"></div>
  <div class="gray_center_box wcdd_left_width bg_ffffff">
    <div class="wcdingdan"> <span class="chenggong"><!--{$msg|default:"很抱歉！您查找的页面不存在。"}--></span><br />
      <br />
      <br />
      <a href="<!--{$weburl}-->">如果页面没有响应，点击这里，返回首页。</a></div>
	  <script>
var t = 3;
var timeInterval;
function checktime(){
	t--;
	if(t==0){
		clearTimeout(timeInterval);
		window.location.href="<!--{$weburl}-->";
	}
}
timeInterval = setInterval("checktime()",1000);
</script>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->