<form id="chargeform" name="chargeform" class="cmxform" method="post" action="<!--{$baseurl}-->/my/do/charge.do" target="post_main">
  <ol>
	<li>
	  <label>卡号：</label>
	  <input type="text" id="cardnum" name="info[cardnum]" maxlength="12" style="width:120px;" alt="卡号:空/数字/长度@12" />
	  <span id="showResult_cardnum">请输入12位礼品卡卡号。</span>
	</li>
	<li>
	  <label>密码：</label>
	  <input type="password" id="cardpwd" name="info[cardpwd]" maxlength="6" style="width:120px;" alt="密码:空/数字/长度@6"/>
	  <span id="showResult_cardpwd">请输入6位礼品卡密码。</span>
	</li>
	<li>
	  <label>&nbsp;</label>
	  <span class="btn_change"><a style="cursor:pointer;" onclick="if(fm_chk(oo('chargeform')))oo('chargeform').submit();">确 定</a></span></li>
  </ol>
</form>