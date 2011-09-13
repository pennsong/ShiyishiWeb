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
    	  <table border="0" cellspacing="5" cellpadding="0" width="300" align="center">
    	    <form method="post" name="form1" id="form1" action="/enterp/company/save.do">
			<input value="<!--{$subcompany.id}-->" type="hidden" name="PositionID"/>
    	      <tbody>
    	        <tr>
    	          <td colspan="2"><div  style="border:1px solid #ccc">
    	            <div>

    	              <div>
    	                <div class="grh2">新建分支机构</div>
    	                <div class="grmain">
							机构名称 ：<input name="name" type="text" value="<!--{$subcompany.name}-->" />
						</div>
    	                <div class="grmain">
							<input value="提交"  type="submit" />
						</div>
  	                </div>
  	              </div>
  	            </div></td>
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
