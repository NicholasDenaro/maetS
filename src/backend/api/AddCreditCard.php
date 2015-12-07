<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['card']))
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

		try
		{
			$_card = json_decode($_GET["card"],true);
		}
		catch(Exception $e)
		{
			echo json_encode(array("error"=>"Credit Card improperly formatted."));
			return;
		}

		if(isset($_GET["remove"]))
		{
			echo removeCreditCardFromUser($_username,$_card);
		}
		else
		{
			echo addCreditCardToUser($_username,$_card);
		}
	}
}



?>