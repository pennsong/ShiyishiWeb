<?php
/****
* SMTP 邮件发送类
*/
class smtp_Model extends Model{
	
	function init(){
		$this->smtp = Load::Lib('smtp');
		$this->conf = Load::conf('conf');
		$this->mailtask = Load::Model('mailtask');
		$this->mailtemplate = Load::Model('mailtemplate');
		//$this->user = Load::Model('user');
		//$this->maillog = Load::Model('maillog');
	}

	/***
	* 发送函数 
	* @parm 发送参数 @taskaction 行为[reg,order,paid,auto] @taskid 任务ID @data数组格式 暂不支持
	*/
	function sendmail($taskaction='auto',$data=array()){
		$taskactions = array_keys($this->conf['taskaction']);
		if(!in_array($taskaction,$taskactions))$taskaction='auto';
		if(!in_array($taskaction,array('auto','once'))){
			$wand = " AND sendfrequency=0";
			if($taskinfo = $this->mailtask->fetchRow("action='{$taskaction}'".$wand)){
				$mailinfo = $this->mailtemplate->find($taskinfo['templateid']);
				$taskid = $taskinfo['id'];
				if($taskinfo['sendfrequency']!=1){
					if(!empty($data)){
						$mInfo['subject'] = $this->formatmailinfo($mailinfo['mailsubject'],$data);
						$mInfo['content'] = $this->formatmailinfo($mailinfo['mailcontent'],$data);
						$mInfo['to'] = $data['email'];
						$mInfo['toName'] = $data['username'];
						if($this->sendMessage($mInfo)){
							return 'success';
						}
					}
				}else{
					$msg = $this->sendTaskID($taskinfo,$mailinfo);
					//$this->maillog->save(array('taskid'=>$taskinfo['id'],'taskname'=>$taskinfo['taskname'],'sendmsg'=>$msg));
					echo date("Y-m-d H:i:s").' '.$msg."\n";
				}
			}else{
				return false;
			}
		}
	}

	function sendMessage($mailinfo){
		$res = $this->smtp->sendmail($mailinfo['to'], "arlicn@126.com", $mailinfo['subject'], $mailinfo['content'], "HTML"); 
		return $res;
	}

	function formatmailinfo($str=null,$data=array()){
		if(!$str)return '';
		$str = str_replace('{邮件}',$data['email'],$str);
		if(isset($data['username'])) $str = str_replace('{姓名}',$data['username'],$str);
		if(isset($data['passwd'])) $str = str_replace('{密码}',$data['passwd'],$str);
		if(isset($data['url'])) $str = str_replace('{网址}',$data['url'],$str);
		return $str;
	}
}
?>