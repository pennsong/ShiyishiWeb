<?php
class editor_Lib
{
	var $Height = 260;
	var $Width = 550;
	var $id = 'content';

	function __construct($id='content',$w='700',$h='260') {
		$this->id = $id;
		$this->Width = $w;
		$this->Height = $h;
	}
	
	function editor ($id='content',$w='700',$h='260') { 
		$this->id = $id;
		$this->Width = $w;
		$this->Height = $h;
	}

	function create ($text = '',$tool = 'full',$upimgext = 'jpg,jpeg,gif,png',$other='') { 
		//Separator：分隔符 BtnBr：强制换行 Cut：剪切 Copy：复制 Paste：粘贴 Pastetext：文本粘贴 Blocktag：段落标签 Fontface：字体 FontSize：字体大小 Bold：粗体 Italic：斜体 Underline：下划线 Strikethrough：中划线 FontColor：字体颜色 BackColor：字体背景色 SelectAll：全选 Removeformat：删除文字格式 Align：对齐 List：列表 Outdent：减少缩进 Indent：增加缩进 Link：超链接 Unlink：删除链接 Img：图片 Flash：Flash动画 Media：Windows media player视频 Emot：表情 Table：表格 Source：切换源代码模式 Print：打印 Fullscreen：切换全屏模式 
		$appmodel = str_replace(array('/','\\'),'',APP_MODUL_NAME);
		$uploadurl = $appmodel == 'admin' ? 'http://admin'.WEB_DOMAIN.'/admin/uploadeditor.do' : BASE_URL.'/uploadeditor.do';
		if($appmodel == 'admin'){
			$editorhtml = '<script src="/xheditor/xheditor-zh-cn.min.js" type="text/javascript"></script>
			<script type="text/javascript">
			$(pageInit);
			function pageInit(){
			$("#'.$this->id.'").xheditor({tools:"'.$tool.'",skin:"default",upImgUrl:"'.$uploadurl.'",upImgExt:"'.$upimgext.'"'.($other ? ','.$other : '').'});
			}
			</script>
			<textarea id="'.$this->id.'" name="'.$this->id.'" style="width: '.$this->Width.'px;height: '.$this->Height.'px">'.$text.'</textarea>';
		}else{
			$editorhtml = '<script src="/xheditor/xheditor-zh-cn.min.js" type="text/javascript"></script>
			<script type="text/javascript">
			$(pageInit);
			function pageInit(){
			$("#'.$this->id.'").xheditor({tools:"BtnBr,Cut,Copy,Paste,Pastetext,Blocktag,Fontface,FontSize,Bold,Italic,Underline,Strikethrough,FontColor,BackColor,SelectAll,Removeformat,Align,List,Outdent,Indent,Link,Unlink",skin:"default",upImgUrl:"'.$uploadurl.'",upImgExt:"'.$upimgext.'"'.($other ? ','.$other : '').'});
			}
			</script>
			<textarea id="'.$this->id.'" name="'.$this->id.'" style="width: '.$this->Width.'px;height: '.$this->Height.'px">'.$text.'</textarea>';
		}
		return $editorhtml;
	}
}
?>