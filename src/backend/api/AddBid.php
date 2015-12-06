<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['iid'])||!isset($_GET['bid']))
	{
		//handle error
	}
	else
	{
		$_iid=($_GET['iid']);
		$_bid=($_GET['bid']);

		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"must be logged in to buy item."));
			return;
		}
		$_buyer=($_SESSION['username']);

		if($_SESSION['supplier'])
		{
			echo json_encode(array("error"=>"Suppliers may not bid on items."));
			return;
		}

		echo bid($_iid,$_buyer,$_bid);
	}
}



?>