<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['supplierName']))
	{
		$good = false;
		if(isset($_SESSION))
		{
			if($_SESSION['username']!=null && $_SESSION['supplier'])
			{
				$_userName=($_SESSION['username']);
				echo getSupplier($_userName);
				$good = true;
			}
		}

		if(!$good)
		{
			echo json_encode(array("error"=>"Session expired or not logged in."));
		}
	}
	else
	{
		$_userName=($_GET['supplierName']);
		echo getSupplier($_userName);
	}
}



?>