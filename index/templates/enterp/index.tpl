<!--{include file="include/header.tpl"}-->
		<div id="content" class="container_24">
        	<div class="grid_24">
            	<div id="hrcenter">
                 	<!--{include file="login_club.tpl"}-->
                	<!--{include file="left_menu.tpl"}-->
                    <div id="hrcenterright">
                    	<div id="hrindex">
                        	<div id="hrindex1">
                            	<ul>
                                	<li><img src="/images/Icon1.gif" /> 正在发布职位：<a href="/enterp/publish_job/list.html"><span class="red bold"><!--{$jnum|default:0}--></span></a> 个</li>
                                	<li>&nbsp;</li>
                                    <li><a href="/enterp/publish_job/" class="hrindexbutton1"></a></li>
                                </ul>
                            </div>
                        	<div id="hrindex2">
                            	<ul>
                                	<li><img src="/images/Icon1.gif" /> 今日更新简历：<a href="/enterp/resume/boxlist.html"><span class="red bold"><!--{$rnum|default:0}--></span></a> 份</li>
                                	<li><img src="/images/Icon1.gif" /> 总简历数：<a href="/enterp/resume/boxlist.html"><span class="red bold"><!--{$rnumall|default:0}--></span></a> 份</li>
                                    <li><a href="/enterp/resume/boxlist.html" class="hrindexbutton2"></a></li>
                                </ul>
                            </div>
                        	<div id="hrindex3">
                            	<ul>
                                	<li><img src="/images/Icon1.gif" /> 剩余下载积分：<a href="/enterp/contract/"><span class="red bold"><!--{$dwnum|default:0}--></span></a> 分</li>
                                	<li>&nbsp;</li>
                                    <li><a href="/enterp/resume/search.html" class="hrindexbutton3"></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    	<div id="hrcenterrightc" style="padding:15px 10px 0 10px;">
							
                            <h2 style="line-height:180%;">您如需下载求职者的联系方式及视频简历，请与本网站客服人员联系获得下载额度。<br>联系方式：电话：010-51316156
                                                                       邮件：<span style="font-size:15pt; border-bottom-style:hidden;">zhaopin@shiyishi.cn</span></h2>
                            </div>
                    	<div id="hrcenterrightc">
							
                            <h2>合同信息</h2>
                            <ul>
                                <li><img src="/images/Icon1.gif" /> 您共有 <a href="/enterp/contract/" style="text-decoration: none;"><span class="red"><!--{$cnum}--></span></a> 份正在执行的合同。<!--{if $cnum}-->服务期至： <!--{$cmaxtime}--><!--{/if}--></li>
                            </ul>
							
                            <div class="topmargin10px"></div>
                            <h2>服务热线 </h2>
                            <ul class="num">
                                <li><img src="/images/Icon1.gif" /> 电话：010-51316156</li>
                                <li><img src="/images/Icon1.gif" /> E-mail：zhaopin@shiyishi.cn</li>
                            </ul>
                            <div class="topmargin10px"></div>
                         </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
        	</div>
<!--{include file="include/footer.tpl"}-->