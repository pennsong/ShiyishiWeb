<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/my.css">
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<div class="main">
  <!--{include file="myleft.tpl"}-->
  <div class="my_right">
    <div class="gray_top_box right_width"></div>
    <div class="gray_center_box right_width bg_ffffff">
      <div class="title">查看订单详情</div>
      <div class="global_big_height"></div>
      <div class="o_b_bot">
        <div class="field">
          <div class="my_pw">
			<div class="pw">演出名</div>
			<div class="sj">演出地点</div>
			<div class="cd">场票说明</div>
			<div class="pj">票价</div>
			<div class="cs">数量</div>
			<div class="zt">演出时间</div>
		  </div>
		  <!--{foreach from=$order_pw key=key item=item}-->
		  <div class="my_pw_info">
			<div class="pw_k"><!--{$item.fullname|substr:40}--></div>
			<div class="sj_k">[<!--{$item.cityname}-->] <!--{$item.venuename}--></div>
			<div class="cd_k"><!--{$item.ticketdec|default:'无'}--></div>
			<div class="pj_k"><b style="color:blue">&yen;<!--{$item.ticketprice}-->元</b></div>
			<div class="cs_k"><b style="color:green"><!--{$item.ticketnum}--></b></div>
			<div class="zt_k"><!--{$item.wdatetime}--></div>
		  </div>
		  <!--{/foreach}-->
        </div>
		<div class="field phr">
          <div class="field_t">票额总计</div>
          <div class="field_c"><span class="red"><b>&yen;<!--{$info.orderfee}--> 元</b></span> <span style="color:#c3c3c3;">票款<!--{$info.totalprice}-->元 + 配送费:<!--{$info.deliverprice}-->元 - 会员优惠:<!--{$info.couponfee}-->元 - 礼品券:<!--{$info.accountgiftfee}-->元</span></div>
        </div>
		<div class="field">
          <div class="field_t">已支付金额</div>
          <div class="field_c"><span class="red"><b>&yen;<!--{$info.paidfee}--> 元</b></span> <span style="color:#c3c3c3;">余额支付<!--{$info.accountmoney}-->元 + 其他方式支付<!--{$info.otherpay}--> 元</span></div>
        </div>
        <div class="field">
          <div class="field_t">订票时间</div>
          <div class="field_c"><!--{$info.orderdate|date_format:"%Y-%m-%d %H:%M"}--></div>
        </div>
        <div class="field phr">
          <div class="field_t">收票人</div>
          <div class="field_c"><!--{$info.receiver|default:'未填'}--></div>
        </div>
        <div class="field">
          <div class="field_t">电话</div>
          <div class="field_c"><!--{$info.rectel|default:'未填'}--></div>
        </div>
        <div class="field">
          <div class="field_t">手机</div>
          <div class="field_c"><!--{$info.recphone|default:'未填'}--></div>
        </div>
        <div class="field">
          <div class="field_t">区域</div>
          <div class="field_c"><!--{$info.recareaname|default:'未填'}--></div>
        </div>
        <div class="field">
          <div class="field_t">送票地址</div>
          <div class="field_c"><!--{$info.recaddress|default:'未填'}--></div>
        </div>
        <div class="field">
          <div class="field_t">邮编</div>
          <div class="field_c"><!--{$info.reczip|default:'未填'}--></div>
        </div>
        <div class="field phr">
          <div class="field_t">配送方式</div>
          <div class="field_c"><!--{$info.delivertype}--></div>
        </div>
        <div class="field">
          <div class="field_t">支付方式</div>
          <div class="field_c"><!--{$info.paytype}--></div>
        </div>
        <div class="field">
          <div class="field_t">配送时间</div>
          <div class="field_c"><!--{$info.deliverdate|default:'无'}--></div>
        </div>
        <div class="field">
          <div class="field_t">发票</div>
          <div class="field_c"><!--{if $info.needbill==0}-->不需要<!--{else}--><!--{$info.billname|default:'个人'}--><!--{/if}--></div>
        </div>
        <div class="field  phr">
          <div class="field_t">订单状态</div>
          <div class="field_c red"><!--{$info.paystatus}--> | <!--{$info.getstatus}--></div>
        </div>
        <div class="field">
          <div class="field_t">帐户余额</div>
          <div class="field_c">&#165;<!--{$userinfo.allmoney}--></div>
        </div>
        <div class="field">
          <div class="field_t">操作</div>
          <div class="field_c"><a href="<!--{$baseurl}-->/my/order.html">&#187;  请进入“我的订单”页操作</a></div>
        </div>
      </div>
      <div class="jifen_bottom"></div>
    </div>
    <div class="gray_bottom_box right_width"></div>
  </div>
</div>

<!--{include file="include/footer.tpl"}-->