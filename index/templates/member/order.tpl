<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/my.css">
<div class="main">
  <!--{include file="myleft.tpl"}-->
  <div class="my_right">
    <div class="gray_top_box right_width"></div>
    <div class="gray_center_box right_width bg_ffffff">
      <div class="title">我的订单</div>
      <div class="my_book">
        <div class="pw">订单号</div>
        <div class="sj">收票人</div>
        <div class="cd">订票日期</div>
		<div class="pj">价格</div>
        <div class="cs">已付</div>
        <div class="zt">订单状态</div>
		<div class="cz">操作</div>
      </div>
	  <!--{foreach from=$orders key=key item=item}-->
      <div class="my_book_info" id="pdiv_<!--{$key}-->">
        <div class="pw_k"><a href="<!--{$baseurl}-->/my/orderdetail/<!--{$item.id}-->.html"><!--{$item.ordernum}--></a></div>
        <div class="sj_k"><!--{$item.receiver}--></div>
        <div class="cd_k"><!--{$item.orderdate|date_format:"%Y-%m-%d"}--></div>
        <div class="pj_k"><b style="color:blue">&yen;<!--{$item.orderfee}--></b></div>
		<div class="cs_k"><b style="color:green">&yen;<!--{$item.paidfee}--></b></div>
        <div class="zt_k"><!--{$item.paystatus}--> | <!--{$item.getstatus}--></div>
		<div class="cz_k"><a href="<!--{$baseurl}-->/my/orderdetail/<!--{$item.id}-->.html">查看</a><!--{if $item.isget=='y'}--> | <a href="javascript:_back(<!--{$key}-->,<!--{$item.id}-->);">退票</a><!--{elseif $item.isget=='w'}--> | <a href="javascript:_pay(<!--{$key}-->,<!--{$item.id}-->,<!--{$item.orderfee}-->,<!--{$item.paidfee}-->)">续订</a><!--{else}--><!--{if $item.ispay!='ok'&& $item.isget=='x'}--> | <a href="javascript:_cancel('cancel',<!--{$item.id}-->);">取消</a> | <a href="javascript:_pay(<!--{$key}-->,<!--{$item.id}-->,<!--{$item.orderfee}-->,<!--{$item.paidfee}-->)" style="color:red;">付款</a><!--{elseif $item.isget=='x'}--> | <a href="javascript:_cancel('noorder',<!--{$item.id}-->);">退订</a><!--{/if}--><!--{/if}--></div>
      </div>
	  <!--{foreachelse}-->
	  <div class="my_book_info">
	    <div class="pw_k" style="width:100%;text-align:center;line-height:78px;"> 您的购物车中没有任何票务信息，请重新购物。
        </div>
	  </div>
      <!--{/foreach}-->
      <div class="my_book_info_bottom"></div>
      <div class="jifen_bottom"></div>
    </div>
    <div class="gray_bottom_box right_width"></div>
  </div>
</div>
<script type="text/javascript">
var mymoney = <!--{$myinfo.allmoney|default:0}-->;
var _createtr=function(i,h){
	if(document.getElementById('subdiv_'+i)){
		$('#subdiv_'+i).remove(); 
	}else{
		$("#pdiv_"+i).after(h);
	}
};
var _pay=function(i,o,p,lp){
 if(mymoney<1){location.href="<!--{$baseurl}-->/my/do/payto.do?id="+o;return;}
_createtr(i,"<div id='subdiv_"+i+"' class='topay'>上次已付：&yen;"+lp+"，本次应付：<span class='red'>&yen;"+(p-lp)+"</span>，您的帐户余额：<span class='red'>&yen;"+mymoney+"</span><br>请输入本次支付要使用的余额</span>：<input type='text' id='payer_"+i+"' class='input' style='width:80px;height:18px;border:1px solid #ccc;' value='"+(mymoney-(p-lp)>0?(p-lp):mymoney)+"' maxlength='10'/> <input type='button' value='付款' style='padding:2px 3px 0 3px;' onclick='_topay(this,"+i+","+o+","+(p-lp)+")'/></div>");  

};
var _topay=function(t,i,o,p){
   var _er=document.getElementById("payer_"+i).value;
   if(isNaN(_er)){alert("您输入的金额有误。");document.getElementById("payer_"+i).select();return;}
   if(_er>mymoney){alert("您输入的金额大于您的帐户余额。");document.getElementById("payer_"+i).select();return;}
   if(_er>p){alert("您输入的金额大于本次应付金额。");document.getElementById("payer_"+i).select();return;}
   t.disabled=true;
   location.href="<!--{$baseurl}-->/my/do/payto.do?id="+o+"&er="+_er;
};
var _cancel=function(a,o,r,t){
   var _t;
   switch(a){
    case"cancel":
	_t="您确定要取消该订单吗？";
	break;
    case"noorder": 
	_t="您确定要将该订单退订吗？";
	break;
  }
  if(confirm(_t)){
   location.href="<!--{$baseurl}-->/my/do/account.do?action="+a+"&id="+o+"";
  }
};
var _back=function(i,o){
     _createtr(i,"<div class='topay sf'>请输入退票理由：<input type='text' id='back_"+i+"' class='input' style='border:1px solid #ccc;' maxlength='200'> <input type='button' value='申请退票' onclick='_toback(this,"+o+","+i+")' style='padding:2px 3px 0 3px;' /></div>");
};
var _toback=function(t,o,r){
  var _r=document.getElementById("back_"+r).value;
  if(_r==""){alert("请填写退票理由。");document.getElementById("back_"+r).focus();return;}
  if(_r.trim().len()>100){alert("退票理由请控制在100字以内。");document.getElementById("back_"+r).select();return;}
  if(confirm("只有当票出现无法入场或者在演出后才送达才可以退票\n您确定要申请退票吗？")){
   t.disabled=true;
   location.href="<!--{$baseurl}-->/my/do/account.do?action=back&id="+o+"&res="+_r+"";
  }
};
</script>
<!--{include file="include/footer.tpl"}-->