function init()
{
	var func = function(){checkIfLoggedIn(function(data)
		{
			if(data != false)
			{
				if(data["supplier"])
				{
					var buy = document.getElementById("buy-button");
					var wishlist = document.getElementById("wishlist-button");
					buy.parentNode.removeChild(buy);
					wishlist.parentNode.removeChild(wishlist);
				}
			}
			else
			{
				var buy = document.getElementById("buy-button");
				var wishlist = document.getElementById("wishlist-button");
				buy.parentNode.removeChild(buy);
				wishlist.parentNode.removeChild(wishlist);
			}
		});};

	var itemId = getItemIdFromURL();
	var URL = "../../backend/api/SaleItem.php?itemId="+itemId;
	$.ajax({
		url: URL,
		success: function(data)
		{
			processResponse(data);
			var URL = "../../backend/api/AuctionItem.php?itemId="+itemId;
			$.ajax({
				url: URL,
				success: function(data)
				{
					processResponse(data);
					func();
				},
				error: function(xhr, ajaxOptions, thrownError)
				{
					console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
				}
			});
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});


}

function getItemIdFromURL()
{
	var str = window.location.search;
	str = str.substring(str.lastIndexOf("?") + 1);
	var pair = str.split('=');
	if(pair[0]=="iid")
	{
		return pair[1];
	}
	return -1;
}

function buyItem(iid)
{
	if(confirm("Buy Item?"))
	{
		var URL = "../../backend/api/CreditCard.php";
		$.ajax({
			url: URL,
			success: function(data)
			{
				data = JSON.parse(data);
				if(!data["error"])
				{
					var promptMessage="Type credit card to confirm:\n";
					for(var i = 0 ; i < data.length; i++)
					{
						promptMessage+=data[i]["ctype"]+" "+data[i]["cnumber"]+"\n";
					}
					var creditcard = prompt(promptMessage);

					var URL = "../../backend/api/AddTransaction.php?iid="+iid+"&creditcard="+creditcard;
					$.ajax({
						url: URL,
						success: function(data)
						{
							data = JSON.parse(data);
							if(data["success"])
							{
								alert("Item has been purchased.");
								document.location.href="../homepage/";
							}
							else
							{
								alert("Item could not be purchased.");
							}
						},
						error: function(xhr, ajaxOptions, thrownError)
						{
							console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
						}
					});
				}
				else
				{
					alert(data["error"]);
				}
			},
			error: function(xhr, ajaxOptions, thrownError)
			{
				console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
			}
		});
	}
}

function bidItem(iid)
{
	var price = document.getElementById("item-price");
	var bid = prompt("Enter how much to raise bid.\nCurrent bid is "+price.innerHTML);

	if(!isNaN(bid) && bid > 0)
	{
		var URL = "../../backend/api/AddBid.php?iid="+iid+"&bid="+bid;
		$.ajax({
			url: URL,
			success: function(data)
			{
				data = JSON.parse(data);
				if(data["success"])
				{
					alert("Item has been bid on.");
					location.reload();
				}
				else
				{
					alert("Item could not be bid on.");
				}
			},
			error: function(xhr, ajaxOptions, thrownError)
			{
				console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
			}
		});
	}
}

function addToWishList(iid)
{
	var URL = "../../backend/api/AddItemToWishlist.php?iid="+iid;
	$.ajax({
		url: URL,
		success: function(data)
		{
			data=JSON.parse(data);
			if(data.success)
			{
				alert("Item added to wishlist");

			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function processResponse(data)
{
	//alert(data);
	data = JSON.parse(data);
	for(var i = 0; i < data.length; i++)
	{
		var item = data[i];
		var div = createItemDisplay(item);

		var itemDisplay = document.getElementById("item-display");
		itemDisplay.insertBefore(div,itemDisplay.firstChild);
	}
}

function createItemDisplay(item)
{
	var thumb = document.createElement("div");
	thumb.className = "thumbnail";

	var img = document.createElement("img");
	img.alt = "";
	img.className="img-responsive"
	if(item.img != null && item.img != "")
		img.src = item.img;
	else
		img.src="../images/na.jpg";
	img.style="width: auto; height: 300px;"
	thumb.appendChild(img);

	var capt = document.createElement("div");
	capt.className ="caption";
	thumb.appendChild(capt);

	var price = document.createElement("h4");
	price.className = "pull-right";
	price.id="item-price";
	if(item.price != undefined)
	{
		price.innerHTML = "$" + item.price;
	}
	else
	{
		price.innerHTML = "$" + item.min_price;
	}
	capt.appendChild(price);

	var nameheader = document.createElement("h4");
	var name = document.createElement("a");
	name.href="../item/?iid="+item.iid;
	name.innerHTML = item.name;
	var seller = document.createElement("a");
	seller.innerHTML="By: ";

	var URL = "../../backend/api/SellerByItem.php?iid="+item["iid"];
	$.ajax({
		url: URL,
		success: function(data)
		{
			data = JSON.parse(data);
			if(data["username"])
			{
				seller.href="../ratings/?username="+data["username"];
				seller.innerHTML+=data["username"];
			}
			else
			{
				seller.href="../ratings/?supplier="+data["supplier"];
				seller.innerHTML+=data["supplier"];
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});

	capt.appendChild(nameheader);

	if(item.price == undefined)
	{
		var date = document.createElement("h4");
		date.innerHTML = "End Date: " + item.end_date;
		//capt.appendChild(document.createElement("br"));
		capt.appendChild(date);

		var bidder = document.createElement("h4");
		bidder.innerHTML = "Last Bidder: " + item.bidder;
		capt.appendChild(bidder);

		capt.appendChild(document.createElement("br"));
	}

	nameheader.appendChild(name);
	nameheader.appendChild(document.createElement("br"));
	nameheader.appendChild(seller);

	var buttons = document.createElement("div");	
	var wish = document.createElement("button");
	wish.innerHTML="Add to wish list";
	wish.className="pull-right";
	wish.setAttribute('onclick',"addToWishList('"+item.iid+"');");
	wish.id="wishlist-button";
	var buy = document.createElement("button");
	buy.className="pull-right";
	buy.id="buy-button";
	if(item.price != undefined)
	{
		buy.innerHTML = "Buy";
		buy.setAttribute('onclick',"buyItem('"+item.iid+"');");
	}
	else
	{
		buy.innerHTML = "Place Bid";
		buy.setAttribute('onclick',"bidItem('"+item.iid+"');");
	}
	buttons.appendChild(wish);
	buttons.appendChild(buy);
	capt.appendChild(buttons);

	var desc = document.createElement("h4");
	desc.innerHTML = item.descr;
	capt.appendChild(desc);

	/*var ratingHolder = document.createElement("div");
	ratingHolder.className = "ratings";
	thumb.appendChild(ratingHolder);

	var ratingCount = document.createElement("p");
	ratingCount.className = "pull-right";
	ratingCount.innerHTML = "X"+" reviews";
	ratingHolder.appendChild(ratingCount);

	var starHolder = document.createElement("p");
	ratingHolder.appendChild(starHolder);

	var star = document.createElement("span");
	star.className = "glyphicon glyphicon-star";
	starHolder.appendChild(star);*/

	return thumb;
}