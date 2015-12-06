<?php
//This file will contain all of the code for the API calls

function getUniqid($table,$idname)
{
	$databaseConnection = GetDatabaseConnection();
	$id = substr(uniqid('', true), 0, 20);

	$result = $databaseConnection->query(sprintf("select * from %s where %s='%s';",$table,$idname,$id));

	while($result->num_rows != 0)
	{
		$id = substr(uniqid('', true), 0, 20);

		$result = $databaseConnection->query(sprintf("select * from %s where %s='%s';",$table,$idname,$id));
	}

	return $id;
}

function buildCategoryDescendants($catId)
{
	//query creation
	$categoryQuery = "SELECT * FROM Connected_To;";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$categoryResult = $databaseConnection->query($categoryQuery);

	//If no results then stop
	if($categoryResult == false){
		return null;
	}

	//Loop through results and add each row to array
	$mappings = array();
	while($row = $categoryResult->fetch_assoc())
	{
		if(!isset($mappings[$row["cid"]]))
		{
			$mappings[$row["cid"]] = array();
		}

		array_push($mappings[$row["cid"]], $row["ccid"]);
	}

	$categories = array($catId);

	for($i = 0; $i < count($categories); $i++)
	{
		if(isset($mappings[$categories[$i]]))
			$categories = array_merge($categories, $mappings[$categories[$i]]);
	}

	return $categories;
}

function addAuctionItem($name, $descr, $loc, $img, $price, $endDate)
{
	$databaseConnection = GetDatabaseConnection();

	$iid = substr(uniqid('', true), 0, 20);

	$result = $databaseConnection->query("select count(*) from item where iid='".$iid."';");

	while($result->fetch_assoc()["count(*)"] != '0')
	{
		$iid = substr(uniqid('', true), 0, 20);

		$result = $databaseConnection->query("select count(*) from item where iid='".$iid."';");
	}

	//query creation
	$itemQuery = sprintf("insert INTO item (`iid`, `name`, `descr`, `location`, `img`) VALUES ('%s','%s','%s','%s','%s');",$iid,$name,$descr,$loc,$img);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	if($itemResult)
	{
		//query creation
		$itemQuery = sprintf("insert INTO auction_item (`iid`, `min_price`, `end_date`) VALUES ('%s','%s','%s');",$iid,$price,$endDate);
		//query database
		$databaseConnection = GetDatabaseConnection();
		$itemResult = $databaseConnection->query($itemQuery);
		if($itemResult)
		{
			return json_encode(array("success"=>"true","iid"=>$iid));
		}
		else
		{
			//query creation
			$itemQuery = sprintf("delete from item where iid='%s';",$iid);
			//query database
			$databaseConnection = GetDatabaseConnection();
			$itemResult = $databaseConnection->query($itemQuery);
			if($itemResult)
			{
				return json_encode(array("error"=>"failed to insert item in auction_item."));
			}
			else
			{
				return json_encode(array("success"=>"false","error"=>"failed to succeed. =("));
			}
		}
	}
	else
	{
		return json_encode(array("error"=>"failed to insert"));
	}
}

function addCategoryToItem($iid, $category)
{
	if($category == null)
		$category = 0;
	//query creation
	$itemQuery = sprintf("insert INTO Categorized (`iid`, `cid`) VALUES ('%s','%s');",$iid,$category);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);
	if($itemResult)
	{
		return json_encode(array("success"=>"true"));
	}
}

function addItemToUserStocked($iid, $username)
{
	//query creation
	$itemQuery = sprintf("insert INTO user_stocked (`iid`, `username`) VALUES ('%s','%s');",$iid,$username);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	if($itemResult == false)
	{
		return json_encode(array("error"=>"Failed to add to user stocked."));
	}

	return json_encode(array("success"=>true));
}

function addItemToSupplierStocked($iid, $username)
{
	//query creation
	$itemQuery = sprintf("insert INTO supplier_stocked (`iid`, `supplier`) VALUES ('%s','%s');",$iid,$username);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	if($itemResult == false)
	{
		return json_encode(array("error"=>"Failed to add to supplier stocked."));
	}

	return json_encode(array("success"=>true));
}

