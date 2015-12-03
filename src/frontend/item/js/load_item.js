function init()
{
	var itemId = getItemIdFromURL();
	var URL = "../../backend/api/SaleItem.php?itemId="+itemId;
	$.ajax({
		url: URL,
		success: function(data)
		{
			processResponse(data);
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});

	var URL = "../../backend/api/AuctionItem.php?itemId="+itemId;
	$.ajax({
		url: URL,
		success: function(data)
		{
			processResponse(data);
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

}

function bidItem(iid)
{

}

function addToWishList(iid)
{
	var URL = "../../backend/api/Wishlist.php?itemId="+itemId;
	$.ajax({
		url: URL,
		success: function(data)
		{
			processResponse(data);
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
	if(item.img != null)
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
	capt.appendChild(nameheader);

	if(item.price == undefined)
	{
		var date = document.createElement("h4");
		date.innerHTML = "End Date: " + item.end_date;
		capt.appendChild(document.createElement("br"));
		capt.appendChild(date);
	}

	nameheader.appendChild(name);

	var buttons = document.createElement("div");	
	var wish = document.createElement("button");
	wish.innerHTML="Add to wish list";
	wish.className="pull-right";
	wish.onclick="addToWishList('"+item.iid+"')";
	var buy = document.createElement("button");
	buy.className="pull-right";
	if(item.price != undefined)
	{
		buy.innerHTML = "Buy";
		buy.onclick="buyItem('"+item.iid+"')";
	}
	else
	{
		buy.innerHTML = "Place Bid";
		buy.onclick="bidItem('"+item.iid+"')";
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