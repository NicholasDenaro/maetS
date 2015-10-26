function submit()
{
	
	var call = document.querySelector( 'input[name="api"]:checked' ).value;
	var input = document.getElementById( 'input' ).value;
	makeAPICallAndAlert( call, input );
}

function makeAPICallAndAlert( call, input )
{
	
	var param;
	
	switch(call)
	{
		case "Address":
		case "CreditCard":
		case "Phone":
		case "Shop":
		case "User":
		case "UserStocked":
		case "UserTransaction":
		case "WishList": 
			param = "userName"; 
			break;
		case "AuctionItem":
		case "Categorized":
		case "SaleItem":
			param = "itemId";
			break;
		case "SearchKey":
			param = "keyword";
			break;
		case "Supplier":
		case "SupplierStocked":
		case "SupplierTransaction":
			param = "supplierName";
			break;
	}
	
	var myUrl = 'http://localhost/maets/backend/api/'+call+".php?"+param +"="+input;
	//alert(myUrl);
	
	$.ajax({
	
		url: myUrl,
		dataType: 'text',
		success: function (data){alert(data);},
		error: function(xhr, textStatus, errorThrown) {alert("ERROR:\n" + errorThrown);}
	})
}