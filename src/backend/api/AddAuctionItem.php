<?php

require_once("ApiLibrary.php");
session_start();

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['name'])||!isset($_GET['descr'])||!isset($_GET['location'])||!isset($_GET['img'])||!isset($_GET['price'])||!isset($_GET['end_date']))
	{
		//handle error
		echo json_encode(array("error"=>"missing parameter."));
	}
	else
	{
		if(!isset($_SESSION['username']) || $_SESSION['username']==null)
		{
			echo json_encode(array("error"=>"must be logged in to auction item."));
			return;
		}
		$_seller = $_SESSION['username'];

		$_name=($_GET['name']);
		$_descr=($_GET['descr']);
		$_location=($_GET['location']);
		$_img=($_GET['img']);
		$_price=($_GET['price']);
		$_end_date=($_GET['end_date']);
		$_keywords=isset($_GET['keywords']) ? $_GET['keywords'] : null;
		$_category=isset($_GET['category']) ? $_GET['category'] : null;
		$result = addAuctionItem($_name, $_descr, $_location, $_img, $_price, $_end_date);
		echo $result;

		$res = json_decode($result, true);
		if(isset($_GET['supplier']))
		{
			//add to supplier_stocked
			addItemToSupplierStocked($res["iid"], $_seller);
		}
		else
		{
			//addd to user_stocked
			addItemToUserStocked($res["iid"], $_seller);
		}

		if(isset($res["success"]) && $res["success"])
		{
			addKeywordsToItem($res["iid"], $_keywords);
			addCategoryToItem($res["iid"], $_category);
		}
	}
}



?>