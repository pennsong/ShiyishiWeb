<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <h2>我的朋友 (<!--{$num}-->人)</h2>
        <table width="100%" cellspacing="1" cellpadding="0" id="ftable">
          <tr>
            <th width="3%">UID</th>
			<th width="11%">姓名</th>
            <th width="12%">注册EMAIL</th>
            <th width="11%">求职状态</th>
			<th width="14%">注册时间</th>
            <th width="13%">录用企业</th>
			<th width="12%">录用职位</th>
            <th width="12%">录用时间</th>
			<th width="12%">录用次数</th>
          </tr>
		  <!--{foreach from=$rows item=item}-->
          <tr>
            <td><!--{$item.id}--></td>
			<td><!--{$item.username}--></td>
            <td><!--{$item.email}--></td>
            <td><p><!--{if $item.resume_status==2}-->已录用<!--{elseif $item.resume_status==1}-->求职中<!--{else}-->免打扰<!--{/if}--></p></td>
            <td><p><!--{$item.regdate|date_format:"%Y-%m-%d %H:%M"}--></p></td>
            <td><!--{if $item.eid>0}--><a href="<!--{$baseurl}-->/company/view/<!--{$item.eid}-->.html" target="_blank"><!--{$item.ename}--></a><!--{else}-->未被录用<!--{/if}--></td>
			<td><!--{if $item.jobid>0}--><a href="<!--{$baseurl}-->/jobs/view/<!--{$item.jobid}-->.html" target="_blank"><!--{$item.jobname}--></a><!--{/if}--></td>
            <td><!--{if $item.edatetime>0}--><!--{$item.edatetime|date_format:"%Y-%m-%d %H:%M"}--><!--{else}-->无<!--{/if}--></td>
			<td><!--{if $item.etimes>0}--><a href="<!--{$baseurl}-->/member/tg/enroll.html?uid=<!--{$item.id}-->"><!--{$item.etimes}--></a><!--{else}-->0<!--{/if}--></td>
          </tr>
		  <!--{foreachelse}-->
          <tr>
            <td colspan="8" align="center">暂无任何您发展的朋友，建议您<a href="<!--{$baseurl}-->/member/tg/code.html">开始推广</a></td>
          </tr>
		  <!--{/foreach}-->
          <!--{if $rows}-->
		  <tr>
            <td colspan="6"><div align="right"><!--{include file=page.tpl}--></div></td>
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