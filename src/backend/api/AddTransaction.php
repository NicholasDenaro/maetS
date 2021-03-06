<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['iid'])||!isset($_GET['creditcard']))
	{
		echo json_encode(array("error"=>"Missing parameter."));
	}
	else
	{
		$_iid=($_GET['iid']);
		$_creditcard=($_GET['creditcard']);

		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"must be logged in to buy item."));
			return;
		}
		$_buyer=($_SESSION['username']);

		if(isset($_SESSION['supplier']) && $_SESSION['supplier'])
		{
			echo json_encode(array("error"=>"Suppliers may not buy items."));
			return;
		}

		if(chargeCard($_creditcard,$_iid))
		{
			echo transaction($_iid,$_buyer);
		}
		else
		{
			echo json_encode(array("error"=>"Unable to charge credit card."));
		}
	}
}



?>