function addItemToWishlist($username, $iid)
{
	//query creation
	$wishlistQuery = sprintf("select * from wishes_for where username='%s';",$username);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$wishlistResult = $databaseConnection->query($wishlistQuery);
	if($wishlistResult->num_rows == 0)
	{
		$wid = getUniqid("wishes_for","wid");
		$wishlistQuery = sprintf("insert into wishes_for (`wid`,`username`) VALUES ('%s','%s');",$wid, $username);
		//query database
		$databaseConnection = GetDatabaseConnection();
		$wishlistResult = $databaseConnection->query($wishlistQuery);
	}
	else
	{
		$wid = $wishlistResult->fetch_assoc()["wid"];
	}

	//query creation
	$itemQuery = sprintf("insert INTO filled_with (`wid`, `iid`) VALUES ('%s','%s');",$wid,$iid);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);
	if($itemResult)
	{
		return json_encode(array("success"=>"true"));
	}
	else
	{
		echo $databaseConnection->error;
	}
}

function removeItemFromWishlist($username, $iid)
{
	//query creation
	$wishlistQuery = sprintf("select * from wishes_for where username='%s';",$username);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$wishlistResult = $databaseConnection->query($wishlistQuery);
	if($wishlistResult->num_rows == 0)
	{
		$wid = getUniqid("wishes_for","wid");
		$wishlistQuery = sprintf("insert into wishes_for (`wid`,`username`) VALUES ('%s','%s');",$wid, $username);
		//query database
		$databaseConnection = GetDatabaseConnection();
		$wishlistResult = $databaseConnection->query($wishlistQuery);
	}
	else
	{
		$wid = $wishlistResult->fetch_assoc()["wid"];
	}

	//query creation
	$itemQuery = sprintf("DELETE FROM filled_with WHERE wid='%s' AND iid='%s';",$wid,$iid);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);
	if($itemResult)
	{
		return json_encode(array("success"=>"true"));
	}
	else
	{
		echo $databaseConnection->error;
	}
}

function addKeywordsToItem($iid, $keywords)
{
	if($keywords == null)
		return;

	$keywords = json_decode($keywords);

	//query creation
	$itemQuery = sprintf("insert INTO search_key (`iid`, `word`) VALUES ('%s','%s')", $iid, $keywords[0]);

	for($i = 1; $i < count($keywords); $i++)
	{
		$itemQuery .= sprintf(", ('%s','%s')",$iid,$keywords[$i]);
	}

	$itemQuery.=";";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);


	if($itemResult)
	{
		return json_encode(array("success"=>"true"));
	}
	else
	{
		echo $databaseConnection->error;
	}
}

function addRating($iid, $user, $rating, $comment)
{
	$userQuery = "SELECT * FROM user_stocked WHERE iid='".$iid."';";

	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	if($userResult->num_rows == 0)//supplier
	{
		$supplierQuery = sprintf("UPDATE supplier_Trans SET rating='%s', comment='%s' WHERE iid='%s' AND username='%s';",$rating,$comment,$iid, $user);
		$supplierResult = $databaseConnection->query($supplierQuery);

		if($supplierResult == false)
		{
			return json_encode(array("error"=>"failed to update rating."));
		}
	}
	else//user
	{
		$transQuery = sprintf("UPDATE user_Transaction SET rating='%s', tcomment='%s' WHERE iid='%s' AND busername='%s';",$rating,$comment,$iid,$user);
		$transResult = $databaseConnection->query($transQuery);

		if($transResult == false)
		{
			return json_encode(array("error"=>"failed to update rating."));
		}

		if($databaseConnection->affected_rows == 0)
		{
			return json_encode(array("error"=>"STOP TRYING TO EDIT OTHER PEOPLE'S $#1+, YOU @\$\$HOLE."));
		}
	}

	return json_encode(array("success"=>"true"));
}

