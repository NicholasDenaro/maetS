<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['iid']))
	{
		echo json_encode(array("error"=>"Not logged in."));
	}
	else
	{
		$_iid=($_GET['iid']);
		echo getSellerByItem($_iid);
	}
}



?>