<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['iid']))
	{
		//handle error
	}
	else
	{
		$_iid=($_GET['iid']);

		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"must be logged in to buy item."));
			return;
		}
		$_buyer=($_SESSION['username']);

		echo transaction($_iid,$_buyer);
	}
}



?>