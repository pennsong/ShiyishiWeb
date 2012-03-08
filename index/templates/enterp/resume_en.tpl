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
		<!--{if true }-->
    	        <tr>
    	          <td></td>
    	          <td style="line-height:180%;"><p>
				  您目前的下载积分余额:<span class="red"><!--{$wordnum}--></span>分。<br />请联系我们的销售人员获得新的下载积分，联系方式如下：
				  </p>
                              <ul class="num">
                                <li><img src="/images/Icon1.gif" /> 电话：010-51316183</li>
                                <li><img src="/images/Icon1.gif" /> E-mail：zhaopin@shiyishi.cn</li>
                            </ul>

				  </td>
  	          </tr>
<!--{/if}-->
			  <!--{if !$rtype || $rtype == 2}-->
    	        <tr> 
    	          <td width="1%" nowrap="nowrap" align="right"></td>
    	          <td><p>下载该求职者的联系方式。</p></td>
  	          </tr>

    	        <tr>
    	          <td> </td>
    	          <td>
					<input value=" 确 定 " type="submit"  onclick="show_confirm_doc()" />
				</td>
  	          </tr>
			  <!--{/if}-->

			  <!--{if $rtype!=3 && $rtype != 2 }-->
				<!--{if $info.video==1 }-->
    	        <tr>
    	          <td nowrap="nowrap" align="right"></td>
    	             <td><p>下载该求职者的视频简历。</p></td>
  				</tr>

    	        <tr>
    	          <td> </td>
    	          <td>
    	            <input value=" 确 定 " type="submit"  onclick="show_confirm_vod()" />
				</tr>
				<!--{/if}-->

			  <!--{/if}-->
				<!--{/if}-->

			   <!--{if !$down}-->
    	        <tr>
    	          <td width="1%" nowrap="nowrap" align="right"></td>
    	          <td><p>保存简历到暂存夹以便稍后查阅确定是否下载。</p></td>
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
    	          <td colspan="2">联系方式：
						<!--{if $rtype == 1 || $rtype == 3}-->
						<!--{$info.phone}--> 
						<!--{$info.email}-->
						<!--{/if}-->
					</td>
   	            </tr>
    	        <tr>
    	          <td colspan="2"><table border="0" cellspacing="0" cellpadding="0" width="600">
    	            <tbody>
    	              <tr>
    	                <td><strong>interested job:<!--{$info.funtype_2_name}--></strong></td>
    	                <td align="right" class="font14px bold">视一视招聘网</td>
  	                </tr>
  	              </tbody>
  	            </table>
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                      <tbody>
                        <tr>
                          <td width="81%">ID:<!--{$info.uid}--></td>
                          <td width="19%"><a href="/enterp/resume/view.html?uid=<!--{$info.uid}-->&t=cn">查看其中文简历</a></td>
                        </tr>
                        <tr>
                          <td colspan="2" style="border:1px solid #ccc"><div align="right">
						  <!--{if $down}--><!--{$info.uname}-->  id no：<!--{$info.idcard}-->  <!--{/if}--><!--{if $info.gender==1}-->male<!--{else}-->female<!--{/if}--> | <!--{$info.age}-->years old | height：<!--{$info.stature}-->CM | weight：<!--{$info.weight}-->KG <br/><br/> live add：<!--{$info.live_gnd_name}--><!--{$info.live_address}--> 
						  </div></td>
                        </tr>
                      </tbody>
                  </table></td>
   	            </tr>
    	        <tr>
    	          <td colspan="2"><div  style="border:1px solid #ccc">
    	            <div>
    	              <div>
    	                <div class="grh2">Career Objective</div>
    	                <div class="grmain">
    	                  <table width="100%" border="0" cellpadding="2" cellspacing="0">
    	                    <tbody>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">desired type of employment：</td>
    	                        <td><!--{$info.jobterm}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">Desired Position：</td>
    	                        <td><!--{$info.funtype_2_name}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td valign="top" nowrap="nowrap" align="right">Desired Industry：</td>
    	                        <td><!--{$info.funtype_1_name}--></td>
  	                        </tr>
    	                      <tr>
    	                        <td nowrap="nowrap" align="right">Desired Working Place：</td>
    	                        <td><!--{$info.work_gnd_name}--></td>
  	                        </tr>
    	                      <tr></tr>
    	                      <tr>
    	                        <td width="1%" nowrap="nowrap" align="right">Working Situation：</td>
    	       	                <td><!--{$info.nowzt}--></td>
  	                        </tr>
  	                      </tbody>
  	                    </table>
  	                  </div>
  	                </div>
					<!--{if $info.introduction}-->
    	              <div>
    	                <div class="grh2">Self-assessment</div>
    	                <div class="grmain">
    	                  <div><!--{$info.introduction}--></div>
  	                  </div>
  	                </div>
					<!--{/if}-->

					<!--{if $edus}-->
    	              <div>
    	                <div class="grh2">education background</div>
    	                <div class="grmain">
							<!--{foreach from=$edus key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->
						</div>
  	                </div>
					<!--{/if}-->

					<!--{if $ctfs}-->
    	              <div>
    	                <div class="grh2">certificate</div>
    	                <div class="grmain">
							<!--{foreach from=$ctfs key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->

    	                  <div></div>
    	                  
  	                  </div>
  	                </div>
					<!--{/if}-->

					<!--{if $works}-->
    	              <div>
    	                <div class="grh2">Working Experience</div>
    	                <div class="grmain">
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
							<!--{foreach from=$works key=key item=item}-->
								<!--{$item}-->
							<!--{/foreach}-->
                          </table>
                          <div></div>
    	                 
  	                  </div>
  	                </div>
					<!--{/if}-->

					<!--{if $langs}-->
					<div>
						<div class="grh2">language skill</div>
						<div class="grmain">
							<!--{foreach from=$langs key=e item=lang}-->
								<!--{$languages[$lang.language]}-->
								reading&writing ability：：<!--{$lang.rwability}-->
								listening&oral ability：<!--{$lang.lsability}-->
								<br />
							<!--{/foreach}-->
						</div>
					</div>
					<!--{/if}-->

					<!--{if $its}-->
					<div>
						<div class="grh2">computer skill</div>
						<div class="grmain">
							<!--{foreach from=$its key=key item=item}-->
								<!--{$item}--><br/>
							<!--{/foreach}-->
						</div>
					</div>
					<!--{/if}-->

					<!--{if $info.interest}-->
					<div>
						<div class="grh2">interests & hobbies</div>
						<div class="grmain">
							<!--{$info.interest}-->
						</div>
					</div>
					<!--{/if}-->

					<!--{if $info.zycourse}-->
					<div>
						<div class="grh2">main courses</div>
						<div class="grmain">
							<!--{$info.zycourse}-->
						</div>
					</div>
					<!--{/if}-->


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
	
	function show_confirm_doc()
	{
	var r=confirm("下载该求职者的联系方式，您的下载积分将被扣除10分，是否继续？");
	if (r==true)
	  {
		$('#type').val('doc');document.forms[0].action='/enterp/resume/down.do';
	  }
	else
	  {
		document.forms[0].action='#';
	  }
	}

	function show_confirm_vod()
	{
	var r=confirm("下载该求职者的视频简历，您的下载积分将被扣除20分，是否继续？");
	if (r==true)
	  {
		$('#type').val('vod');document.forms[0].action='/enterp/resume/down.do';
	  }
	else
	  {
		document.forms[0].action='#';
	  }
	}
</script>
</body>
</html>
