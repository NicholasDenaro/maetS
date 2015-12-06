<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['iid']))
	{
		echo json_encode(array("error"=>"Incorrect parameters."));
	}
	else
	{
		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"must be logged in to add item to wishlist."));
			return;
		}
		$_username = $_SESSION['username'];

		$_iid=($_GET['iid']);
		if(!isset($_GET['remove']))
			echo addItemToWishlist($_username, $_iid);
		else
			echo removeItemFromWishlist($_username, $_iid);
	}
}



?>