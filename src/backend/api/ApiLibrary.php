<?php
//This file will contain all of the code for the API calls

function GetDatabaseConnection()
//Post: A database connection has been created and returned
{
    $databaseConnection = new mysqli("localhost", "root", "", "431w_proj");
    
    if ($databaseConnection->connect_error)
    {
        ThrowFatalError("Could not connect to database.");
    }
    return $databaseConnection;
} // END GetDatabaseConnection

//This function will get all of a users addresses when given their username
function getAddressesByUser( $userName )
{
	//query creation
	$loc_addressQuery = "SELECT * FROM Loc_Addresses A WHERE A.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$loc_addressResult = $databaseConnection->query($loc_addressQuery);

	//format output
	echo json_encode($loc_addressResult);
	return "I'm all of the addresses for the user ".$userName;
}

//This function will return all of the data associated with an aution item when given its id
function getAuctionItem( $itemId )
{
	//query creation
	$auc_itemQuery = "SELECT * FROM Auction_Item A WHERE A.iid = " . $itemId;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$auc_itemResult = $databaseConnection->query($auc_itemQuery);

	//format output
	echo json_encode($auc_itemResult);
	return "I'm information for the auction item ".$itemId;
}

//This function will return the category of an item when given its id
function getCategoryByItem( $itemId )
{
	//query creation
	$categoryQuery = "SELECT * FROM Category C WHERE C.iid = " . $itemId;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$categoryResult = $databaseConnection->query($categoryQuery);
	
	//format output
	echo json_encode($categoryResult);
	return "I'm a category for the item ".$itemId;
}

//This function will return all credit cards of a user when supplied with a username
function getCreditCardByUser( $userName )
{
	//query creation
	$credit_cardQuery = "SELECT * FROM Cash_Credit_Card C WHERE C.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$credit_cardResult = $databaseConnection->query($credit_cardQuery);
	
	//format output
	echo json_encode($credit_cardResult);
	return "I'm all of the credit cards for the user ".$userName;
}

//This function will return all of the phone numbers of a user when supplied with a username
function getPhoneNumberByUser( $userName )
{
	//query creation
	$phone_numQuery = "SELECT * FROM Cont_Phone P WHERE P.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$phone_numResult = $databaseConnection->query($phone_numQuery);

	//format output
	echo json_encode($phone_numResult);
	return "I'm all of the phone number for the user ".$userName;
}

//This function will return a sale items information when given its id
function getSaleItem( $itemId )
{
	//query creation
	$sale_itemQuery = "SELECT * FROM Sale_Item S WHERE S.iid = " . $itemId;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$sale_itemResult = $databaseConnection->query($sale_itemQuery);

	//format output
	echo json_encode($sale_itemResult);
	return "I'm the information for the sale item ".$itemId;
}

//This function will return all items associated with a keyword when supplied with a keyword
function getItemsByKeyword( $keyword )
{
	//query creation
	$search_keyQuery = "SELECT * FROM Search_Key S WHERE S.kid = " . $keyword;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$search_keyResult = $databaseConnection->query($search_keyQuery);

	//format output
	echo json_encode($search_keyResult);
	return "I'm all of the items that have the keyword ".$keyword;
}

//This function will return the shop information of a user when supplied with a user name
function getShopByUser( $userName )
{
	//query creation
	$shopQuery = "SELECT * FROM Runs_Shop S WHERE S.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$shopResult = $databaseConnection->query($shopQuery);

	//format output
	echo json_encode($shopResult);
	return "I'm the shop information for the user ".$userName;
}

//This function will return the information for a supplier
function getSupplier( $supplierName )
{
	//query creation
	$supplierQuery = "SELECT * FROM Supplier_Stocked S WHERE S.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConection();
	$supplierResult = $databaseConnection->query($supplierQuery);

	//format output
	echo json_encode($supplierResult);
	return "I'm the information for the supplier ".$supplierName;
}

//This function will return the list of items stocked by a supplier when supplied with a supplier name
function getStockedBySupplier( $supplierName )
{
	//query creation
	$supplier_stockQuery = "SELECT * FROM Supplier_Stocked S WHERE S.username = " . $supplierName;
	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplier_stockResult = $databaseConnection->query($supplier_stockQuery);
	//format output
	
	echo json_encode($supplier_stockQuery);
	return "I'm the items stocked by the supplier ".$supplierName;
}

//This function will return all of the transactions of a supplier when supplied with a supplier name
function getSoldBySupplier( $supplierName )
{
	//query creation
	$supplier_transQuery = "SELECT * FROM Supplier_Trans S WHERE S.username = " .$supplierName;
	
	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplier_transResult = $databaseConnection->query($supplier_transQuery);

	//format output
	echo json_encode($supplier_transResult);
	return "I'm all of the transactions of supplier ".$supplierName;
}

//This function will return all of the information about a user when supplied with a user name
function getUser( $userName )
{
	//query creation
	//Use "LIKE" because then we can pattern match.
	$userQuery = "SELECT * FROM Usr U WHERE U.username LIKE '" . $userName . "'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	//If there are not results then stop.
	if($userResult === false)
	{
		return "No results for '".$userName."'";
	}

	//Loop through the results and add each row to an array.
	$output = array();
	while($row = $userResult->fetch_assoc())
	{
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return all of the items stocked by a user when supplied with a user name
function getStockedByUser( $userName )
{
	//query creation
	$user_stockedQuery = "SELECT * FROM User_Stocked U WHERE U.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$user_stockedResult = $databaseConnection->query($user_stockedQuery);

	//format output
	echo json_encode($user_stockedResult);
	return "I'm all of the items stocked by the user ".$userName;
}

//This function will return all of the transactions of a user when supplied with a user name
function getSoldByUser( $userName )
{
	//query creation
	$user_transQuery = "SELECT * FROM User_Transaction U WHERE U.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$user_tranResult = $databaseConnection->query($user_tyransQuery);

	//format output
	echo json_encode($user_tranResult);
	return "I'm all of the transactions of the user ".$userName;
}

//This function will return the wishlist of a user when supplied with a user name
function getWishedByUser( $userName )
{
	//query creation
	$wish_listQuery = "SELECT * FROM Whishes_For W WHERE W.username = " . $userName;

	//query database
	$databaseConnection = GetDatabaseConnection();
	$wish_listResult = $databaseConnection->query($wish_listQuery);

	//format output
	echo json_encode($wish_listResult);
	return "I'm all of the items on the wishlist of the user ".$userName;
}

?>