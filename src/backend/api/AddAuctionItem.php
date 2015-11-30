<?php

require_once("ApiLibrary.php");

//Checks if this is running from a request
if(isset($_SERVER['REQUEST_METHOD']) && $_SERVER['REQUEST_METHOD'] === 'GET')
{
	//This checks to see if anything was passed into the parameter userName
	if (!isset($_GET['name'])||!isset($_GET['descr'])||!isset($_GET['location'])||!isset($_GET['seller'])||!isset($_GET['img'])||!isset($_GET['price']))
	{
		//handle error
		echo "error =(";
	}
	else
	{
		$_name=($_GET['name']);
		$_descr=($_GET['descr']);
		$_location=($_GET['location']);
		$_seller=($_GET['seller']);
		$_img=($_GET['img']);
		$_price=($_GET['price']);
		$_keywords=isset($_GET['keywords']) ? $_GET['keywords'] : null;
		$_category=isset($_GET['category']) ? $_GET['category'] : null;
		$result = addAuctionItem($_name, $_descr, $_location, $_seller, $_img, $_price);
		echo $result;

		$res = json_decode($result, true);

		if(isset($res["success"]) && $res["success"])
		{
			addKeywordsToItem($res["iid"], $_keywords);
			addCategoryToItem($res["iid"], $_category);
		}
	}
}



?>