<?php
session_start();

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	if(isset($_GET['logout']))
	{
		if(isset($_SESSION['username']) && $_SESSION['username'] != null)
		{
			$_SESSION["username"] = null;
			$_SESSION["supplier"] = null;
			echo json_encode(array("success"=>true,"message"=>"logged out!"));
		}
		else
		{
			echo json_encode(array("error"=>"You can't log out without first being logged in."));
		}

		return;
	}

	//Check if logged in
	if(isset($_GET['check']))
	{
		if(isset($_SESSION['username']) && $_SESSION['username'] != null)
		{
			$supplier = isset($_SESSION['supplier']) ? $_SESSION['supplier'] : false;
			echo json_encode(array("success"=>true,"user"=>$_SESSION['username'],"supplier"=>$supplier));
		}
		else
		{
			echo json_encode(array("error"=>"not logged in."));
		}

		return;
	}

	//Log in

	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['user'])||!isset($_GET['pass']))
	{
		echo json_encode(array("error"=>"Incorrect parameters."));
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
		
		$supplier = false;

		if(isset($_GET['supplier']))
		{
			$supplier = true;
		}

		$_user=($_GET['user']);
		$_pass=($_GET['pass']);

		$credentials = login($_user, $_pass, $supplier);

		if($credentials != null)
		{
			$credentials = $credentials[0];
			if(!$supplier)
			{
				echo json_encode(array("success"=>"true","user"=>$credentials["username"],"supplier"=>$supplier));
				$_SESSION["username"] = $credentials["username"];
			}
			else
			{
				echo json_encode(array("success"=>"true","user"=>$credentials["company_name"],"supplier"=>$supplier));
				$_SESSION["username"] = $credentials["company_name"];
			}
			if($supplier)
				$_SESSION["supplier"] = true;
			else
				$_SESSION["supplier"] = false;

		}
		else
		{
			echo json_encode(array("error"=>"failed to log in. =("));
		}
	}
}



?>