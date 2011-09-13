<!--{include file="include/header.tpl"}-->
<div id="body" align="center">
  <div id="b_m2">
    <div id="o_b_m" align="left">
      <h1>·您的订单</h1>
      <div class="o_b_bot">
        <div id="b_l" class="o_b_line">
          <div class="o_b_top">
            <form name="orderform" onSubmit="return _ordersub();" action="<!--{$baseurl}-->/action/order.act" method="post">
              <div id="nomod">
                <div class="field">
                  <div class="field_t">礼包价位</div>
                  <div class="field_c"><!--{$info.totalprice}--> 元</div>
                </div>
                <div class="field">
                  <div class="field_t">送礼对象</div>
                  <div class="field_c"><!--{$info.xagename}-->，<!--{$info.xwhoname}--></div>
                </div>
                <div class="field">
                  <div class="field_t">送礼事件</div>
                  <div class="field_c"><!--{$info.xresname}--></div>
                </div>
                <div class="field">
                  <div class="field_t">补充说明</div>
                  <div class="field_c"><!--{$info.xcon|default:'无'}--></div>
                </div>
                <div class="field">
                  <div class="field_t">您的电话</div>
                  <div class="field_c"><!--{$info.mobile}--></div>
                </div>
                <div class="field">
                  <div class="field_t">您的名字</div>
                  <div class="field_c">
                    <div style="float: left;"><!--{$info.username}--></div>
                    <div style="float: right; cursor: pointer;" onClick="_mod();"><a>&#187; 修改</a></div>
                  </div>
                </div>
              </div>
              <div id="mod" style="display: none;">
                <div class="field">
                  <div class="field_t">礼包价位</div>
                  <div class="field_c">
                    <select onChange="_changeprice(this.value);">
                      <!--{foreach from=$products key=key item=item}-->
                      <option value="<!--{$item}-->" <!--{if $key==$info.proprice}-->selected<!--{/if}-->><!--{$key}--></option>
                      <!--{/foreach}-->
                    </select>
                    元</div>
                </div>
                <div class="field">
                  <div class="field_t">送礼对象</div>
                  <div class="field_c">
                    <select name="xage">
                      <!--{foreach from=$xages key=key item=item}-->
                      <option value="<!--{$key}-->" <!--{if $key==$info.xage}-->selected<!--{/if}-->><!--{$item}--></option>
                      <!--{/foreach}-->
                    </select>
　
