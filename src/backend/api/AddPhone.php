<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['number']))
	{
		echo json_encode(array("error"=>"Incorrect number of parameters."));
	}
	else
	{
		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"must be logged in to add an Address."));
			return;
		}
		$_username = $_SESSION['username'];

		$_number = json_decode($_GET["number"],true);

		if(isset($_GET["remove"]))
		{
			echo removePhoneFromUser($_username,$_number);
		}
		else
		{
			echo addPhoneToUser($_username,$_number);
		}
	}
}



?>