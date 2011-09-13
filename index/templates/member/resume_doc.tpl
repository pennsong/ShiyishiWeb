<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <div id="gcrnav">
          <ul>
            <li><a href="<!--{$baseurl}-->/member/resume/addcn.html"><!--{if $cnresume}-->更新<!--{else}-->添加<!--{/if}-->中文简历</a> | <a href="<!--{$baseurl}-->/member/resume/adden.html"><!--{if $enresume}-->更新<!--{else}-->添加<!--{/if}-->英文简历</a></li>
          </ul>
        </div>
        <h2>我的简历</h2>
        <table width="100%" border="1" cellspacing="1" cellpadding="0">
          <tr>
            <th width="13%">语言</th>
            <th width="9%">浏览次数</th>
            <th width="14%">更新日期</th>
            <th width="9%">状态</th>
            <th width="9%">操作</th>
          </tr>
          <!--{if $cnresume}-->
		  <tr>
            <td><p>中文</p></td>
            <td><a href="<!--{$baseurl}-->/member/myjob/rviewd.html"><!--{$cnresume.views}--></a></td>
            <td><!--{$cnresume.modifydate}--></td>
            <td><!--{if $cnresume.status==0}-->免打扰<!--{else}-->求职<!--{/if}--></td>
            <td><a href="<!--{$baseurl}-->/member/resume/addcn.html">更新</a></td>
          </tr>
		  <!--{/if}-->
		  <!--{if $enresume}-->
          <tr>
            <td><p>英文</p></td>
            <td><a href="<!--{$baseurl}-->/member/myjob/rviewd.html"><!--{$enresume.views}--></a></td>
            <td><!--{$enresume.modifydate}--></td>
            <td><!--{if $enresume.status==0}-->免打扰<!--{else}-->求职<!--{/if}--></td>
            <td><a href="<!--{$baseurl}-->/member/resume/adden.html">更新</a></td>
          </tr>
		  <!--{/if}-->
		  <!--{if !$cnresume && !$enresume}-->
		  <tr>
            <td colspan="5" align="center">暂时没有简历，请<a href="<!--{$baseurl}-->/member/resume/addcn.html">添加中文简历</a> | <a href="<!--{$baseurl}-->/member/resume/adden.html">添加英文简历</a></td>
          </tr>
		  <!--{/if}-->
        </table>
        <div class="topmargin10px"></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->