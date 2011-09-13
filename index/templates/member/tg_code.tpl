<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <h2>我的推广代码</h2>
        <ul>
          <li><textarea name="tgcode" id="tgcode" style="width:500px;height:100px;" onfocus="this.select();" readonly><!--{$tgurl}--></textarea></li>
          <li><input type="button" onclick="copyText($('#tgcode').val());" value="复 制"/> 此链接作为您的推广代码传递给您的好友，您将有机会获得网站积分奖励，<span class="red">快快行动哟！</span></li>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<script type="text/javascript">
function copyText(txt) {  
    if (window.clipboardData) {  
        window.clipboardData.clearData();  
        window.clipboardData.setData("Text", txt);  
    } else if (navigator.userAgent.indexOf("Opera") != -1) {  
        window.location = txt;  
    } else if (window.netscape) {  
        try {  
            netscape.security.PrivilegeManager  
                    .enablePrivilege("UniversalXPConnect");  
        } catch (e) {  
            alert("复制失败");  
            return;  
        }  
        var clip = Components.classes['@mozilla.org/widget/clipboard;1']  
                .createInstance(Components.interfaces.nsIClipboard);  
        if (!clip)  
            return;  
        var trans = Components.classes['@mozilla.org/widget/transferable;1']  
                .createInstance(Components.interfaces.nsITransferable);  
        if (!trans)  
            return;  
        trans.addDataFlavor('text/unicode');  
        var str = new Object();  
        var len = new Object();  
        var str = Components.classes["@mozilla.org/supports-string;1"]  
                .createInstance(Components.interfaces.nsISupportsString);  
        var copytext = txt;  
        str.data = copytext;  
        trans.setTransferData("text/unicode", str, copytext.length * 2);  
        var clipid = Components.interfaces.nsIClipboard;  
        if (!clip)  
            return false;  
        clip.setData(trans, null, clipid.kGlobalClipboard);  
    }  
}
</script>
<!--{include file="include/footer.tpl"}-->