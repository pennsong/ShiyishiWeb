/**
 * 标签上鼠标移动事件的处理函数
 * @return
 */
function tabonmouseover(obj)
{
  if (obj.className == "tab-back")
  {
    obj.className = "tab-hover";
  }
}

function tabonmouseout(obj)
{
  if (obj.className == "tab-hover")
  {
    obj.className = "tab-back";
  }
}

/**
 * 处理点击标签的事件的函数
 * @param : e  FireFox 事件句柄
 *
 * @return
 */
function tabonclick(obj)
{

    var spans  = document.getElementsByTagName("span");
    for (i = 0; i < spans.length; i ++ )
    {
		var val = spans[i].id.split("_");
		var divid = "perview_"+val[1];
		if(spans[i].id == obj.id){
			document.getElementById(divid).style.display = '';
		}else{
			document.getElementById(divid).style.display = 'none';
		}
    }

    for (i = 0; spans.length; i ++ )
    {
      if (spans[i].className == "tab-front")
      {
        spans[i].className = "tab-back";
        break;
      }
    }

	obj.className = "tab-front";
}
