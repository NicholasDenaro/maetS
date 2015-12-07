<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	if(!isset($_SESSION['username']) || $_SESSION['username']==null)
	{
		echo json_encode(array("error"=>"must be logged in to add an Address."));
		return;
	}

	$_username = $_SESSION['username'];
	echo getCreditCardByUser($_username);
}



?>