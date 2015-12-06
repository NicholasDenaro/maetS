<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['username']))
	{
		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"Not logged in."));
		}
		else
		{
			$_username=($_SESSION['username']);
			echo getItemsByUser($_username,$_SESSION['supplier']);
		}
	}
	else
	{
		$_username=($_GET['username']);
		echo getItemsByUser($_username,false);
	}
}



?>