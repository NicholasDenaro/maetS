<?php
session_start();

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['userName']))
	{
		$good = false;
		if(isset($_SESSION))
		{
			if($_SESSION['username']!=null)
			{
				$_userName=($_SESSION['username']);
				echo getUser($_userName);
				$good = true;
			}
		}

		if(!$good)
		{
			echo json_encode(array("error"=>"Session expired or not logged in."));
			//handle error
			//throw new Exception("userName not set.");
		}
	}
	else
	{
		$_userName=($_GET['userName']);
		echo getUser($_userName);
	}
}



?>