<!--{include file="include/header.tpl"}-->
<!--{include file="include/bread_crumb.tpl"}-->
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/my.css">
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<script type="text/javascript" src="<!--{$baseurl}-->/js/box.js"></script>
<div class="main">
  <!--{include file="myleft.tpl"}-->
  <div class="my_right">
    <div class="gray_top_box right_width"></div>
    <div class="gray_center_box right_width bg_ffffff">
      <div class="title">账户余额</div>
      <div class="ye_xs"> 账户可用余额：<span>&yen;<!--{$myinfo.allmoney}-->元</span> </div>
      <div id="zhifubao">
        <div class="shuoming">1、<span class="zhifubao_icon">支付宝在线充值</span></div>
        <form id="alipayform" name="alipayform" class="cmxform" method="post" action="<!--{$baseurl}-->/my/do/alipay.do" target="_blank">
          <ol>
            <li>
              <label>充入金额：</label>
              <input type="text" id="changefee" name="changefee" alt="充入金额:空/数字/长度@1-10" style="width:100px;" /> 元
            </li>
            <li>
              <label></label>
              <span id="showResult_changefee" style="margin-left:7px;">请输入您要充入的金额。</span>
            </li>
            <li>
              <label>&nbsp;</label>
              <span class="btn_change"><a style="cursor:pointer;" onclick="if(fm_chk(oo('alipayform'))){alipay();oo('alipayform').submit();}">确 定</a></span></li>
          </ol>
        </form>
      </div>
      <div id="piaochong">
        <div class="shuoming">2、票虫网礼品卡在线充值</div>
        <form id="chargeform" name="chargeform" class="cmxform" method="post" action="<!--{$baseurl}-->/my/do/charge.do" target="post_main">
          <ol style="width:470px;">
            <li>
              <label>卡&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
              <input type="text" id="cardnum" name="info[cardnum]" maxlength="12" style="width:120px;" alt="卡号:空/数字/长度@12" />
              <span id="showResult_cardnum">请输入12位礼品卡卡号。</span>
            </li>
            <li>
              <label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
              <input type="password" id="cardpwd" name="info[cardpwd]" maxlength="6" style="width:120px;" alt="密码:空/数字/长度@6"/>
              <span id="showResult_cardpwd">请输入6位礼品卡密码。</span>
            </li>
            <li>
              <label>&nbsp;</label>
              <span class="btn_change"><a style="cursor:pointer;" onclick="if(fm_chk(oo('chargeform')))oo('chargeform').submit();">确 定</a></span></li>
          </ol>
        </form>
      </div>
      <div class="global_big_height"></div>
    </div>
    <div class="gray_bottom_box right_width"></div>
  </div>
  <div class="my_right">
    <div class="gray_top_box right_width"></div>
    <div class="gray_center_box right_width bg_ffffff">
      <div class="title">优惠券余额</div>
      <div class="ye_xs"> 优惠券可用余额：<span>&yen;<!--{$myinfo.allgiftfee}-->元</span> </div>
      <div id="lipinka">
        <div class="shuoming">1、优惠券充值</div>
        <form id="chargegiftform" name="chargegiftform" class="cmxform" method="post" action="<!--{$baseurl}-->/my/do/chargegift.do" target="post_main">
          <ol style="width:550px;">
            <li>
              <label>卡&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
              <input type="text" id="cardnum1" name="info[cardnum]" maxlength="12" style="width:120px;" alt="卡号:空/数字/长度@12" />
              <span id="showResult_cardnum1">请输入12位优惠券卡号。</span>
            </li>
            <li>
              <label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
              <input type="password" id="cardpwd1" name="info[cardpwd]" maxlength="6" style="width:120px;" alt="密码:空/数字/长度@6"/>
              <span id="showResult_cardpwd1">请输入6位优惠券密码。</span>
            </li>
            <li>
              <label>&nbsp;</label>
              <span class="btn_change"><a style="cursor:pointer;" onclick="if(fm_chk(oo('chargegiftform')))oo('chargegiftform').submit();">确 定</a></span></li>
          </ol>
        </form>
      </div>
      <div class="global_big_height"></div>
    </div>
    <div class="gray_bottom_box right_width"></div>
  </div>
</div>
<link rel="stylesheet" type="text/css" href="<!--{$baseurl}-->/styles/pop.css">
<script type="text/javascript">
function msg(title,money){
	//$("<div id='MaskLyer'/>").appendTo("body").css({width:$(window).width()-5,height:500});
	money = money ? parseFloat(money) : null;
	var html = '<div class="c_main">';
        html += '<div class="blue_center_box c_main_width bg_ffffff">';
        html += '  <div class="c_k">';
        html += '    <div class="title"><span>充值提示</span><a onclick="closeLog(\''+money+'\');" class="close"></a></div>';
        html += '    <div class="c_info"> <br />';
        html += '      <br />';
        html += '      <span class="ok">'+title+'</span><br />';
        html += '      <br />';
        html += money>0 ? '我的余额：<span>&yen;'+money+'元</span><br /><br />' : '';
        html += '    </div>';
        html += '    <div class="all_width"><span class="btn"><a onclick="closeLog(\''+money+'\');">确 定</a></span></div>';
        html += '  </div>';
        html += '</div>';
        html += '</div>';
	$.box.show('',html,342,172,2);
	if ($.browser.msie && $.browser.version<7) $("select").hide();
}
function alipay(){
	var html = '<div class="c_main" style="width:450">';
        html += '<div class="blue_center_box c_main_width bg_ffffff">';
        html += '  <div class="c_k">';
        html += '    <div class="title"><span>请在新打开的页面上完成付款</span><a onclick="closeLog();" class="close"></a></div>';
        html += '    <div class="c_info"> <br />';
        html += '      <br />';
        html += '      <span class="ok">付款完成前请不要关闭本页面。</span><br />';
        html += '      <br />';
        html += '    </div>';
        html += '    <div class="all_width"><span class="btn"><a onclick="closeLog(1);">已完成付款</a></span><span class="btn" style="margin-left:25px;"><a onclick="closeLog(\'faq\');">付款遇到问题</a></span></div>';
        html += '  </div>';
        html += '</div>';
        html += '</div>';
	$.box.show('',html,342,172,2);
	if ($.browser.msie && $.browser.version<7) $("select").hide();
}
function closeLog(_t){
	$.box.close();
	if(_t=='faq')window.location.href = '<!--{$weburl}-->/faq/5.html';
	else if(_t>0)window.location.href = window.location.href;
}
</script>
<iframe id="post_main" name="post_main" style="display:none;"></iframe>
<!--{include file="include/footer.tpl"}-->