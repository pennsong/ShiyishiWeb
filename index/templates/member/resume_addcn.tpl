<!--{include file="include/header.tpl"}-->
<script type="text/javascript" src="<!--{$baseurl}-->/js/checkform.js"></script>
<div id="content" class="container_24">
<div class="grid_24">
  <div id="gcenter">
    <!--{include file="m_nav.tpl"}-->
    <!--{include file="m_left.tpl"}-->
    <div id="gcenterright">
      <form id="resumeAddForm" name="resumeAddForm" action="<!--{$baseurl}-->/member/do/addresume.do" method="post">
	  <input type="hidden" value="<!--{$info.id|default:0}-->" name="info[id]"/><input type="hidden" value="cn" name="rtype"/>
	  <div id="gcenterrightc">
        <h2>我的简历-<!--{$pagetitle}--></h2>
        <div id="gloginrightmain">
          <h3>基本信息</h3>
          <ul>
            <li><span class="glogintext">姓名：</span>
              <input class="k" name="info[uname]" id="uname" type="text" value="<!--{$info.uname}-->" alt="姓名:空/长度@4-20/怪字符"/><span class="red bold">（必填）</span><span id="showResult_uname"></span>
            </li>
            <li><span class="glogintext">性别：</span>
              <input name="info[gender]" type="radio" value="1"<!--{if $info.gender!=2}--> checked<!--{/if}-->/>
              男
              <input name="info[gender]" type="radio" value="2"<!--{if $info.gender==2}--> checked<!--{/if}--> />
              女<span class="red bold">（必填）</span></li>
            <li><span class="glogintext">身份证号码：</span>
              <!--{if $info.idcard}--><input class="k" name="info[idcard]" value="<!--{$info.idcard}-->" type="text" readonly/><!--{else}--><input class="k" name="info[idcard]" id="idcard" value="<!--{$info.idcard}-->" alt="身份证:空/长度@15-18/英文数字/验证^idcard" type="text" /><span class="red bold">（必填）</span><span id="showResult_idcard"></span><!--{/if}-->
            </li>
            <li><span class="glogintext">身高（CM）：</span>
              <input class="k" name="info[stature]" id="stature" value="<!--{$info.stature}-->" alt="身高:空/长度@2-3/数字" type="text" /><span class="red bold">（必填）</span><span id="showResult_stature"></span>
            </li>
            <li><span class="glogintext">体重（KG）：</span>
              <input class="k" name="info[weight]" id="weight" value="<!--{$info.weight}-->" alt="体重:空/长度@1-3/数字" type="text" /><span class="red bold">（必填）</span><span id="showResult_weight"></span>
            </li>
            <li><span class="glogintext">户籍地：</span>
              <select name="info[birth_gnd_p]" onchange="setCity(this,'birth_gnd_c');">
                <!--{foreach from=$adatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.birth_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[birth_gnd_c]" id="birth_gnd_c" title="户籍地:空">
                <option value="">市/区</option>
				<!--{if $info.abdatas}-->
				<!--{foreach from=$info.abdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.birth_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span class="red bold">（必填）</span><span id="showResult_birth_gnd_c"></span>
            </li>
            <li><span class="glogintext">现居住地：</span>
              <select name="info[live_gnd_p]" onchange="setCity(this,'live_gnd_c');">
                <!--{foreach from=$adatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.live_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[live_gnd_c]" id="live_gnd_c" title="现居住地:空">
                <option value="">市/区</option>
				<!--{if $info.aldatas}-->
				<!--{foreach from=$info.aldatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.live_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select>&nbsp;<input name="info[live_address]" id="live_address" class="k" value="<!--{$info.live_address}-->" title="详细住址:空"/><span class="red bold">（无需填写省、市、区县）</span><span class="red bold">（必填）</span><span id="showResult_live_gnd_c"></span>
            </li>
            <li><span class="glogintext">出生年月日：</span>
              <select name="info[birth_year]" id="birth_year">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.birth_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>年
              <select name="info[birth_month]" id="birth_month" onchange="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.birth_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>月
              <select name="info[birth_day]" id="birth_day">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.birth_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>日 <span class="red bold">（必填）</span>
            </li>
            <li><span class="glogintext">最高学历：</span>
              <select name="info[degree]" id="degree" title="学历:空">
                <option value="">请选择</option>
                <!--{foreach from=$degrees key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span class="red bold">（必填）</span><span id="showResult_degree"></span>
            </li>
            <li><span class="glogintext">专业：</span>
				<input name="info[speciality]" id="speciality_o" class="k" value="<!--{$info.speciality}-->" title="专业:空"/>
				<span class="red bold">（必填）</span><span id="showResult_speciality_o"></span>
            </li>
            <li><span class="glogintext">手机：</span>
              <input class="k" name="info[oldphone]" id="oldmobile" type="hidden" value="<!--{$info.phone}-->"/><input class="k" name="info[phone]" id="mobile" type="text" value="<!--{$info.phone}-->" alt="手机:空/手机/验证^mobile"/><span class="red bold">（必填）</span><span id="showResult_mobile"></span>
            </li>
            <li><span class="glogintext">邮箱：</span>
              <input class="k" name="info[email]" id="email" type="text" value="<!--{$info.email}-->" alt="邮箱:空/邮件"/><span class="red bold">（必填）</span><span id="showResult_email"></span>
            </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3>求职意向</h3>
          <ul>
            <li><span class="glogintext">岗位性质：</span>
              <input name="info[jobterm]" type="radio" value="全职"<!--{if $info.jobterm!='兼职'&&$info.jobterm!='实习'}--> checked<!--{/if}-->/>
              全职
              <input name="info[jobterm]" type="radio" value="兼职"<!--{if $info.jobterm=='兼职'}--> checked<!--{/if}--> />
              兼职
              <input name="info[jobterm]" type="radio" value="实习"<!--{if $info.jobterm=='实习'}--> checked<!--{/if}--> />
              实习 <span class="red bold">（必填）</span></li>
            <li><span class="glogintext">到岗时间：</span>
              <select name="info[entrytime]">
                <!--{foreach from=$entrytimes key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.entrytime==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select> <span class="red bold">（必填）</span>
            </li>
            <li><span class="glogintext">期望行业：</span>
              <select name="info[dustrytype_1]" id="dustrytype_o" onchange="setSubData(this,'dustrytype');" title="期望行业:空">
                <option value="">请选择</option>
				<!--{foreach from=$dtdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.dustrytype_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[dustrytype_2]" id="dustrytype_t"<!--{if !$info.subdtdatas}--> style="display:none;"<!--{/if}-->>
			    <!--{if $info.subdtdatas}-->
				<!--{foreach from=$info.subdtdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.dustrytype_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span class="red bold">（必填）</span><span id="showResult_dustrytype_o"></span>
            </li>
            <li><span class="glogintext">期望岗位：</span>
              <select name="info[funtype_1]" id="funtype_o" onchange="setSubData(this,'funtype');" title="期望岗位:空">
                <option value="">请选择</option>
				<!--{foreach from=$ftdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.funtype_1==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[funtype_2]" id="funtype_t"<!--{if !$info.subftdatas}-->  style="display:none;"<!--{/if}-->>
			    <!--{if $info.subftdatas}-->
				<!--{foreach from=$info.subftdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.funtype_2==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span class="red bold">（必填）</span><span id="showResult_funtype_o"></span>
            </li>
            <li><span class="glogintext">期望薪资：</span>
              <select name="info[salary]">
                <!--{foreach from=$salarys key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $info.salary==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span class="red bold">（必填）</span>
            </li>
            <li><span class="glogintext">工作地点：</span>
              <select name="info[work_gnd_p]" onchange="setCity(this,'work_gnd_c');">
                <!--{foreach from=$adatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.work_gnd_p==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
              </select>
              <select name="info[work_gnd_c]" id="work_gnd_c" title="工作地点:空">
                <option value="0">市/区</option>
				<!--{if $info.awdatas}-->
				<!--{foreach from=$info.awdatas key=key item=item}-->
                <option value="<!--{$item.id}-->"<!--{if $info.work_gnd_c==$item.id}--> selected<!--{/if}-->><!--{$item.name}--></option>
                <!--{/foreach}-->
				<!--{/if}-->
              </select><span class="red bold">（必填）</span><span id="showResult_work_gnd_c"></span>
            </li>
            <li><span class="glogintext">目前状态：</span>
              <input name="info[nowzt]" type="radio" value="在职"<!--{if $info.nowzt!='离职'}--> checked<!--{/if}-->/>
              在职
              <input name="info[nowzt]" type="radio" value="离职"<!--{if $info.nowzt=='离职'}--> checked<!--{/if}--> />
              离职 <span class="red bold">（必填）</span></li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3>自我评价</h3>
          <ul>
            <li><span class="glogintext">&nbsp;</span>
              <textarea name="info[introduction]" id="introduction" style="width:500px;height:100px;" oninput="checklen(this,500,'tn0');" onpropertychange="checklen(this,500,'tn0')"><!--{$info.introduction}--></textarea>
            </li>
            <li><span class="glogintext">&nbsp;</span>概述您的职业优势，如：3年销售经验、5年软件开发经验，(限500字 剩余<span id="tn0">500</span>字) </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('work');" style="cursor:pointer;">增加工作经历</a></span>工作经历（如果您为应届毕业生，下面的时间请选择今天时间，内容都填写“无”）</h3><input type="hidden" id="delid_work" name="delete[work]" value=""/>
          <!--{foreach from=$works key=e item=work}--><input type="hidden" id="id_work_<!--{$e}-->" name="winfo[<!--{$e}-->][id]" value="<!--{$work.id|default:0}-->"/>
		  <ul id="resume_work_<!--{$e}-->">
            <li id="li_work_<!--{$e}-->"><span class="glogintext"><a id="close_work_<!--{$e}-->" style="cursor:pointer;<!--{if $e<1}-->display:none;<!--{/if}-->" onclick="closeIT(this);">删除</a> 时间：</span>
              <select name="winfo[<!--{$e}-->][from_year]" id="from_year_<!--{$e}-->">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.from_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>年
              <select name="winfo[<!--{$e}-->][from_month]" id="from_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.from_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>月
              <select name="winfo[<!--{$e}-->][from_day]" id="from_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.from_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>日
              -
              <select name="winfo[<!--{$e}-->][to_year]" id="to_year_<!--{$e}-->" onclick="checkdate(this);">
                <option value="至今"<!--{if $work.to_year=='至今'}--> selected<!--{/if}-->>至今</option>
				<!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.to_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span id="to_span_<!--{$e}-->"<!--{if $work.to_year=='至今'}--> style="display:none"<!--{/if}-->>年
              <select name="winfo[<!--{$e}-->][to_month]" id="to_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.to_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>月
              <select name="winfo[<!--{$e}-->][to_day]" id="to_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.to_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>日 </span><span class="red bold">（必填）</span> 
            </li>
            <li><span class="glogintext">工作单位：</span>
              <input class="k" name="winfo[<!--{$e}-->][company]" type="text" value="<!--{$work.company}-->" id="company_<!--{$e}-->" alt="工作单位:空/长度@2-50"/><span class="red bold">（必填）</span><span id="showResult_company_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintext">企业性质：</span>
              <select name="winfo[<!--{$e}-->][companytype]">
                <!--{foreach from=$companytypes key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.companytype==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span class="red bold">（必填）</span>
            </li>
            <li><span class="glogintext">职位名称：</span>
              <input class="k" name="winfo[<!--{$e}-->][position]" type="text" value="<!--{$work.position}-->" id="position_<!--{$e}-->" alt="职位名称:空/长度@2-30"/><span class="red bold">（必填）</span><span id="showResult_position_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintext">月收入：</span>
              <select name="winfo[<!--{$e}-->][income]" class="classFormEle_ok">
                <!--{foreach from=$salarys key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $work.income==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span class="red bold">（必填）</span>
            </li>
            <li><span class="glogintext">工作描述：</span>
              <textarea name="winfo[<!--{$e}-->][responsiblity]" style="width:500px;height:100px;"  onblur="return tj(this);" onkeyup="return tj(this);" id="responsiblity_<!--{$e}-->"><!--{$work.responsiblity}--></textarea><span class="red bold">（必填）</span><span id="showResult_responsiblity_<!--{$e}-->"></span>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('edu');" style="cursor:pointer;">增加教育经历</a></span>教育经历</h3><input type="hidden" id="delid_edu" name="delete[edu]" value=""/>
          <!--{foreach from=$edus key=e item=edu}--><input type="hidden" id="id_edu_<!--{$e}-->" name="einfo[<!--{$e}-->][id]" value="<!--{$edu.id|default:0}-->"/>
		  <ul id="resume_edu_<!--{$e}-->">
            <li id="li_edu_<!--{$e}-->"><span class="glogintext"><a id="close_edu_<!--{$e}-->" style="cursor:pointer;display:none;" onclick="closeIT(this);">删除</a> 时间：</span>
              <select name="einfo[<!--{$e}-->][from_year]" id="efrom_year_<!--{$e}-->">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.from_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>年
              <select name="einfo[<!--{$e}-->][from_month]" id="efrom_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.from_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>月
              <select name="einfo[<!--{$e}-->][from_day]" id="efrom_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.from_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>日
              -
              <select name="einfo[<!--{$e}-->][to_year]" id="eto_year_<!--{$e}-->" onclick="checkdate(this);">
                <option value="至今"<!--{if $edu.to_year=='至今'}--> selected<!--{/if}-->>至今</option>
				<!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.to_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span id="eto_span_<!--{$e}-->"<!--{if $edu.to_year=='至今'}--> style="display:none"<!--{/if}-->>年
              <select name="einfo[<!--{$e}-->][to_month]" id="eto_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.to_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>月
              <select name="einfo[<!--{$e}-->][to_day]" id="eto_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.to_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>日</span><span class="red bold">（必填）</span>
            </li>
            <li><span class="glogintext">毕业院校：</span>
              <input class="k" name="einfo[<!--{$e}-->][schoolname]" type="text" id="schoolname_<!--{$e}-->" value="<!--{$edu.schoolname}-->" alt="毕业院校:空/长度@4-50"/><span class="red bold">（必填）</span><span id="showResult_schoolname_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintext">专业：</span>
				<input name="einfo[<!--{$e}-->][major]" id="major_o_<!--{$e}-->" class="k" value="<!--{$edu.major}-->" title="专业:空"/>
				<span class="red bold">（必填）</span><span id="showResult_major_o_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintext">学历：</span>
              <select name="einfo[<!--{$e}-->][degree]">
                <!--{foreach from=$degrees key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $edu.degree==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select><span class="red bold">（必填）</span>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('ctf');" style="cursor:pointer;">增加证书</a></span>证书</h3><input type="hidden" id="delid_ctf" name="delete[ctf]" value=""/>
          <!--{foreach from=$ctfs key=e item=ctf}--><input type="hidden" id="id_ctf_<!--{$e}-->" name="cinfo[<!--{$e}-->][id]" value="<!--{$ctf.id|default:0}-->"/>
		  <ul id="resume_ctf_<!--{$e}-->">
            <li id="li_ctf_<!--{$e}-->"><span class="glogintext"><a id="close_ctf_<!--{$e}-->" style="cursor:pointer;display:none;" onclick="closeIT(this);">删除</a> 发证时间：</span>
              <select name="cinfo[<!--{$e}-->][award_year]" id="award_year_<!--{$e}-->">
                <!--{foreach from=$years key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $ctf.award_year==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>年
              <select name="cinfo[<!--{$e}-->][award_month]" id="award_month_<!--{$e}-->" onclick="checkday(this);">
                <!--{foreach from=$months key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $ctf.award_month==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>月
              <select name="cinfo[<!--{$e}-->][award_day]" id="award_day_<!--{$e}-->">
                <!--{foreach from=$days key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $ctf.award_day==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>日
            </li>
            <li><span class="glogintext">发证机关：</span>
              <input class="k" name="cinfo[<!--{$e}-->][awardorg]" type="text" value="<!--{$ctf.awardorg}-->" id="awardorg_<!--{$e}-->" alt="发证机关:长度@4-50"/><span id="showResult_awardorg_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintext">证书名称：</span>
              <input class="k" name="cinfo[<!--{$e}-->][ctfname]" type="text" value="<!--{$ctf.ctfname}-->" id="ctfname_<!--{$e}-->" alt="证书名称:长度@4-50"/><span id="showResult_awardorg_<!--{$e}-->"></span>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('lang');" style="cursor:pointer;">增加语言能力</a></span>语言能力</h3><input type="hidden" id="delid_lang" name="delete[lang]" value=""/>
          <!--{foreach from=$langs key=e item=lang}--><input type="hidden" id="id_lang_<!--{$e}-->" name="linfo[<!--{$e}-->][id]" value="<!--{$lang.id|default:0}-->"/>
		  <ul id="resume_lang_<!--{$e}-->">
            <li id="li_lang_<!--{$e}-->"><span class="glogintext"><a id="close_lang_<!--{$e}-->" style="cursor:pointer;display:none;" onclick="closeIT(this);">删除</a> 语种：</span>
              <select name="linfo[<!--{$e}-->][language]">
                <!--{foreach from=$languages key=key item=item}-->
                <option value="<!--{$key}-->"<!--{if $lang.language==$key}--> selected<!--{/if}-->><!--{$item}--></option>
                <!--{/foreach}-->
              </select>
            </li>
            <li><span class="glogintext">读写能力：</span>
              <select name="linfo[<!--{$e}-->][rwability]">
                <option value="熟练"<!--{if $lang.rwability=='熟练'}--> selected<!--{/if}-->>熟练</option>
                <option value="一般"<!--{if $lang.rwability=='一般'}--> selected<!--{/if}-->>一般</option>
                <option value="较差"<!--{if $lang.rwability=='较差'}--> selected<!--{/if}-->>较差</option>
              </select>
            </li>
            <li><span class="glogintext">听说能力：</span>
              <select name="linfo[<!--{$e}-->][lsability]">
                <option value="熟练"<!--{if $lang.lsability=='熟练'}--> selected<!--{/if}-->>熟练</option>
                <option value="一般"<!--{if $lang.lsability=='一般'}--> selected<!--{/if}-->>一般</option>
                <option value="较差"<!--{if $lang.lsability=='较差'}--> selected<!--{/if}-->>较差</option>
              </select>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3><span class="floatRight"><img src="<!--{$baseurl}-->/images/jia.gif" align="absmiddle" /> <a onclick="AddHtml('it');" style="cursor:pointer;">增加计算机操作技能</a></span>计算机操作技能</h3><input type="hidden" id="delid_it" name="delete[it]" value=""/>
          <!--{foreach from=$its key=e item=it}--><input type="hidden" name="itinfo[<!--{$e}-->][id]" value="<!--{$it.id|default:0}-->"/>
		  <ul id="resume_it_<!--{$e}-->">
            <li id="li_it_<!--{$e}-->"><span class="glogintext"><a id="close_it_<!--{$e}-->" style="cursor:pointer;display:none;" onclick="closeIT(this);">删除</a> 技能名称：</span>
              <input class="k" name="itinfo[<!--{$e}-->][skillname]" type="text" value="<!--{$it.skillname}-->" id="skillname_<!--{$e}-->" alt="技能名称:长度@2-20"/><span id="showResult_skillname_<!--{$e}-->"></span>
            </li>
            <li><span class="glogintext">熟练程度：</span>
              <select name="itinfo[<!--{$e}-->][ability]">
                <option value="熟练"<!--{if $it.ability=='熟练'}--> selected<!--{/if}-->>熟练</option>
                <option value="一般"<!--{if $it.ability=='一般'}--> selected<!--{/if}-->>一般</option>
                <option value="较差"<!--{if $it.ability=='较差'}--> selected<!--{/if}-->>较差</option>
              </select>
            </li>
            <li><span class="glogintext">使用时间：</span>
              <input class="k" name="itinfo[<!--{$e}-->][usetime]" type="text" value="<!--{$it.usetime}-->" style="width:60px;" id="usetime_<!--{$e}-->" alt="使用时间:数字/长度@1-3"/>月<span id="showResult_usetime_<!--{$e}-->"></span>
            </li>
          </ul>
		  <!--{/foreach}-->
        </div>
        <div id="gloginrightmain">
          <h3>兴趣爱好</h3>
          <ul>
            <li><span class="glogintext">&nbsp;</span>
              <textarea name="info[interest]" id="interest" style="width:500px;height:100px;" oninput="checklen(this,500,'tn1');" onpropertychange="checklen(this,500,'tn1')"><!--{$info.interest}--></textarea>
            </li>
            <li><span class="glogintext">&nbsp;</span>概述您的兴趣爱好，(限500字 剩余<span id="tn1">500</span>字) </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <h3>专业课程</h3>
          <ul>
            <li><span class="glogintext">&nbsp;</span>
              <textarea name="info[zycourse]" id="zycourse" style="width:500px;height:100px;" oninput="checklen(this,500,'tn2');" onpropertychange="checklen(this,500,'tn2')"><!--{$info.zycourse}--></textarea>
            </li>
            <li><span class="glogintext">&nbsp;</span>概述您的专业课程，(限500字 剩余<span id="tn2">500</span>字) </li>
          </ul>
        </div>
        <div id="gloginrightmain">
          <ul>
            <li><span class="glogintext">&nbsp;</span><input type="hidden" value="0" name="continue" id="continue"/><input type="image" onclick="checktj();if(tj_value){return checkPostResume(false);}else{ alert('内容填写不完整');return false;}" src="<!--{$baseurl}-->/images/shangchuan.gif" /></li>
            <li><span class="glogintext">&nbsp;</span><span class="red">上传简历后，请您在个人中心首页中修改您的个人状态为"求职"时方可申请职位。</span> </li>
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
var worki = <!--{$worknum}-->;
var edui = <!--{$edunum}-->;
var ctfi = <!--{$ctfnum}-->;
var langi = <!--{$langnum}-->;
var iti = <!--{$itnum}-->;
function checkPostResume(_t){
	if(fm_chk(oo('resumeAddForm'))){
		if(_t){
			$("#continue").val('1');
		}else{
			$("#continue").val('0');
		}
		return true;
	}
	return false;
}
//设置城市
function setCity(_o,_tid){
	var pid = _o.value;
	var tobj = document.getElementById(_tid);
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("请选择省份！！！");
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getcitysbypid.do",
			dataType:"html",
			data:'pid='+pid,
			success:function(msg)
			{
				if(!msg){
					$("#"+_tid).hide();
				}else{
					msg = msg.split(":");
					if(msg.length>0){
						$("#"+_tid).show();
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}
		});
	}
}
//setSubData(this,'dustrytype')
function setSubData(_o,_t){
	var pid = _o.value;
	var _tid = _o.id.replace('_o','_t')
	var tobj = document.getElementById(_tid);
	$("#"+_tid).hide();
	tobj.options.length = 0;
	if(!pid || pid<=0){
		alert("请选择有效信息！！！");
	}else{
		$.ajax({
			type:"POST",
			url:"/ajax/getsubdatabypid.do",
			dataType:"html",
			data:'rtype=cn&type='+_t+'&pid='+pid,
			success:function(msg)
			{
				if(msg){
					msg = msg.split(":");
					if(msg.length>0){
						$("#"+_tid).show();
						for(var i=0;i<msg.length;i++){
							var val = msg[i].split("|");
							tobj.options.add(new Option(val[1],val[0]));
						}
					}
				}
			}
		});
	}
}

function closeIT(ab){
	var delID = ab.id.replace('close','li');
	var idID = ab.id.replace('close','id');
	var ob = document.getElementById(delID);
	if(confirm("确定删除吗？")){
		if($('#'+idID).val() > 0){
			var tmp = idID.split('_');
			var delvalue = $('#delid_'+tmp[1]).val();
			$('#delid_'+tmp[1]).val(delvalue+','+$('#'+idID).val())
		}
		ob.parentNode.parentNode.removeChild(ob.parentNode);
	}
}

function checkday(_obj){
	var _m = _obj.value;
	var _y = $("#" + _obj.id.replace('month','year')).val();
	var _do = document.getElementById(_obj.id.replace('month','day'));
	var _len = _do.options.length;
	if(_m==2){
		var _e = _y%4==0 ? 28 : 29;
	}else if(_m==4||_m==6||_m==9||_m==11){
		var _e = 30;
	}else{
		var _e = 31;
	}
	var _i = _len+1;
	if(_i<=_e){
		for(_i;_i<=_e;_i++) {
			_do.options.add(new Option(_i,_i));
		}
	}else{
		_do.options.length = _e;
	}
}

function checkdate(_obj){
	var _y = _obj.value;
	var _sid = _obj.id.replace('year','span');
	if(_y=='至今'){
		$("#" + _sid).hide();
	}else{
		$("#" + _sid).show();
	}
}
	
function checktj(){
	var i = getIvalue('work');
	var id = '';
	var bObj;
	for(var x=0;x<i;x++){
		id="responsiblity_"+x;
		bObj = document.getElementById(id);
		if(tj_value){
			tj(bObj);
		}else{
			break;
		}
	}
	return tj_value;
}

function AddHtml(_t){
	var i = getIvalue(_t);
	var bi = getBI(i,_t);//i-1;
	var bHtmlid = 'resume_'+_t+'_' + bi;
	var bObj = document.getElementById(bHtmlid);
	var bHtml = bObj.innerHTML;
	var oUl=document.createElement("ul");
	oUl.id = 'resume_'+_t+'_' + i;
	setIvalue(_t);
	bObj.parentNode.appendChild(oUl, bObj);
	oUl.innerHTML = toReplace(toReplace(toReplace(bHtml,'_'+bi,'_'+i),'selected',''),"\\["+bi+"\\]","["+i+"]");
	var inputs = oUl.getElementsByTagName("input");
	if(inputs.length>0){
		for(var j=0;j<inputs.length;j++){
			inputs[j].value = '';
		}
	}
	var textareas = oUl.getElementsByTagName("textarea");
	if(textareas.length>0){
		for(var j=0;j<textareas.length;j++){
			textareas[j].value = '';
		}
	}
	$('#close_'+_t+'_' + i).show();
	fm_ini();
}

function getBI(i,_t){
	var bi = i-1;
	var bHtmlid = '';
	//var bObj = document.getElementById(bHtmlid);
	for(bi;bi>=0;bi--){
		bHtmlid = 'resume_'+_t+'_' + bi;
		if(document.getElementById(bHtmlid)){
			return bi;
		}
	}
}

function getIvalue(_t){
	if(_t=='work'){
		return worki;
	}else if(_t=='edu'){
		return edui;
	}else if(_t=='ctf'){
		return ctfi;
	}else if(_t=='lang'){
		return langi;
	}else if(_t=='it'){
		return iti;
	}else{
		return 0;
	}
}

function setIvalue(_t){
	if(_t=='work'){
		worki++;
	}else if(_t=='edu'){
		edui++;
	}else if(_t=='ctf'){
		ctfi++;
	}else if(_t=='lang'){
		langi++;
	}else if(_t=='it'){
		iti++;
	}
}

function toReplace(str,_b,_o){ 
     var RexStr = eval("/"+_b+"/g");
     str = str.replace(RexStr, _o) 
     return str; 
}

function strlen(str)
{
	var lenE = str.length;
	var lenC = 0;
	var CJK = str.match(/[^\x00-\xff]/g);
	if(CJK != null) lenC += CJK.length;
	var len = lenC + lenE;
	return len;	
}

function trim(str) 
{ 
	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, ''); 
}

function checklen(obj,lenT,objname)
{
	var lenE = obj.value.length;
	var lenC = 0;
	var CJK = obj.value.match(/[^\x00-\xff]/g);
	if (CJK != null) lenC += CJK.length;
	var tno = document.getElementById(objname);
	tno.innerText = lenT - lenC - lenE;
	if (tno.innerText < 0) {
		var tmp = 0
		var cut = obj.value.substring(0, lenT);
		for (var i=0; i<cut.length; i++){
			tmp += /[^\x00-\xff]/.test(cut.charAt(i)) ? 2 : 1;
			if (tmp > lenT) break;
		}
		obj.value = cut.substring(0, i);
		tno.innerText = 0;
	}
}
function initLen(name1,name2,maxlen)
{
	var obj1 = document.getElementById(name1);
	var obj2 = document.getElementById(name2);
	var len = strlen(obj1.value);
	if(!maxlen)maxlen=200;
	if(maxlen-len <= 0)
	{
		obj2.innerText = 0;
	}
	else
	{
		obj2.innerText = maxlen - len;	
	}
}
initLen('introduction','tn0',500);
initLen('interest','tn1',500);
initLen('zycourse','tn2',500);
</script>
<!--{include file="include/footer.tpl"}-->