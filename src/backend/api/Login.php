<?php
session_start();

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['user'])||!isset($_GET['pass']))
	{
		//handle error
	}
	else
	{
		$logout = isset($_GET['logout']) ? true : false;

		if(isset($_SESSION))
		{
			if($_SESSION['username'] != null)
			{
				//echo "session's username: " . $_SESSION["username"] . "<br>";
				if($logout == false)
				{
					echo json_encode(array("error"=>"Can't log in twice", "user"=>$_SESSION["username"]));
					return;
				}
			}
		}
		
		$_user=($_GET['user']);
		$_pass=($_GET['pass']);

		if($logout == false)
		{
			$credentials = Login($_user, $_pass);
			if($credentials != null)
			{
				$credentials = $credentials[0];
				echo json_encode(array("success"=>"true","user"=>$credentials["username"]));
				$_SESSION["username"] = $credentials["username"];
			}
			else
			{
				echo "failed to log in. =(";
			}
		}
		else
		{
			if($_SESSION['username'] != null)
			{
				$_SESSION["username"] = null;
				echo "logged out!";
			}
			else
			{
				echo "You can't log out without first being logged in.";
			}
		}

		
	}
}



?>