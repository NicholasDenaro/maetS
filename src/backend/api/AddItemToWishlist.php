<?php

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['username'])||!isset($_GET['iid']))
	{
		//handle error
	}
	else
	{
		$_username=($_GET['username']);
		$_iid=($_GET['iid']);
		echo addItemToWishlist($_username, $_iid);
	}
}



?>