<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <h2>您的朋友“<!--{$username}-->”的录取记录 (共<!--{$num}-->次)</h2>
        <table width="100%" cellspacing="1" cellpadding="0" id="ftable">
          <tr>
			<th width="70%">录用企业名称</th>
            <th width="30%">录取时间</th>
          </tr>
		  <!--{foreach from=$rows item=item}-->
          <tr>
            <td><a href="<!--{$baseurl}-->/company/view/<!--{$item.eid}-->.html" target="_blank"><!--{$item.ename}--></a></td>
            <td><!--{$item.createdate}--></td>
          </tr>
		  <!--{foreachelse}-->
          <tr>
            <td colspan="2" align="center">还没有录取记录</td>
          </tr>
		  <!--{/foreach}-->
        </table>
        <div class="topmargin10px"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->