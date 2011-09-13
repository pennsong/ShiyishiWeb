<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="<!--{$baseurl}-->/styles/reset.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/styles/960_24_col.css" rel="stylesheet" type="text/css" />
<link href="<!--{$baseurl}-->/styles/main.css" rel="stylesheet" type="text/css" />
</head>
<body>
<script type="text/javascript">
function upload(){
	var element = document.getElementById("upload");
	if("\v"=="v") {
		element.onpropertychange = uploadHandle;
	}else{
		 element.addEventListener("change",uploadHandle,false);
	}

	function uploadHandle(){
		if(element.value){
			document.getElementById('uploadform').submit();
		}
	 }
}

</script>

<div id="content" style="overflow:hidden;top:0px;left:0px;">
	<form method="post" name="uploadform" id="uploadform" action="<!--{$pageurl}-->/upload.do" enctype="multipart/form-data" >
	<input name="up_image" id="up_image" type="hidden" value="<!--{$up_image}-->" />
	<input name="up_num" id="up_num" type="hidden" value="<!--{$up_num}-->" />
		<div style=" text-align: left;">
			<input  name="file" type="file"  id="upload" style="background: none repeat scroll 0 0 #F5F7FD;border: 1px solid #B8BFE9;padding: 3px 5px; width: 198px; " />
		</div>
	</form>
</div>
<!--{$script}-->
<script type="text/javascript">
upload();
</script>
</body>
</html>
