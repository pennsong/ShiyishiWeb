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
                                	<li><img src="/images/Icon1.gif" /> 还可发布职位：<a href="/enterp/publish_job/"><span class="red bold"><!--{$pwnum|default:0}--></span></a> 个</li>
                                    <li><a href="/enterp/publish_job/" class="hrindexbutton1"></a></li>
                                </ul>
                            </div>
                        	<div id="hrindex2">
                            	<ul>
                                	<li><img src="/images/Icon1.gif" /> 最近3天简历数：<a href="/enterp/resume/boxlist.html"><span class="red bold"><!--{$rnum|default:0}--></span></a> 份</li>
                                	<li><img src="/images/Icon1.gif" /> 共收到的简历：<a href="/enterp/resume/boxlist.html"><span class="red bold"><!--{$rnumall|default:0}--></span></a> 份</li>
                                    <li><a href="/enterp/resume/boxlist.html" class="hrindexbutton2"></a></li>
                                </ul>
                            </div>
                        	<div id="hrindex3">
                            	<ul>
                                	<li><img src="/images/Icon1.gif" /> 剩余文字简历下载数：<a href="/enterp/contract/"><span class="red bold"><!--{$dwnum|default:0}--></span></a> 份</li>
                                	<li><img src="/images/Icon1.gif" /> 剩余视频简历下载数：<a href="/enterp/contract/"><span class="red bold"><!--{$dvnum|default:0}--></span></a> 份</li>
                                    <li><a href="/enterp/resume/search.html" class="hrindexbutton3"></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    	<div id="hrcenterrightc">
                            <h2>合同信息</h2>
                            <ul>
                                <li><img src="/images/Icon1.gif" /> 您共有 <span class="red"><!--{$cnum}--></span> 份正在执行的合同。服务期至： <!--{$cmaxtime}--></li>
                            </ul>
                            <div class="topmargin10px"></div>
                            <h2>服务热线</h2>
                            <ul>
                                <li><img src="/images/Icon1.gif" /> 电话：400-800-8888</li>
                                <li><img src="/images/Icon1.gif" /> E-mail：123123@123.com</li>
                            </ul>
                            <div class="topmargin10px"></div>
                         </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
        	</div>
<!--{include file="include/footer.tpl"}-->