<?php

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['company'])||!isset($_GET['password'])||!isset($_GET['poc'])||!isset($_GET['phone_number'])||!isset($_GET['address'])||!isset($_GET['category']))
	{
		//handle error
		echo "error =(";
	}
	else
	{
		$_company=($_GET['company']);
		$_password=($_GET['password']);
		$_poc=($_GET['poc']);
		$_phone_number=($_GET['phone_number']);
		$_address=($_GET['address']);
		$_category=($_GET['category']);
		echo addSupplier($_company, $_password, $_poc, $_phone_number, $_address, $_category);
	}
}



?>