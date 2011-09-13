<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <form id="bankForm" name="bankForm" class="cmxform" action="<!--{$baseurl}-->/member/do/bank.do" method="post">
      <input type="hidden" name="info[type]" value="bank"/>
	  <div id="gcenterrightc">
        <h2>添加银行账户信息</h2>
        <div id="gloginrightmain">
          <h3 style="color:red">警示：我们将以您最后更新的银行信息为准给予打款。</h3>
          <ul>
            <li><span class="glogintext">所属银行：</span>
              <input type="text" name="info[bank_name]" id="bank_name" alt="开户行:空" style="width:160px;" />
              <span id="showResult_bank_name">请输入您的所属银行：如“中国工商银行”</span>
            </li>
            <li><span class="glogintext">开户行：</span>
              <input type="text" name="info[bank_kaihu]" id="bank_kaihu" alt="开户行:空" style="width:160px;"/>
              <span id="showResult_bank_kaihu">请输入您的开户银行</span></li>
            <li><span class="glogintext">开户人户名：</span>
              <input type="text" id="card_user" name="info[card_user]" alt="户名:空/全汉字" style="width:160px;"/>
              <span id="showResult_card_user">请输入账户名。</span>
            </li>
            <li><span class="glogintext">银行卡号：</span>
              <input type="text" name="info[card_number]" id="card_number0" alt="个人银行卡号:空/长度@16-21/数字" style="width:160px;"/>
              <span id="showResult_card_number0">请输入有效的银行卡号，该银行卡必须与您填写的真实姓名一致，否则无法提现。</span>
            </li>
            <li><span class="glogintext">确认卡号：</span>
              <input type="text" name="info[card_number1]" id="card_number1" alt="确认银行卡号:确认@card_number0" style="width:160px;"/>
              <span id="showResult_card_number1"></span>
            </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintext">&nbsp;</span><input type="image" onclick="return checkPostResume();" src="<!--{$baseurl}-->/images/baocun.gif" /></li>
          </ul>
        </div>
        <div class="topmargin10px"></div>
      </div>
	  </form>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<script type="text/javascript">
function checkPostResume(){
	if(fm_chk(oo('resumeAddForm'))){
		return true;
	}
	return false;
}
</script>
<!--{include file="include/footer.tpl"}-->