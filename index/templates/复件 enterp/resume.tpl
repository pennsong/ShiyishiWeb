<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人用户中心首页</title>
<link href="<!--{$baseurl}-->/styles/reset.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/styles/960_24_col.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/styles/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.piaochong.com/js/base.js"></script>
</head>
<body>
<div id="wrap">
	<div id="main">
    	<div id="gerenjl">
    	  <table border="0" cellspacing="5" cellpadding="0" width="640" align="center">
    	    <form method="post" name="form1" id="form1" action="/enterp/send_interview/">
				<input value="" type="hidden" name="type" id="type" />
				<input value="<!--{$info.id}-->" type="hidden" name="PositionID[]"/>
    	      <tbody>
			  <!--{if !$down || $rtype}-->

    	        <tr>
    	          <td></td>
    	          <td><p>您目前的简历下载余额为 文字简历<!--{$wordnum}-->份 视频简历及<!--{$videonum}-->份  。请联系我们的销售人员获得新的简历下载数。</p></td>
  	          </tr>

			  <!--{if !$rtype}-->
    	        <tr>
    	          <td width="1%" nowrap="nowrap" align="right"></td>
    	          <td><p>下载这份文字简历及联系方式到简历夹。目前您还有 <!--{$wordnum}--> 份的简历下载余额。</p></td>
  	          </tr>

    	        <tr>
    	          <td> </td>
    	          <td>
					<input value=" 确 定 " type="submit"  onclick="$('#type').val('doc');document.forms[0].action='/enterp/resume/down.do';" />
				</td>
  	          </tr>
			  <!--{/if}-->

			  <!--{if !$down || $rtype==1}-->
    	        <tr>
    	          <td nowrap="nowrap" align="right"></td>
    	          <td><p>下载这份文字简历和视频简历及联系方式到简历夹。目前您还有  <!--{if $videonum>$wordnum}--><!--{$wordnum}--><!--{else}--><!--{$videonum}--><!--{/if}--> 份的简历下载余额。</p></td>
  	          </tr>
    	        <tr>
    	          <td> </td>
    	          <td>
    	            <input value=" 确 定 " type="submit"  onclick="$('#type').val('all');document.forms[0].action='/enterp/resume/down.do';" />
  	          </tr>
			  <!--{/if}-->
				<!--{/if}-->

			   <!--{if !$down}-->
    	        <tr>
    	          <td width="1%" nowrap="nowrap" align="right"></td>
    	          <td><p>保存简历到暂存夹以便稍后查阅确定是否下载</p></td>
  	          </tr>
    	        <tr>
    	          <td> </td>
    	          <td>
    	            <input value=" 确 定 " type="submit"  onclick="$('#type').val('tmp');document.forms[0].action='/enterp/resume/tmp.do';" />
  	          </tr>
				<!--{/if}-->
    	        <tr>
    	          <td height="1" colspan="2" bgcolor="#CCCCCC"></td>
   	            </tr>
    	        <tr>
    	          <td colspan="2">联系方式有：
						<!--{if $down}-->
						<!--{$info.phone}--> 
						<!--{$info.email}-->
						<!--{/if}-->
					</td>
   	            </tr>
    	        <tr>
    	          <td colspan="2"><table border="0" cellspacing="0" cellpadding="0" width="600">
    	            <tbody>
    	              <tr>
    	                <td><strong>简历名称:<!--{$info.funtype_2_name}--> <!--{$info.live_gnd_name}--></strong></td>
    	                <td align="right" class="font14px bold">视一视招聘网</td>
  	                </tr>
  	              </tbody>
  	            </table>
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                      <tbody>
                        <tr>
                          <td width="81%">ID:<!--{$info.id}--></td>
                          <td width="19%"><a href="/enterp/resume/view.html?id=<!--{$info.id}-->&t=en">查看其英文简历</a></td>
                        </tr>
                        <tr>
                          <td colspan="2" style="border:1px solid #ccc"><div align="right"><!--{$info.uname}--> <!--{if $info.gender==1}-->男<!--{else}-->女<!--{/if}--> | <!--{$info.birth_year}-->年<!--{$info.birth_month}-->月生 | 现居住于：<!--{$info.live_gnd_name}--> </div></td>
                        </tr>
                      </tbody>
                  </table></td>
   	            </tr>
    	        <tr>
    	          <td colspan="2"><div  style="border:1px solid #ccc">
    	            <div>
    	              <div>
    	                <div class="grh2">求职意向</div>
    	                <div class="grmain">
    	                  <table width="100%" border="0" cellpadding="2" cellspacing="0">
    	                    <tbody>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">期望工作性质：</td>
    	                        <td><!--{$info.jobterm}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">期望从事职业：</td>
    	                        <td><!--{$info.funtype_2_name}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td valign="top" nowrap="nowrap" align="right">期望从事行业：</td>
    	                        <td><!--{$info.dustrytype_2_name}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">期望工作地区：</td>
    	                        <td><!--{$info.work_gnd_name}--></td>
  	                        </tr>
    	                      <tr></tr>
    	                      <tr>
    	                        <td width="1%" nowrap="nowrap" align="right">目前状况：</td>
    	                        <td>我目前处于离职状态，可立即上岗</td>
  	                        </tr>
  	                      </tbody>
  	                    </table>
  	                  </div>
  	                </div>

    	              <div>
    	                <div class="grh2">自我评价</div>
    	                <div class="grmain">
    	                  <div><!--{$info.introduction}--></div>
  	                  </div>
  	                </div>

    	              <div>
    	                <div class="grh2">教育经历</div>
    	                <div class="grmain">
							<!--{foreach from=$edus key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->
						</div>
  	                </div>
    	              <div>
    	                <div class="grh2">证书奖励</div>
    	                <div class="grmain"><br />
    	                  <br />
							<!--{foreach from=$ctfs key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->

    	                  <div></div>
    	                  <p><br />
  	                    </p>
  	                  </div>
  	                </div>

    	              <div>
    	                <div class="grh2">工作经历</div>
    	                <div class="grmain"><br />
    	                  <br />
							<!--{foreach from=$works key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->

    	                  <div></div>
    	                  <p><br />
  	                    </p>
  	                  </div>
  	                </div>

    	              <div>
    	                <div class="grh2">语言能力</div>
    	                <div class="grmain">
							<!--{foreach from=$its key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->
						</div>
  	                </div>

  	              </div>
  	            </div>
				</td>
  	          </tr>
  	          </tbody>
  	      </form>
  	    </table>
    	</div>
    </div>
</div>
<script type="text/javascript">
	$("#gerenjl input:button").attr("disabled",'disabled');
</script>
</body>
</html>
