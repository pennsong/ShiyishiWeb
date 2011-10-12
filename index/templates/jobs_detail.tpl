<!--{include file="include/header.tpl"}-->
<div id="content" class="container_24">
  <div class="grid_24">
    <div id="jobtitle"><!--{$item.ename}-->
      <div id="jobxxtitle">
        <ul>
		 <!--{if !$is_company}-->
				  <li onclick="window.open('/company/view/<!--{$item.cid}-->.html');" style=" cursor: pointer;">公司简介</li>
				  <li class="on">招聘职位</li>
		<!--{/if}-->
        </ul>
      </div>
    </div>
  </div>
  <div class="grid_5">
    <div id="jobjob">
      <h2><!--{if $is_company==1}-->公司简介<!--{else}-->招聘职位<!--{/if}--></h2>
      <ul>
		<!--{foreach from=$news key=key item=sitem}-->
        <li>·<a href="/jobs/view/<!--{$sitem.id}-->.html" target="_blank"><!--{$sitem.title}--></a></li>
		<!--{/foreach}-->
      </ul>
    </div>
  </div>
<!--{if $is_company==1}-->
  <div class="grid_19">
    <div id="jobxxmain">
      <h2><!--{$item.company}--></h2>
      <p>
      <table align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
        <tbody>
          <tr>
            <td height="2"></td>
          </tr>
          <tr>
            <td bgcolor="#dddddd" height="2"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="4" cellspacing="1" width="100%">
        <tbody>
          <tr>
            <td width="10%" align="center" bgcolor="#f9f9f9">公司规模：</td>
            <td width="39%"><!--{$item.company_scale}--></td>
            <td width="13%" align="center" bgcolor="#f9f9f9">公司类型：</td>
            <td width="38%"><!--{$item.company_type}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr>
            <td width="10%" align="center" bgcolor="#f9f9f9">公司行业：</td>
            <td width="39%"><!--{$item.dustrytype}--></td>
            <td width="13%" align="center" bgcolor="#f9f9f9">所在城市：</td>
            <td width="38%"><!--{$item.proname}-->-<!--{$item.cityname}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr>
            <td width="10%" align="center" bgcolor="#f9f9f9">公司地址：</td>
            <td width="39%"><!--{$item.address}--></td>
            <td width="13%" align="center" bgcolor="#f9f9f9">邮政编码：</td>
            <td width="38%"><!--{$item.postcode}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
        </tbody>
      </table>
      <!--公司介绍-->
      <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td height="25"><strong>公司介绍</strong>：</td>
          </tr>
          <tr>
            <td><!--{$item.info}--></td>
          </tr>
        </tbody>
      </table>
      </p>
    </div>

  </div>
<!--{else}-->
  <div class="grid_19">
    <div id="jobxxmain">
      <h2><!--{$item.title}--></h2>
      <p>
      <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody>
                  <tr valign="top">
                    <td><table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tbody>
                          <tr>
                            <td height="20">公司规模：<!--{$item.company_scale}--><br />
                              公司类型：<!--{$item.company_type}--><br />
                              公司行业：<!--{$item.dustrytype}--><br />
							  </td>
                          </tr>
                        </tbody>
                      </table></td>
                    <td align="center" width="248"> </td>
                  </tr>
                </tbody>
              </table></td>
          </tr>
        </tbody>
      </table>
      <table align="center" border="0" cellpadding="0" cellspacing="1" width="100%">
        <tbody>
          <tr>
            <td height="2"></td>
          </tr>
          <tr>
            <td bgcolor="#dddddd" height="2"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="4" cellspacing="1" width="100%">
        <tbody>
          <tr>
            <td width="12%" align="center" bgcolor="#f9f9f9">职位性质：</td>
            <td width="38%"><!--{if $item.jobterm==1 }-->全职<!--{/if}--><!--{if $item.jobterm==2 }-->兼职<!--{/if}--><!--{if $item.jobterm==3 }-->实习<!--{/if}--></td>
            <td align="center" bgcolor="#f9f9f9">招聘职位：</td>
            <td><!--{$item.title}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr>
            <td width="12%" align="center" bgcolor="#f9f9f9">招聘人数：</td>
            <td width="38%"><!--{if $item.pnum==0}-->不限<!--{else}--><!--{$item.pnum}-->人<!--{/if}--></td>
            <td width="12%" align="center" bgcolor="#f9f9f9">职位月薪：</td>
            <td width="38%"><!--{$item.money}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr>
            <td width="12%" align="center" bgcolor="#f9f9f9">发布日期：</td>
            <td width="38%"><!--{$item.createtime|date_format:"%Y-%m-%d %H:%M"}--></td>
            <td width="12%" align="center" bgcolor="#f9f9f9">截止日期：</td>
            <td width="38%"><!--{$item.enddate|date_format:"%Y-%m-%d %H:%M"}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr>
            <td width="12%" align="center" bgcolor="#f9f9f9">学历要求：</td>
            <td width="38%"><!--{$item.degree}--></td>
            <td width="12%" align="center" bgcolor="#f9f9f9">工作经验：</td>
            <td width="38%"><!--{if $item.work_exp==0 }-->不限<!--{/if}--><!--{if $item.work_exp==1 }-->无经验<!--{/if}--><!--{if $item.work_exp==2 }-->1年以下<!--{/if}--><!--{if $item.work_exp==3 }-->1-3年<!--{/if}--><!--{if $item.work_exp==4 }-->3-5年<!--{/if}--><!--{if $item.work_exp==5 }-->5-10年<!--{/if}--><!--{if $item.work_exp==6 }-->10年以上<!--{/if}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr>
            <td width="12%" align="center" bgcolor="#f9f9f9">性别要求：</td>
            <td width="38%"><!--{if $item.gender==1 }-->不限<!--{/if}--><!--{if $item.gender==2 }-->男<!--{/if}--><!--{if $item.gender==3 }-->女<!--{/if}--></td>
            <td width="12%" align="center" bgcolor="#f9f9f9">语言能力：</td>
            <td width="38%"><!--{$item.language}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="4" bgcolor="#dddddd"></td>
          </tr>
        </tbody>
      </table>
      <table border="0" cellpadding="4" cellspacing="1" width="100%">
        <tbody>
          <tr>
            <td width="12%" align="center" bgcolor="#f9f9f9">工作地点：</td>
            <td width="88%"><!--{$item.proname}-->-<!--{$item.cityname}--><!--{if $item.live_address}-->-<!--{$item.live_address}--><!--{/if}--></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="2" bgcolor="#dddddd"></td>
          </tr>
          <tr align="center">
            <td height="1" colspan="2" bgcolor="#dddddd"></td>
          </tr>
        </tbody>
      </table>
      <!--职位描述-->
      <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <tbody>
          <tr>
            <td height="25"><strong>职位描述</strong>：</td>
          </tr>
          <tr>
            <td><!--{$item.jtext}--></td>
          </tr>
        </tbody>
      </table>
      </p>
    </div>
	<!--{if $euser==0}-->
    <div id="jobxxmainbutton"><a href="<!--{$baseurl}-->/member/do/applyjob.do?jobid=<!--{$item.id}-->"><img src="<!--{$baseurl}-->/images/Button2_1.jpg" /></a></div>
	<!--{/if}-->
  </div>
<!--{/if}-->
</div>
<!--{include file="include/footer.tpl"}-->