是
                    <select name="xwho" onChange="_myself(this.value);">
                      <!--{foreach from=$xwhos key=key item=item}-->
                      <option value="<!--{$key}-->" <!--{if $key==$info.xwho}-->selected<!--{/if}-->><!--{$item}--></option>
                      <!--{/foreach}-->
                    </select>
                  </div>
                </div>
                <div class="field">
                  <div class="field_t">送礼事件</div>
                  <div class="field_c">
                    <select name="xres">
                      <!--{foreach from=$xress key=key item=item}-->
                      <option value="<!--{$key}-->" <!--{if $key==$info.xres}-->selected<!--{/if}-->><!--{$item}--></option>
                      <!--{/foreach}-->
                    </select>
                  </div>
                </div>
                <div class="field">
                  <div class="field_t">补充说明</div>
                  <div class="field_c">
                    <input name="xcont" class="input" maxlength="200" type="text" value="<!--{$info.xcon}-->">
                    <br>
                    <span class="tip">如对礼物的要求、收礼人爱好，可不填</span></div>
                </div>
                <div class="field">
                  <div class="field_t">您的电话</div>
                  <div class="field_c">
                    <input name="xphone" class="input minput" maxlength="15" value="<!--{$info.mobile}-->" type="text">
                  </div>
                </div>
                <div class="field">
                  <div class="field_t">您的名字</div>
                  <div class="field_c">
                    <input name="xname" class="input minput" maxlength="10" value="<!--{$info.username}-->" type="text">
                  </div>
                </div>
              </div>
              <div class="field phr">
                <div class="field_t">收礼人</div>
                <div class="field_c">
                  <input name="reciver" class="input minput" maxlength="10" type="text">
                  <!--{if $glog}-->
                  <select id="import" name="import" onChange="_import(this.value)">
                    <option selected="selected" value="0">从送礼记录导入</option>
                  </select>
                  <!--{/if}-->
                  <br>
                  <span class="tip">请填写收礼人真实姓名</span></div>
              </div>
              <div class="field">
                <div class="field_t">收礼人电话</div>
                <div class="field_c">
                  <input name="recphone" class="input minput" maxlength="15" type="text">
                  <br>
                  <span class="tip">用于送礼时快递公司与其联系</span></div>
              </div>
              <div class="field">
                <div class="field_t">送礼地址</div>
                <div class="field_c">
                  <input name="recaddress" class="input" maxlength="150" type="text">
                  <br>
                  <span class="tip">请完整填写地址，包括省、市、街道、门牌号</span></div>
              </div>
              <div class="field">
                <div class="field_t">邮编</div>
                <div class="field_c">
                  <input name="reczip" class="input minput" maxlength="6" type="text">
                  <br>
                  <span class="tip">如不清楚，可不填</span></div>
              </div>
              <div class="field">
                <div class="field_t">送礼要求</div>
                <div class="field_c">
                  <input name="notice" class="input" maxlength="100" type="text">
                  <br>
                  <span class="tip">如对送礼时间与场合有特殊要求，请说明。可不填</span></div>
              </div>
              <div class="field phr">
                <div class="field_t red">随包卡片</div>
                <div class="field_c">
                  <input name="ifsong" value="0" onClick="_showsong(0)" checked="checked" type="radio">
                  匿名送礼，不需要
                  <input name="ifsong" value="1" onClick="_showsong(1)" type="radio">
                  机打字体
                  <input name="ifsong" value="2" onClick="_showsong(2)" type="radio">
                  手写字体<span id="song" style="display: none;"><br>
                  <textarea name="song" class="intext"></textarea>
                  </span><br>
                  <span class="tip">您可以在随包卡片上写上赠语和签名，请控制在300字以内</span></div>
              </div>
              <div class="field tprice bf">应付总额：礼包(&#165;<span id="paytotal1"><!--{$info.proprice}--></span>) + 服务费(&#165;<span id="payfw"><!--{$info.fwprice}--></span>) + 快递费(&#165;<span id="paykd"><!--{$info.kdprice}--></span>) = <span class="showm red">&#165;<span id="paytotal"><!--{$info.totalprice}--></span></span> </div>
              <!--{if $userinfo.allmoney>0}-->
			  <div class="field">
                <div class="field_t">帐户余额支付</div>
                <div class="field_c">
                  <input name="erpay" class="input minput" value="<!--{$info.totalprice}-->" maxlength="10" type="text">
                  <br>
                  <span class="tip">您的帐户余额为：&#165;<!--{$userinfo.allmoney}-->，请输入想要使用的帐户余额</span></div>
              </div>
			  <!--{/if}-->
              <div class="field pbg">
                <div class="field_t">
                  <input name="agree" value="yes" onClick="_agree(this);" checked="checked" type="checkbox">
                </div>
                <div class="field_c">我授权“猜礼包网站”全权负责策划、购买、设计、包装与配送礼包。我明白：对礼包的评价见仁见智，只要价值、品质符合我支付的价位，我愿完全接受“猜礼包网站”帮我准备的礼包。</div>
              </div>
              <div class="field">
                <div class="field_c">
                  <input name="id" value="<!--{$info.id}-->" type="hidden">
                  <input id="xprice" name="xprice" value="<!--{$info.proprice}-->" type="hidden">
                  <input id="xproid" name="xproid" value="<!--{$info.proid}-->" type="hidden">
                  <input id="allowcoupon" value="0" type="hidden">
                  <input id="sub" value="确认无误，购买" class="button" type="submit">
                </div>
              </div>
            </form>
          </div>
        </div>
        <div id="b_r" onClick="_clear();">
          <h3>帐户余额</h3>
          您的帐户余额为：<span class="red bf">&#165;<!--{$userinfo.allmoney}--></span>，帐户余额可以用来支付订单金额。 </div>
      </div>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<script>
var _f=document.orderform;
var _paytotal = <!--{$info.totalprice}-->;
var _allmoney = <!--{$userinfo.allmoney}-->;
_f.erpay.value=(_allmoney-_paytotal>0?_paytotal:_allmoney);
var _changeprice=function(a){
   var tmp = a.split(':');
   _paytotal=tmp[1];
   $("paytotal1").innerHTML=""+_paytotal+"";
   $("payfw").innerHTML=""+tmp[3]+"";
   $("paykd").innerHTML=""+tmp[4]+"";
   $("paytotal").innerHTML=parseFloat(_paytotal)+parseFloat(tmp[3])+parseFloat(tmp[4]);
   _f.erpay.value=(_allmoney-_paytotal>0?_paytotal:_allmoney);
   $("allowcoupon").value=tmp[2];
   $("xproid").value=tmp[0];
};
var _select=function(a,b){
  var _a=a.getElementsByTagName("option");
  for(var i=0;i<_a.length;i++){
    if(_a[i].value==b){_a[i].selected=true;}
  }
};
var _myself=function(a){
if(a=="9"){
  _f.reciver.value=_f.xname.value;
  _f.recphone.value=_f.xphone.value;
 }
};
_myself(_f.xwho.value);
var _import=function(a){
  with(document.orderform){
    reciver.value=_data[a][0];
    recphone.value=_data[a][1];
    recaddress.value=_data[a][2];
    reczip.value=_data[a][3];
  }
};
var _mod=function(){
 $("nomod").style.display="none";
 $("mod").style.display="";
};
var _showsong=function(a){
  $("song").style.display=a==0?"none":"";
};
var _agree=function(a){
  $("sub").disabled=!a.checked;
};
var _clear=function(){
window.onbeforeunload =null;
window.onunload =null;
};
var _ordersub=function(){
  var _er=_f.erpay.value.trim().replace(".00","");
  var _phone=_f.xphone.value.trim().replace("-","").replace("－","");
  var _recphone=_f.recphone.value.trim().replace("-","").replace("－","");
  if(_f.xcont.value.len()>200){alert("补充说明请控制在100字以内。");_f.xcont.select();return false;}
  if(!_phone.match(/^-?\d+$/)){alert("请输入正确的电话号码。");_f.xphone.select();return false;}
  if(_phone.length<11){alert("请输入正确的手机或固话号码，\n固定电话请加区号。");_f.xphone.select();return false;}
  if(_f.xname.value.trim()=="" ){alert("请输入您的称呼。");_f.xname.focus();return false;}
  if(_f.reciver.value.trim()==""){alert("请输入收礼人姓名。");_f.reciver.focus();return false;}
  if(!_recphone.match(/^-?\d+$/)){alert("请输入正确的电话号码。");_f.recphone.select();return false;}
  if(_recphone.length<11){alert("请输入正确的手机或固话号码，\n固定电话请加区号。");_f.recphone.select();return false;}
  if(_f.recaddress.value.trim()==""){alert("请输入送礼地址。");_f.recaddress.focus();return false;}
  if(_f.reczip.value.trim()!="" && !_f.reczip.value.trim().match(/^-?\d+$/)){alert("请输入正确的邮编。");_f.reczip.select();return false;}
  if(_f.ifsong[0].checked==false && (_f.song.value.len()<10 || _f.song.value.len()>600)){alert("赠语与签名内容请控制在5-300字。");_f.song.select();return false;
   }
  if(!_er.match(/^\d+$/)){alert("您输入的金额有误。");_f.erpay.select();return false;}
  if(_er>_allmoney){alert("您输入的金额大于您的帐户余额。");_f.erpay.select();return false;}
  if(_er>_paytotal){alert("您输入的金额大于本次应付金额。");_f.erpay.select();return false;}
  $("sub").disabled=true;
  _clear();//提交时不出现事件
};

</script>
<!--{if $glog}-->
<script type="text/javascript">
var _data=<!--{$recinfo}-->;
var _addoption=function(a,b){
  var _o=document.createElement("option");
  _o.innerHTML=a
  _o.value=b;
  document.getElementById("import").appendChild(_o);
};
var _createselect=function(){
  var _len=_data.length;
  document.getElementById("import").style.display="";
  for(var _i=1;_i<_len;_i++){//从[1]开始导，[0]为空用来清空导入
   _addoption(_data[_i][0],_i);
  }
};
_createselect();
</script>
<!--{/if}-->
<!--{include file="include/footer.tpl"}-->