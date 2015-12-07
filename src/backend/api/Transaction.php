<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	if(!isset($_GET["username"]))
	{
		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"Not logged in."));
		}
		else
		{
			if(isset($_SESSION['supplier']) && $_SESSION['supplier'])
			{
				$_username=($_SESSION['username']);
				echo json_encode(array("current_user"=>$_username,"items"=>json_decode(getTransactionsBySupplier($_username))));
			}
			else
			{
				$_username=($_SESSION['username']);
				echo json_encode(array("current_user"=>$_username,"items"=>json_decode(getTransactionsByUser($_username))));
			}
		}
	}
	else
	{
		if(isset($_GET['supplier']))
		{
			$_username=($_GET['username']);
			echo json_encode(array("current_user"=>$_username,"items"=>json_decode(getTransactionsBySupplier($_username))));
		}
		else
		{
			$_username=($_GET['username']);
			echo json_encode(array("current_user"=>$_username,"items"=>json_decode(getTransactionsByUser($_username))));
		}
	}
	
}



?>