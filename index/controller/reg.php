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
				mysql_select_db($dbname);
				//get userName
				if ($userRole == "talent")
				{
					$sql = "SELECT email as username FROM zp_user WHERE id = $userId";
				}
				else if ($userRole == "company")
				{
					$sql = "SELECT username FROM zp_e_user WHERE id = $userId";
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
				mysql_select_db($dbname);
				$curTime = time();
				if ($userRole == 'talent')
				{
					//sql for talent
					$sql .= " SELECT";
					$sql .= " 	b.cid userId, c.username userName, d.identity";
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
					$sql .= " 	b.uid userId, d.email userName, c.identity";
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
		$msg .= "</result>";
		echo $msg;
	}

}

/*end file*/