function addSaleItem($name, $descr, $loc, $img, $price)
{
	$databaseConnection = GetDatabaseConnection();

	$iid = substr(uniqid('', true), 0, 20);

	$result = $databaseConnection->query("select count(*) from item where iid='".$iid."';");

	while($result->fetch_assoc()["count(*)"] != '0')
	{
		$iid = substr(uniqid('', true), 0, 20);

		$result = $databaseConnection->query("select count(*) from item where iid='".$iid."';");
	}

	//query creation
	$itemQuery = sprintf("insert INTO item (`iid`, `name`, `descr`, `location`, `img`) VALUES ('%s','%s','%s','%s','%s');",$iid,$name,$descr,$loc,$img);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	if($itemResult)
	{
		//query creation
		$itemQuery = sprintf("insert INTO sale_item (`iid`, `price`) VALUES ('%s','%s');",$iid,$price);
		//query database
		$databaseConnection = GetDatabaseConnection();
		$itemResult = $databaseConnection->query($itemQuery);
		if($itemResult)
		{
			return json_encode(array("success"=>"true","iid"=>$iid));
		}
		else
		{
			//query creation
			$itemQuery = sprintf("delete from item where iid='%s';",$iid);
			//query database
			$databaseConnection = GetDatabaseConnection();
			$itemResult = $databaseConnection->query($itemQuery);
			if($itemResult)
			{
				return json_encode(array("error"=>"failed to insert item in sale_item."));
			}
			else
			{
				return json_encode(array("success"=>"false","error"=>"failed to succeed. =("));
			}
		}
	}
	else
	{
		return json_encode(array("error"=>"failed to insert"));
	}
}

function addUser($username, $password, $name, $income, $gender, $dob, $email, $phone_number, $credit_card, $address)
{
	$databaseConnection = GetDatabaseConnection();

	$result = $databaseConnection->query("select count(*) from user where username='".$username."';");

	if($result->fetch_assoc()["count(*)"] != '0')
	{
		return(json_encode(array("error"=>"username already taken.")));
	}

	//query creation
	$userQuery = sprintf("insert INTO user (`username`, `upassword`, `uname`, `income`, `gender`, `dob`, `email`) VALUES ('%s','%s','%s','%s','%s','%s','%s');",$username, $password, $name, $income, $gender, $dob, $email);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	//http://localhost/431w/backend/api/AddUser.php?username=test&password=test&name=tester&income=9001&gender=T&dob=1111-01-01&email=test&phone_number=234234&credit_card=23423&address=[{%22street%22:%22road%22,%22city%22:%22testcity%22,%22state%22:%22ST%22,%22zip%22:%2212345%22,%22apt%22:%222%22}]
	if($userResult)
	{
		/*$phones = json_decode($phone_number);
		$creditCards = json_decode($credit_card);
		$addresses = json_decode($address, true);

		for($i = 0; $i < count($phones); $i++)
		{
			$phoneQuery = sprintf("insert into Cont_Phone (`username`,`number`) VALUES ('%s','%s');",$username,$phones[$i]);
			$phoneResult = $databaseConnection->query($phoneQuery);
		}

		for($i = 0; $i < count($creditCards); $i++)
		{
			$card = $creditCards[$i];
			$cardQuery = sprintf("insert into Cont_Phone (`username`,`cnumber`,`cname`,`ctype`,`expiration`) VALUES ('%s','%s','%s','%s','%s');",$username,$card["number"],$card["name"],$card["type"],$card["expire"]);
			$cardResult = $databaseConnection->query($cardQuery);
		}

		for($i = 0; $i < count($addresses); $i++)
		{
			$address = $addresses[$i];
			$addressQuery = sprintf("insert into loc_addresses (`username`,`street`,`city`,`astate`,`zip`,`apt_number`) VALUES ('%s','%s','%s','%s','%s','%s');",$username,$address["street"],$address["city"],$address["state"],$address["zip"],$address["apt"]);
			$addressResult = $databaseConnection->query($addressQuery);
		}*/

		return json_encode(array("success"=>"true"));
	}
	else
	{

		return json_encode(array("error"=>$databaseConnection->error));
	}
}

