<?php

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['category'])||!isset($_GET['phrase']))
	{
		echo json_encode(array("error"=>"incorrect number of arguments."));
	}
	else
	{
		$_category=($_GET['category']);
		$_phrase=($_GET['phrase']);
		echo getItemsByCategoryAndPhrase($_category,$_phrase);
	}
}



?>