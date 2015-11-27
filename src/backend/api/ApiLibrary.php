<?php
//This file will contain all of the code for the API calls

function GetDatabaseConnection()
//Post: A database connection has been created and returned
{
    $databaseConnection = new mysqli("localhost", "root", "", "431w_proj");
    mysqli_set_charset($databaseConnection,"utf8");
    
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
	$loc_addressQuery = "SELECT * FROM Loc_Addresses A WHERE A.username LIKE '".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$loc_addressResult = $databaseConnection->query($loc_addressQuery);

	//If no results then stop
	if($loc_addressResult == false){
		return "No results for '".$userName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $loc_addressResult->fetch_assoc()){
		array_push($output, $row);
	}

	//format output
	return json_encode($output);
}

//This function will return all of the data associated with an aution item when given its id
function getAuctionItem( $itemId )
{
	//query creation
	$auc_itemQuery = "SELECT * FROM Auction_Item NATURAL JOIN Item WHERE iid LIKE '".$itemId."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$auc_itemResult = $databaseConnection->query($auc_itemQuery);

	//If no results then stop
	if($auc_itemResult == false){
		return "No results for '".$itemId."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $auc_itemResult->fetch_assoc()){
		array_push($output, $row);
	}

	//format output
	return json_encode($output);
}

//This function will return the category of an item when given its id
function getCategoryByItem( $itemId )
{
	//query creation
	$categoryQuery = "SELECT * FROM Categorized C WHERE C.iid LIKE '".$itemId."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$categoryResult = $databaseConnection->query($categoryQuery);

	//If no results then stop
	if($categoryResult == false){
		return "No results for '".$itemId."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $categoryResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

function getChildrenCategories( $catId )
{
	//query creation
	$categoryQuery = "SELECT * FROM Category C1 NATURAL JOIN Connected_To, Category C2 WHERE mcid = C2.cid AND C1.cid = '".$catId."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$categoryResult = $databaseConnection->query($categoryQuery);

	//If no results then stop
	if($categoryResult == false){
		return "No results for '".$catId."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $categoryResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return all credit cards of a user when supplied with a username
function getCreditCardByUser( $userName )
{
	//query creation
	$credit_cardQuery = "SELECT * FROM Cash_Credit_Card C WHERE C.username LIKE '".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$credit_cardResult = $databaseConnection->query($credit_cardQuery);
	
	//If no results then stop
	if($credit_cardResult == false){
		return "No results for '".$username."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $credit_cardResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return all of the phone numbers of a user when supplied with a username
function getPhoneNumberByUser( $userName )
{
	//query creation
	$phone_numQuery = "SELECT * FROM Cont_Phone P WHERE P.username LIKE '".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$phone_numResult = $databaseConnection->query($phone_numQuery);

	//If no results then stop
	if($phone_numResult == false){
		return "No results for '".$username."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $phone_numResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return a sale items information when given its id
function getSaleItem( $itemId )
{
	//query creation
	$sale_itemQuery = "SELECT * FROM Sale_Item NATURAL JOIN Item WHERE iid LIKE '".$itemId."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$sale_itemResult = $databaseConnection->query($sale_itemQuery);


	//If no results then stop
	if($sale_itemResult == false){
		return "No results for '".$itemId."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $sale_itemResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return all items associated with a keyword when supplied with a keyword
function getItemsByCategory( $catId )
{
	//query creation
	$itemQuery = "SELECT * FROM Item NATURAL JOIN Sale_Item NATURAL JOIN Categorized WHERE pcid = '".$catId."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	if($itemResult != false)
	{
		//Loop through results and add each row to array
		$output = array();
		while($row = $itemResult->fetch_assoc()){
			array_push($output, $row);
		}
	}

	//query creation
	$itemQuery = "SELECT * FROM Item NATURAL JOIN Auction_Item NATURAL JOIN Categorized WHERE pcid = '".$catId."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	if($itemResult != false)
	{
		//Loop through results and add each row to array
		while($row = $itemResult->fetch_assoc()){
			array_push($output, $row);
		}
	}
	
	//format output
	return json_encode($output);
}

//This function will return all items associated with a keyword when supplied with a keyword
function getItemsByKeyword( $keyword )
{
	//query creation
	$search_keyQuery = "SELECT * FROM Search_Key S WHERE S.word LIKE '".$keyword."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$search_keyResult = $databaseConnection->query($search_keyQuery);

	//If no results then stop
	if($search_keyResult == false){
		return "No results for '".$keyword."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $search_keyResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return the shop information of a user when supplied with a user name
function getShopByUser( $userName )
{
	//query creation
	$shopQuery = "SELECT * FROM Runs_Shop S WHERE S.username LIKE '".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$shopResult = $databaseConnection->query($shopQuery);

	//If no results then stop
	if($shopResult == false){
		return "No results for '".$userName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $shopResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);}

//This function will return the information for a supplier
function getSupplier( $supplierName )
{
	//query creation
	$supplierQuery = "SELECT * FROM Supplier_Stocked S WHERE S.username LIKE '".$supplierName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplierResult = $databaseConnection->query($supplierQuery);

	//If no results then stop
	if($supplierResult == false){
		return "No results for '".$supplierName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $supplierResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return the list of items stocked by a supplier when supplied with a supplier name
function getStockedBySupplier( $supplierName )
{
	//query creation
	$supplier_stockQuery = "SELECT * FROM Supplier_Stocked S WHERE S.username LIKE '".$supplierName."'";
	
	//query database
	$databaseConnection = GetDatabaseConnection();
	
	$supplier_stockResult = $databaseConnection->query($supplier_stockQuery);
	//If no results then stop
	if($supplier_stockResult == false){
		return "No results for '".$supplierName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $supplier_stockResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return all of the transactions of a supplier when supplied with a supplier name
function getSoldBySupplier( $supplierName )
{
	//query creation
	$supplier_transQuery = "SELECT * FROM Supplier_Trans S WHERE S.username LIKE '".$supplierName."'";
	
	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplier_transResult = $databaseConnection->query($supplier_transQuery);

	//If no results then stop
	if($supplier_transResult == false){
		return "No results for '".$supplierName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $supplier_transResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
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
	$user_stockedQuery = "SELECT * FROM User_Stocked U WHERE U.username LIKE '".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$user_stockedResult = $databaseConnection->query($user_stockedQuery);

	//If no results then stop
	if($user_stockedResult == false){
		return "No results for '".$userName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $user_stockedResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return all of the transactions of a user when supplied with a user name
function getSoldByUser( $userName )
{
	//query creation
	$user_transQuery = "SELECT * FROM User_Transaction U WHERE U.username LIKE ".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$user_tranResult = $databaseConnection->query($user_transQuery);

	//If no results then stop
	if($user_tranResult == false){
		return "No results for '".$userName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $user_tranResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

//This function will return the wishlist of a user when supplied with a user name
function getWishedByUser( $userName )
{
	//query creation
	$wish_listQuery = "SELECT * FROM Whishes_For W WHERE W.username LIKE ".$userName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$wish_listResult = $databaseConnection->query($wish_listQuery);
	
	//If no results then stop
	if($wish_listResult == false){
		return "No results for '".$userName."'";
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $wish_listResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

function login($user, $pass)
{
	//query creation
	//Use "LIKE" because then we can pattern match.
	$userQuery = "SELECT * FROM Usr U WHERE U.username = '" . $user . "' AND U.upassword = '" . $pass . "';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	//If there are not results then stop.
	if($userResult === false)
	{
		echo "no users found!";
		return null;
	}

	//Loop through the results and add each row to an array.
	$output = array();
	while($row = $userResult->fetch_assoc())
	{
		array_push($output, $row);
	}

	//format output
	//return json_encode($output);
	return $output;
}

?>