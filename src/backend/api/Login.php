<?php
session_start();

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	if(isset($_GET['logout']))
	{
		if($_SESSION['username'] != null)
		{
			$_SESSION["username"] = null;
			echo json_encode(array("success"=>true,"message"=>"logged out!"));
		}
		else
		{
			echo json_encode(array("error"=>"You can't log out without first being logged in."));
		}

		return;
	}

	if(isset($_GET['check']))
	{
		if($_SESSION['username'] != null)
		{
			echo json_encode(array("success"=>true,"user"=>$_SESSION['username']));
		}
		else
		{
			echo json_encode(array("error"=>"not logged in."));
		}

		return;
	}

	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['user'])||!isset($_GET['pass']))
	{
		//handle error
	}
	else
	{
		if(isset($_SESSION))
		{
			if(isset($_SESSION['username']) && $_SESSION['username'] != null)
			{
				echo json_encode(array("error"=>"Can't log in twice", "user"=>$_SESSION["username"]));
				return;
			}
		}
		
		$_user=($_GET['user']);
		$_pass=($_GET['pass']);

		$credentials = Login($_user, $_pass);
		if($credentials != null)
		{
			$credentials = $credentials[0];
			echo json_encode(array("success"=>"true","user"=>$credentials["username"]));
			$_SESSION["username"] = $credentials["username"];
		}
		else
		{
			echo json_encode(array("error"=>"failed to log in. =("));
		}
	}
}



?>