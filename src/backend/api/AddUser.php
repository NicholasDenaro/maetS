<?php

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['username'])||!isset($_GET['password'])||!isset($_GET['name'])||!isset($_GET['income'])||!isset($_GET['gender'])||!isset($_GET['dob'])||!isset($_GET['email'])||!isset($_GET['phone_number'])||!isset($_GET['credit_card'])||!isset($_GET['address']))
	{
		//handle error
		echo "error =(";
	}
	else
	{
		$_username=($_GET['username']);
		$_password=($_GET['password']);
		$_name=($_GET['name']);
		$_income=($_GET['income']);
		$_gender=($_GET['gender']);
		$_dob=($_GET['dob']);
		$_email=($_GET['email']);
		$_phone_number=($_GET['phone_number']);
		$_credit_card=($_GET['credit_card']);
		$_address=($_GET['address']);
		echo addUser($_username, $_password, $_name, $_income, $_gender, $_dob, $_email, $_phone_number, $_credit_card, $_address);
	}
}



?>