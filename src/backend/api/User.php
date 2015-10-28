<?php

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['userName']))
	{
		//handle error
		throw new Exception("userName not set.");
	}
	else
	{
		$_userName=($_GET['userName']);
		echo getUser($_userName);
	}
}



?>