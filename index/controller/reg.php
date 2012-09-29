<?php
class reg_Controller extends Controller
{
	function indexAction()
	{
		/**
		 * Flash 10 Video Conference Server page.
		 *
		 * This page will foster registration for the Video connection
		 * with the Adobe Stratus beta.
		 */
		/**
		 * $host, $user, $pass, $dbname for my mysql connection
		 * are located within this file, you can just declare those vars here for the mysql_connect() method
		 */
		$host = '127.0.0.1';
		$user = 'root';
		$pass = 'tcltcl';
		$dbname = 'shiyishi';
		// lets grab the variables from the URL
		/**
		 * vars in query string
		 */
		$userId = strtolower(trim($_GET['userId']));
		//userRole: talent, company
		$userRole = strtolower(trim($_GET['userRole']));
		//taskType: regist, reflash, callFriend, getFriendList
		$taskType = strtolower(trim($_GET['taskType']));
		$identity = trim($_GET['identity']);
		//friends = friend identity
		$friendIdentity = strtolower(trim($_GET['friendIdentity']));
		$hosterId = "'".$_GET['hosterId']."'";
		$attenderId = "'".$_GET['attenderId']."'";
		$inviteCode = trim($_GET['inviteCode']);
		$thirdPartyName = "'".$_GET['thirdPartyName']."'";
		$thirdPartyIdentity = "'".$_GET['thirdPartyIdentity']."'";
		$thirdPartyRoom = "'".$_GET['thirdPartyRoom']."'";
		$heartBeatId = "'".$_GET['heartBeatId']."'";
		// start the response
		$msg = "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
		$msg .= "<result>";
		$sql = "";
		// first lets check to see if a "user" has been passed,
		// if so, we need to first check to see if this exists
		// and if so, update the identity, or create a new record...
		/**
		 * userId passed in
		 *
		 * If we are passed a userId, this is a first time attempt
		 * to connect as that user.  If the userId exists in the database
		 * then we can UPDATE the record's "identity" to match the returned
		 * identity of the Adobe Stratus beta.
		 */
		if ($taskType == 'regist')
		{
			if ($userId != "" && ($userRole == "talent" || $userRole == "company") && $identity != "")
			{
				// first lets check to see if this exists....
				$db = mysql_connect($host, $user, $pass) or die('<regist>false1</regist>');
				mysql_query("set names 'utf8'");
				mysql_select_db($dbname);
				//get userName
				if ($userRole == "talent")
				{
					$sql = "SELECT username as username FROM zp_user WHERE id = $userId";
				}
				else if ($userRole == "company")
				{
					$sql = "SELECT company as username FROM zp_e_user WHERE id = $userId";
				}
				else
				{
					//none operation
				}
				$res = mysql_query($sql) or die(mysql_error());
				if (mysql_num_rows($res) > 0)
				{
					$row = mysql_fetch_assoc($res);
					$userName = $row['username'];
				}
				else
				{
					$msg .= "<regist>false1.5</regist>";
					$msg .= "</result>";
					echo $msg;
					return;
				}
				// query to check for the userId existence
				$sql = "SELECT * FROM `registrations` WHERE userId = '".$userId."' AND userRole = '".$userRole."'";
				$res = mysql_query($sql) or die(mysql_error());
				if (mysql_num_rows($res) > 0)
				{
					// lets do an update
					$sql = "UPDATE `registrations` SET userName = '".$userName."', identity = '".$identity."', updatetime = NOW() WHERE userId = '".$userId."' AND userRole = '".$userRole."'";
				}
				else
				{
					// lets do an insert
					$sql = "INSERT INTO `registrations` (userId, userName, userRole, identity, updatetime) VALUES('".$userId."','".$userName."','".$userRole."','".$identity."',NOW())";
				}
				$res = mysql_query($sql);
				if ($res)
				{
					$msg .= "<regist>true</regist>";
				}
				else
				{
					$msg .= "<regist>false2</regist>";
				}
			}
			else
			{
				$msg .= "<regist>false3</regist>";
			}
		}
		else if ($taskType == 'reflash')
		{
			if ($identity != "")
			{
				// first lets check to see if this exists....
				$db = mysql_connect($host, $user, $pass) or die('<reflash>false1</reflash>');
				mysql_query("set names 'utf8'");
				mysql_select_db($dbname);
				// query to check for the userId existence
				$sql = "SELECT * FROM `registrations` WHERE identity = '".$identity."'";
				$res = mysql_query($sql) or die(mysql_error());
				if (mysql_num_rows($res) > 0)
				{
					// lets do an time reflash
					$sql = "UPDATE `registrations` SET updatetime = NOW() WHERE identity = '".$identity."'";
				}
				else
				{
					$msg .= "<reflash>false2</reflash>";
					$msg .= "</result>";
					echo $msg;
					return;
				}
				$res = mysql_query($sql);
				if ($res)
				{
					$msg .= "<reflash>true</reflash>";
				}
				else
				{
					$msg .= "<reflash>false3</reflash>";
				}
			}
			else
			{
				$msg .= "<reflash>false4</reflash>";
			}
		}
		else if ($taskType == 'callfriend')
		{
			if ($friendIdentity != "")
			{
				// first lets check to see if this exists....
				$db = mysql_connect($host, $user, $pass) or die('<callFriend>false</callFriend>');
				mysql_query("set names 'utf8'");
				mysql_select_db($dbname);
				// query to check for the userId existence
				$sql = "SELECT * FROM `registrations` WHERE identity = '".$friendIdentity."'";
				$res = mysql_query($sql) or die(mysql_error());
				if (mysql_num_rows($res) > 0)
				{
					$row = mysql_fetch_assoc($res);
					$msg .= "<callFriend>";
					$msg .= "<userId>".$row['userId']."</userId>";
					$msg .= "<userName>".$row['userName']."</userName>";
					$msg .= "<userRole>".$row['userRole']."</userRole>";
					$msg .= "<identity>".$row['identity']."</identity>";
					$msg .= "</callFriend>";
				}
				else
				{
					$msg .= "<callFriend>false1</callFriend>";
				}
			}
			else
			{
				$msg .= "<callFriend>false2</callFriend>";
			}
		}
		else if ($taskType == 'getfriendlist')
		{
			if ($userId != "" && ($userRole === "talent" || $userRole === "company"))
			{
				$msg .= "<getFriendList>";
				// first lets check to see if this exists....
				$db = mysql_connect($host, $user, $pass) or die('<update>false1</update>');
				mysql_query("set names 'utf8'");
				mysql_select_db($dbname);
				$curTime = time();
				if ($userRole == 'talent')
				{
					//sql for talent
					$sql .= " SELECT";
					$sql .= " 	b.cid userId, d.userName userName, d.identity";
					$sql .= " FROM";
					$sql .= " 		zp_app_person_interview a";
					$sql .= " 	JOIN";
					$sql .= " 		zp_app_video_interview b";
					$sql .= " 	JOIN";
					$sql .= " 		zp_e_user c";
					$sql .= " 	JOIN";
					$sql .= " 		registrations d";
					$sql .= " 	ON";
					$sql .= " 		a.aid = b.id";
					$sql .= " 	AND";
					$sql .= " 		b.cid = c.id";
					$sql .= " 	AND";
					$sql .= " 		d.userId = c.id";
					$sql .= " 	AND";
					$sql .= " 		d.userRole = 'company'";
					$sql .= " WHERE";
					$sql .= " 		a.uid = $userId";
					$sql .= " 	AND";
					$sql .= " 		a.status = 1";
					$sql .= " 	AND";
					$sql .= " 		a.starttime < ($curTime + 1200)";
					$sql .= " 	AND";
					$sql .= " 		(a.endtime + 1200) > $curTime";
					$sql .= " 	AND";
					$sql .= " 		$curTime - UNIX_TIMESTAMP(d.updatetime) < 10";
				}
				else if ($userRole == 'company')
				{
					//sql for company
					$sql .= " SELECT";
					$sql .= " 	b.uid userId, c.userName userName, c.identity";
					$sql .= " FROM";
					$sql .= " 		zp_app_video_interview a";
					$sql .= " 	JOIN";
					$sql .= " 		zp_app_person_interview b";
					$sql .= " 	JOIN";
					$sql .= " 		registrations c";
					$sql .= " 	JOIN";
					$sql .= " 		zp_user d";
					$sql .= " 	ON";
					$sql .= " 		a.id = b.aid";
					$sql .= " 	AND";
					$sql .= " 		b.uid = c.userId";
					$sql .= " 	AND";
					$sql .= " 		c.userRole = 'talent'";
					$sql .= " 	AND";
					$sql .= " 		b.uid = d.id";
					$sql .= " WHERE";
					$sql .= " 		a.cid = $userId";
					$sql .= " 	AND";
					$sql .= " 		a.status = 1";
					$sql .= " 	AND";
					$sql .= " 		b.starttime < ($curTime + 1200)";
					$sql .= " 	AND";
					$sql .= " 		(b.endtime + 1200) > $curTime";
					$sql .= " 	AND";
					$sql .= " 		$curTime - UNIX_TIMESTAMP(c.updatetime) < 10";
				}
				else
				{
					//none operation
				}
				$res = mysql_query($sql) or die(mysql_error());
				if (mysql_num_rows($res) > 0)
				{
					while ($row = mysql_fetch_assoc($res))
					{
						$msg .= "<user>";
						$msg .= "<userId>".$row['userId']."</userId>";
						$msg .= "<userName>".$row['userName']."</userName>";
						$msg .= "<identity>".$row['identity']."</identity>";
						$msg .= "</user>";
					}
				}
				else
				{
					$msg .= "<user>";
					$msg .= "</user>";
				}
				$msg .= "</getFriendList>";
			}
			else
			{
				$msg .= "<getFriendList>false2</getFriendList>";
			}
		}
		else if ($taskType == 'invitecode')
		{
			if (strlen($hosterId) == 66 && strlen($attenderId) == 66)
			{
				$msg .= "<inviteCode>";
				// first lets check to see if this exists....
				$db = mysql_connect($host, $user, $pass) or die('false1');
				mysql_query("set names 'utf8'");
				mysql_select_db($dbname);
				$password = "'".substr(md5($hosterId.$attenderId), 0, 4)."'";
				echo $password;
				$sql = "INSERT INTO videoInterview (hoster, attender, password) VALUES($hosterId, $attenderId, $password)";
				if (mysql_query($sql))
				{
					$msg .= substr($password, 1, 4)."_".mysql_insert_id();
				}
				else
				{
					$msg .= "false2";
				}
				$msg .= "</inviteCode>";
			}
			else
			{
				$msg .= "<inviteCode>false3</inviteCode>";
			}
		}
		else if ($taskType == 'regthirdparty')
		{
			$db = mysql_connect($host, $user, $pass) or die('false1');
			mysql_query("set names 'utf8'");
			mysql_select_db($dbname);
			$sql = "INSERT INTO third_party(`videoInterview`, `username`, `identity`, `updatetime`) VALUES ($thirdPartyRoom, $thirdPartyName, $thirdPartyIdentity, now())";
			$res = mysql_query($sql);
			if ($res)
			{
				$msg .= mysql_insert_id();
			}
			else
			{
				$msg .= "false";
			}
		}
		else if ($taskType == 'thirdpartyheartbeat')
		{
			$db = mysql_connect($host, $user, $pass) or die('false1');
			mysql_query("set names 'utf8'");
			mysql_select_db($dbname);
			$sql = "UPDATE third_party SET updatetime = now() WHERE id = $heartBeatId";
			$res = mysql_query($sql);
			if ($res)
			{
				$msg .= "true";
			}
			else
			{
				$msg .= "false";
			}
		}
		else if ($taskType == 'getthirdpartylist')
		{
			$db = mysql_connect($host, $user, $pass) or die('false1');
			mysql_query("set names 'utf8'");
			mysql_select_db($dbname);
			$sql = "SELECT username FROM third_party WHERE updatetime > now() - 20";
			$res = mysql_query($sql);
			$msg .= "<user>";
			$msg .= "<userName>所有</userName>";
			$msg .= "</user>";
			$msg .= "<user>";
			$msg .= "<userName>主考官</userName>";
			$msg .= "</user>";
			if (mysql_num_rows($res) > 0)
			{
				while ($row = mysql_fetch_assoc($res))
				{
					$msg .= "<user>";
					$msg .= "<userName>".$row['username']."</userName>";
					$msg .= "</user>";
				}
			}
			else
			{
			}
			mysql_free_result($res);
		}
		else if ($taskType == 'join')
		{
			// first lets check to see if this exists....
			$db = mysql_connect($host, $user, $pass) or die('false1');
			mysql_query("set names 'utf8'");
			mysql_select_db($dbname);
			if (strrpos($inviteCode, '_') === FALSE)
			{
				$msg .= "<talentId>false</talentId>";
				$msg .= "<companyId>false</companyId>";
			}
			else
			{
				$tmpInviteCode = explode(_, $inviteCode);
				$sql = "SELECT hoster, attender FROM videoInterview WHERE id=$tmpInviteCode[1] AND password='".$tmpInviteCode[0]."'";
				$res = mysql_query($sql) or die(mysql_error());
				if (mysql_num_rows($res) > 0)
				{
					$row = mysql_fetch_assoc($res);
					$talentId = $row['attender'];
					$companyId = $row['hoster'];
					$msg .= "<talentId>".$talentId."</talentId>";
					$msg .= "<companyId>".$companyId."</companyId>";
				}
				else
				{
					$msg .= "<talentId>false</talentId>";
					$msg .= "<companyId>false</companyId>";
				}
			}
		}
		$msg .= "</result>";
		echo $msg;
	}

}

/*end file*/
