<?php

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['supplierName']))
	{
		//handle error
	}
	else
	{
		$_supplierName=($_GET['supplierName']);
		getSoldBySupplier($_supplierName);
	}
}



?>