function addSupplier($company_name, $password, $poc, $phone_number, $address, $category)
{
	$databaseConnection = GetDatabaseConnection();

	$result = $databaseConnection->query("select count(*) from supplier where company_name='".$company_name."';");

	if($result->fetch_assoc()["count(*)"] != '0')
	{
		return(json_encode(array("error"=>"Company name already taken.")));
	}

	//query creation
	$userQuery = sprintf("insert INTO supplier (`company_name`, `password`, `poc`, `phone`, `address`, `category`) VALUES ('%s','%s','%s','%s','%s','%s');",$company_name, $password, $poc, $phone_number, $address, $category);
	//query database
	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	//http://localhost/431w/backend/api/AddUser.php?username=test&password=test&name=tester&income=9001&gender=T&dob=1111-01-01&email=test&phone_number=234234&credit_card=23423&address=[{%22street%22:%22road%22,%22city%22:%22testcity%22,%22state%22:%22ST%22,%22zip%22:%2212345%22,%22apt%22:%222%22}]
	if($userResult)
	{
		return json_encode(array("success"=>"true"));
	}
	else
	{

		return json_encode(array("error"=>$databaseConnection->error));
	}
}

function bid($iid, $bidder, $value)
{
	$rows = 0;
	//query creation
	$auctionQuery = sprintf("UPDATE auction_item NATURAL JOIN user_stocked SET bid=bid+%s WHERE iid = '%s' AND username<>%s;",$value,$iid,$bidder);

	//query database
	$databaseConnection = GetDatabaseConnection();
	$auctionResult = $databaseConnection->query($auctionQuery);

	$rows += $databaseConnection->affected_rows;

	$auction2Query = sprintf("UPDATE auction_item NATURAL JOIN supplier_stocked SET bid=bid+%s WHERE iid = '%s';",$value,$iid);

	//query database
	$databaseConnection = GetDatabaseConnection();
	$auction2Result = $databaseConnection->query($auction2Query);

	$rows += $databaseConnection->affected_rows;

	if($auctionResult == false && $auction2Result == false)
	{
		return json_encode(array("error"=>"something happened? =("));
	}

	if($rows == 0)
	{
		return(json_encode(array("error"=>"failed to update bid. Item ID not found.")));
	}


	return json_encode(array("success"=>true));
}

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
	$categoryQuery = "SELECT * FROM Connected_To C1, Category C2 WHERE C1.ccid = C2.cid AND C1.cid = '".$catId."'";

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

