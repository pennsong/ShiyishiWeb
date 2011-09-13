<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <div id="gcenterrightc">
        <h2>我的账户</h2>
        <ul>
          <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 帐号等级：  <!--{if $myinfo.status<=0}--><span class="red">待审核会员</span> 请填写文字简历和视频简历通过审核<!--{else}-->正式会员<!--{/if}--></li>
        </ul>
        <div class="topmargin10px"></div>
        <h2>我的简历</h2>
        <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> <!--{if !$cnresume && !$enresume}-->您还没有自己的简历，<!--{/if}-->请 <a href="<!--{$baseurl}-->/member/resume/addcn.html"><!--{if $cnresume}-->更新<!--{else}-->添加<!--{/if}-->中文简历</a> 和 <a href="<!--{$baseurl}-->/member/resume/adden.html"><!--{if $enresume}-->更新<!--{else}-->添加<!--{/if}-->英文简历</a></li>
        <!--{if $cnresume || $enresume}-->
		<table width="100%" border="1" cellspacing="1" cellpadding="0">
          <tr>
            <th width="13%">语言</th>
            <th width="9%">浏览次数</th>
            <th width="14%">更新日期</th>
            <th width="9%">操作</th>
          </tr>
          <!--{if $cnresume}-->
		  <tr>
            <td><p>中文</p></td>
            <td><a href="<!--{$baseurl}-->/member/myjob/rviewd.html"><!--{$viewdnum}--></a></td>
            <td><!--{$cnresume.modifydate}--></td>
            <td><a href="<!--{$baseurl}-->/member/resume/addcn.html">更新</a></td>
          </tr>
		  <!--{/if}-->
		  <!--{if $enresume}-->
          <tr>
            <td><p>英文</p></td>
            <td><a href="<!--{$baseurl}-->/member/myjob/rviewd.html"><!--{$enresume.views}--></a></td>
            <td><!--{$enresume.modifydate}--></td>
            <td><a href="<!--{$baseurl}-->/member/resume/adden.html">更新</a></td>
          </tr>
		  <!--{/if}-->
        </table>
		<!--{/if}-->
		<div class="topmargin10px"></div>
		<li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> <!--{if $vodresume}--><a href="<!--{$baseurl}-->/member/resume/vod.html">更新视频简历</a>，本网站只保存您的一份最新上传的视频简历，原视频简历被覆盖！<!--{else}-->您还没有自己的视频简历，请<a href="<!--{$baseurl}-->/member/resume/vod.html">上传视频简历</a>。<!--{/if}--></li>
        <div class="topmargin10px"></div>
        <h2>我的求职状态：<!--{if $hadlq==1||$logininfo.resume_status==2}-->已录用<!--{elseif $logininfo.resume_status==1}-->求职中<!--{else}-->免打扰<!--{/if}--></h2>
		<li>
		<!--{if ($cnresume||$enresume) && ((!$vodresume && $web.isvideo==0) || $vodresume ) }-->
		<!--{if $hadlq==1}-->
		<p align="center">您已经被企业录用，并且一个月内无法再求职，如重新申请职位，请通过服务热线与我们服务人员联系。</p>
          
		<!--{else}-->
		<form id="setresumestatus" name="setresumestatus" action="<!--{$baseurl}-->/member/do/setresumestatus.do" method="post">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:0px;">
		  <tr>
            <td style="text-align:left;"><p><input <!--{if $logininfo.resume_status==2}-->disabled="disabled"<!--{/if}--> name="resume_status" type="radio" value="0" <!--{if $logininfo.resume_status==0}--> checked<!--{/if}-->/>
              免打扰  <span class="hui">(把简历放入人才储备库，不对招聘单位开放，不接受招聘单位的搜索查看)</span></p></td>
          </tr>
		  <tr>
            <td style="text-align:left;"><p><input <!--{if $logininfo.resume_status==2}-->disabled="disabled"<!--{/if}--> name="resume_status" type="radio" value="1"<!--{if $logininfo.resume_status==1}--> checked<!--{/if}--> />
              求职 <span class="hui">(把简历放入求职库，对招聘单位开放，接受招聘单位的搜索查看)</span></p></td>
          </tr>
		  <tr>
            <td style="text-align:left;"><p><input disabled="disabled" name="resume_status" type="radio" value="2"<!--{if $logininfo.resume_status==2}--> checked<!--{/if}--> />
              已录用 <span class="hui">(您已经被企业录用，并且一个月内无法再求职。)</span></p></td>
          </tr>
		  <tr>
            <td style="text-align:left;"><p><input type="image" src="<!--{$baseurl}-->/images/baocun.gif" /></p></td>
          </tr>
        </table>
		</form>
		<!--{/if}-->
		<!--{else}-->
		<p>您只有完成了中文或英文简历 以及上传了 视频简历后方可设置自己的求职状态。</p>
		<!--{/if}--></li>
        <div class="topmargin10px"></div>
        <h2>我的工作</h2>
        <ul>
          <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 职位申请记录：共申请 <a href="<!--{$baseurl}-->/member/myjob/pos.html" class="red"><!--{$posnum}--></a> 条职位 ,其中有 <a href="<!--{$baseurl}-->/member/myjob/pos.html?e=1" class="red"><!--{$posnum_e}--></a> 条职位已过期 <a href="<!--{$baseurl}-->/member/myjob/pos.html">点此查看</a></li>
          <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 我的面试机会：共收到 <a href="<!--{$baseurl}-->/member/myjob/int.html" class="red"><!--{$intnum}--></a> 条面试通知 ,其中有 <a href="<!--{$baseurl}-->/member/myjob/int.html?isnew=1" class="red"><!--{$intnum_n}--></a> 条新面试通知 <a href="<!--{$baseurl}-->/member/myjob/int.html">点此查看</a></li>
          <li><img src="<!--{$baseurl}-->/images/Icon1.gif" /> 简历被查看记录：共记录 <a href="<!--{$baseurl}-->/member/myjob/rviewd.html" class="red"><!--{$viewdnum}--></a> 家企业查看我的简历 <a href="<!--{$baseurl}-->/member/myjob/rviewd.html">点此查看</a></li>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
<!--{include file="include/footer.tpl"}-->