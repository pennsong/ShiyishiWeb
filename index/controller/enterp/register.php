<?php
//招聘
class register_Controller extends Controller{
	
	function init(){
		$this->user = Load::model('e_user');
//		$this->pn = $this->getControllerUName();
//		unset($_COOKIE['sys_cookie_city']);
	}
	
	function indexAction(){
		if(F::islogin("enterp")){
			$this->_header(BASE_URL."/enterp/");
		}
		if($this->_get('email')){
			$this->ajaxmsg($this->user->checkinfo('email',$this->_get('email')) ? 'fail' : 'success');
		}
		if($this->_get('mobile')){
			$this->ajaxmsg($this->user->checkinfo('mobile',$this->_get('mobile')) ? 'fail' : 'success');
		}
		$backurl = $this->_get('r',$_SERVER['HTTP_REFERER']);
		$this->assign('backurl',$backurl);
		$this->assign('img_domain',IMG_DOMAIN);
		$this->assign('pagetitle','企业用户注册');
		$this->display();
	}

	function saveAction(){
		if(F::islogin("enterp")){
			$this->_header(BASE_URL."/enterp/");
		}
		$info = $this->_get('info');
		$info['createtime'] = time();
		$info['lastdate'] = time();
		$info['ip'] = F::onlineip();
		$uploadmodel = Load::lib('upload');
		if($info['dtype'] == 0){
			$uploadmodel->validate_upload_path();
			$save_upload_path = $uploadmodel->upload_path;
			$tmp_upload_path = str_replace("users","tmpimg",$save_upload_path);
			$urls = explode("|||",$info['durl']);
			$tmp = array();
			if(count($urls)){
				foreach($urls as $k => $v){
					$arr = explode("/",$v);
					$name = $arr[count($arr)-1];
					$name1 = str_replace("_80_80","",$name);
					if(file_exists($tmp_upload_path.$name) && file_exists($tmp_upload_path.$name1)){
						if(copy($tmp_upload_path.$name, $save_upload_path.$name) && copy($tmp_upload_path.$name1, $save_upload_path.$name1)){
							$tmp[] = str_replace("tmpimg","users",$v);
						}
					}
				}
				$info['durl'] = implode("|||",$tmp);
			 }else{
				$info['durl'] = '';
			}
		}else{
			$info['durl'] = '';
		}
		unset($tmp);

		if($this->user->save($info) === false){
			$this->showmsg($this->user->getError(),1);
		}else{
			$m = Load::model('smtp');
			$m->sendmail('inviteleader',array('username'=>$info['email'],'email'=>$info['email'], 'ent_reg_name'=>$info['company']));
			$this->display('register_ok.tpl');
		}
	}

	function checkInfo($key,$val){
		$user = $this->user->fetchRow(" ".$key." = '".$val."' ");
		if($user){
			return 'success';
		}else{
			return 'fail';
		}
	}

	function uploadAction(){
		$script = "";
		$up_num = $this->_get('up_num',0);
		$up_image = $this->_get('up_image','');
		if( $up_num < 4){
			if(isset($_FILES['file'])&&$_FILES['file']['size']>0){

				$this->upload = Load::lib('upload');
				//$this->upload->small_imags = array('logo'=>array(192,60));
				//$this->upload->upload_path = "tmpimg";
				$this->upload->upload_path = str_replace("users","tmpimg",$this->upload->upload_path);
				if($this->upload->run('file')){
					$filedata = $this->upload->data();
					$img = "/".$filedata['file_small']['s'];
					if($up_image){
						$up_image .= "|||".$img;
					}else{
						$up_image = $img;
					}
					$list_img = "";
					if($up_image){
						$arr = explode("|||",$up_image);
						foreach($arr as $key => $val){
							$list_img .= '<div class="up_img"><img  src="'.IMG_DOMAIN.$val.'"/><div><a href="javascript:{}" onclick="delupimg('.$key.');">删除</a></div></div>';
						}
					}

					$script = '<script type="text/javascript">document.getElementById("upload").disabled=true;window.parent.document.getElementById("photo").value="'.$up_image.'";';
					if($list_img!=""){
						$script .= 'window.parent.document.getElementById("image_list").innerHTML=\''.$list_img.'\';';
						$script .= 'window.parent.document.getElementById("image_list").style.display="block";';
					}
					$up_num++;
					if($up_num==4){
						$script .= '</script>';
					}else{
						$script .= 'document.getElementById("upload").disabled=false;</script>';
					}

					//exit;
				}else{
					//echo '<script>parent.uploadError("'.$this->upload->display_errors().'");</script>';
				}
			}
		}else{
			$script = '<script type="text/javascript">alert("你好，上传图片数量以达上限！");document.getElementById("upload").disabled=true;</script>';
		}


		$this->assign('up_num',$up_num);
		$this->assign('up_image',$up_image);
		$this->assign('script',$script);
		$this->display('register_upload.tpl');
	}

	function delAction(){
		$i = intval($this->_get('i'));
		$up_image = $this->_get('photo','');

		$arr = explode("|||",$up_image);
		if($i>=0 && count($arr)>=$i && count($arr)>0){
			$link = $arr[$i];
			if(strpos($link,'tmpimg')!==false){
				unset($arr[$i]);
				$up_image = implode("|||",$arr);

				$imgpath = APP_UPLOAD_DIR;
				$filepath = $imgpath.$link;
				if(file_exists($filepath)){
					@unlink($filepath);
				}else{
					echo "0";
					exit;
				}
				$filepath = str_replace("_80_80","",$filepath);
				if(file_exists($filepath)){
					@unlink($filepath);
				}else{
					echo "0";
					exit;
				}
				echo $up_image;
			}else{
				echo "0";
				exit;
			}
		}else{
			echo "0";
			exit;
		}
	}
}
?>