function getCategoryById( $catId )
{
	//query creation
	$categoryQuery = "SELECT * FROM Category WHERE cid LIKE '".$catId."'";

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

function getParentCategory( $catId )
{
	//query creation
	$categoryQuery = "SELECT * FROM Connected_To C1, Category C2 WHERE C1.cid = C2.cid AND C1.ccid = '".$catId."'";

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
	$descendants = buildCategoryDescendants($catId);
	//query creation
	$itemQuery = sprintf("SELECT * FROM user_stocked NATURAL JOIN Item NATURAL JOIN Sale_Item NATURAL JOIN Categorized WHERE cid in ('%s');", implode($descendants,'\',\''));

	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	$output = array();

	if($itemResult != false)
	{
		//Loop through results and add each row to array
		
		while($row = $itemResult->fetch_assoc()){
			array_push($output, $row);
		}
	}

	$itemQuery = sprintf("SELECT * FROM supplier_stocked NATURAL JOIN Item NATURAL JOIN Sale_Item NATURAL JOIN Categorized WHERE cid in ('%s');", implode($descendants,'\',\''));

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

	//query creation
	$itemQuery = sprintf("SELECT * FROM user_stocked NATURAL JOIN  Item NATURAL JOIN Auction_Item NATURAL JOIN Categorized WHERE cid in ('%s');", implode($descendants,'\',\''));

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

	//query creation
	$itemQuery = sprintf("SELECT * FROM supplier_stocked NATURAL JOIN  Item NATURAL JOIN Auction_Item NATURAL JOIN Categorized WHERE cid in ('%s');", implode($descendants,'\',\''));

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

//This function will return all items associated with keywords when supplied with keywords
function getItemsByKeywords( $keywords )
{
	//query creation
	$search_keyQuery = "SELECT * FROM Search_Key S WHERE S.word REGEXP '".str_replace(" ","|",$keywords)."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$search_keyResult = $databaseConnection->query($search_keyQuery);

	//If no results then stop
	if($search_keyResult == false){
		return json_encode(array("error"=>"No results for '".$keywords."'"));
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $search_keyResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

function getItemsByName($names)
{
	//query creation
	$search_keyQuery = "SELECT * FROM Item WHERE name REGEXP '".str_replace(" ","|",$names)."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$search_keyResult = $databaseConnection->query($search_keyQuery);

	//If no results then stop
	if($search_keyResult == false){
		return json_encode(array("error"=>"No results for '".$names."'"));
	}

	//Loop through results and add each row to array
	$output = array();
	while($row = $search_keyResult->fetch_assoc()){
		array_push($output, $row);
	}
	
	//format output
	return json_encode($output);
}

function isInObjectArray($keyName, $key, $array)
{
	for($i = 0; $i< count($array); $i++)
	{
		if($array[$i]->$keyName == $key)
			return true;
	}
	return false;
}

function getItemsByCategoryAndPhrase($category, $phrase)
{
	$categoryResults = json_decode(getItemsByCategory($category));
	$keywordResults = json_decode(getItemsByKeywords($phrase));
	$nameResults = json_decode(getItemsByName($phrase));

	$results = array();
	for($i = 0; $i < count($categoryResults); $i++)
	{
		$iid = $categoryResults[$i]->iid;
		if(isInObjectArray("iid", $iid, $keywordResults) || isInObjectArray("iid", $iid, $keywordResults))
		{
			array_push($results, $categoryResults[$i]);
		}
	}

	return json_encode($results);
}

//This function will return all items associated with a keyword when supplied with a keyword
function getItemsByUser( $username, $supplier )
{

	$table = $supplier ? "supplier_stocked" : "user_stocked";
	$attribute = $supplier ? "supplier" : "username";

	//query creation
	$itemQuery = "SELECT * FROM ".$table." natural join item natural join Sale_Item WHERE ".$attribute." = '".$username."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	//Loop through results and add each row to array
	$output = array();
	if($itemResult)
	{
		while($row = $itemResult->fetch_assoc()){
			array_push($output, $row);
		}
	}

	$itemQuery = "SELECT * FROM ".$table." natural join item natural join Auction_Item WHERE ".$attribute." = '".$username."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$itemResult = $databaseConnection->query($itemQuery);

	//Loop through results and add each row to array
	if($itemResult)
	{
		while($row = $itemResult->fetch_assoc()){
			array_push($output, $row);
		}
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
	$supplierQuery = "SELECT * FROM Supplier WHERE company_name LIKE '".$supplierName."'";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplierResult = $databaseConnection->query($supplierQuery);

	//If no results then stop
	if($supplierResult == false){
		return json_encode(array("error"=>"No results for '".$supplierName."'"));
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
	$userQuery = "SELECT * FROM user U WHERE U.username LIKE '" . $userName . "'";

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
	$wish_listQuery = "SELECT * FROM wishes_for W NATURAL JOIN filled_with NATURAL JOIN item NATURAL JOIN sale_item WHERE W.username='".$userName."';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$wish_listResult = $databaseConnection->query($wish_listQuery);
	
	//If no results then stop
	/*if($wish_listResult == false){
		return json_encode(array("error"=>"No results for '".$userName."'"));
	}*/

	$output = array();

	if($wish_listResult!=false)
	{
		//Loop through results and add each row to array
		
		while($row = $wish_listResult->fetch_assoc()){
			array_push($output, $row);
		}
	}
	$wish_listQuery = "SELECT * FROM wishes_for W NATURAL JOIN filled_with NATURAL JOIN item NATURAL JOIN auction_item WHERE W.username='".$userName."';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$wish_listResult = $databaseConnection->query($wish_listQuery);
	
	//If no results then stop
	/*if($wish_listResult == false){
		return json_encode(array("error"=>"No results for '".$userName."'"));
	}*/

	if($wish_listResult!=false)
	{
		//Loop through results and add each row to array
		while($row = $wish_listResult->fetch_assoc()){
			array_push($output, $row);
		}
	}
	
	//format output
	return json_encode($output);
}

function login($user, $pass, $supplier)
{
	if(!$supplier)
	{
		//query creation
		$userQuery = "SELECT * FROM user U WHERE U.username = '" . $user . "' AND U.upassword = '" . $pass . "';";

		//query database
		$databaseConnection = GetDatabaseConnection();
		$userResult = $databaseConnection->query($userQuery);
	}
	else
	{
		//query creation
		$userQuery = "SELECT * FROM supplier WHERE company_name = '" . $user . "' AND password = '" . $pass . "';";

		//query database
		$databaseConnection = GetDatabaseConnection();
		$userResult = $databaseConnection->query($userQuery);
	}
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

function transaction($iid, $buyer)
{
	$userQuery = "SELECT * FROM user_stocked WHERE iid='".$iid."';";

	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	if($userResult->num_rows == 0)
	{
		return transactionSupplier($iid, $buyer);
	}
	else
	{
		return transactionUser($iid, $buyer);
	}
}

function transactionUser($iid, $buyer)
{
	//query creation
	//Use "LIKE" because then we can pattern match.
	$userQuery = "SELECT * FROM user_stocked NATURAL JOIN item I NATURAL JOIN sale_item WHERE I.iid = '" . $iid . "';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	//Loop through the results and add each row to an array.
	$output = array();
	while($row = $userResult->fetch_assoc())
	{
		array_push($output, $row);
	}

	$userQuery = "SELECT * FROM user_stocked NATURAL JOIN item I NATURAL JOIN auction_item WHERE I.iid = '" . $iid . "';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$userResult = $databaseConnection->query($userQuery);

	//Loop through the results and add each row to an array.
	while($row = $userResult->fetch_assoc())
	{
		array_push($output, $row);
	}

	if(count($output) == 0)
	{
		return json_encode(array("error"=>"item id not found"));
	}

	$item = $output[0];

	$seller = $item["username"];
	if(isset($item["min_price"]))//auction item
	{
		$price = $item["min_price"];	
	}
	else//sale item
	{
		$price = $item["price"];
	}

	$transQuery = sprintf("INSERT INTO User_Transaction (`cusername`,`busername`, `iid`,`utdate`) VALUES ('%s','%s','%s',now())",$seller,$buyer,$iid);
	$transResult = $databaseConnection->query($transQuery);

	if($transResult == false)
	{
		return json_encode(array("error"=>$databaseConnection->error));
	}

	$userQuery = "DELETE FROM user_stocked WHERE iid='".$iid."'";
	$userResult = $databaseConnection->query($userQuery);

	if($userResult == false)
	{
		return json_encode(array("error"=>$databaseConnection->error));
	}

	return json_encode(array("success"=>true));
}

function transactionSupplier($iid, $buyer)
{
	//query creation
	//Use "LIKE" because then we can pattern match.
	$supplierQuery = "SELECT * FROM supplier_stocked NATURAL JOIN item I NATURAL JOIN sale_item WHERE I.iid = '" . $iid . "';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplierResult = $databaseConnection->query($supplierQuery);

	//Loop through the results and add each row to an array.
	$output = array();
	while($row = $supplierResult->fetch_assoc())
	{
		array_push($output, $row);
	}

	$supplierQuery = "SELECT * FROM supplier_stocked NATURAL JOIN item I NATURAL JOIN auction_item WHERE I.iid = '" . $iid . "';";

	//query database
	$databaseConnection = GetDatabaseConnection();
	$supplierResult = $databaseConnection->query($supplierQuery);

	//Loop through the results and add each row to an array.
	while($row = $supplierResult->fetch_assoc())
	{
		array_push($output, $row);
	}

	if(count($output) == 0)
	{
		return json_encode(array("error"=>"item id not found"));
	}

	$item = $output[0];

	$seller = $item["supplier"];
	if(isset($item["min_price"]))//auction item
	{
		$price = $item["min_price"];	
	}
	else//sale item
	{
		$price = $item["price"];
	}

	$transQuery = sprintf("INSERT INTO supplier_Trans (`supplier`,`username`, `iid`,`stdate`) VALUES ('%s','%s','%s',now())",$seller,$buyer,$iid);
	$transResult = $databaseConnection->query($transQuery);

	if($transResult == false)
	{
		return json_encode(array("error"=>$databaseConnection->error));
	}

	$userQuery = "DELETE FROM supplier_stocked WHERE iid='".$iid."'";
	$userResult = $databaseConnection->query($userQuery);

	if($userResult == false)
	{
		return json_encode(array("error"=>$databaseConnection->error));
	}

	return json_encode(array("success"=>true));
}

?>