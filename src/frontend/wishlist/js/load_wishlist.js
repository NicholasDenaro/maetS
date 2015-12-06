function initWishlist(catId)
{
	$.ajax({
		url:"../../backend/api/Login.php?check",
		success: function(dat)
		{
			dat = JSON.parse(dat);

			if(dat["error"] != undefined)
			{
				window.location.href = "../homepage/";
			}

			URL = "../../backend/api/Wishlist.php?userName="+dat["user"];
			$.ajax({
				url: URL,
				success: function(data)
				{
					processItemResponse(data);
				},
				error: function(xhr, ajaxOptions, thrownError)
				{
					console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
				}
			});
		}
	});
}

function clearItems()
{
	var displayCase = document.getElementById("display-case");
	var child = displayCase.firstChild;
	while(child!=null)
	{
		displayCase.removeChild(child);
		child = displayCase.firstChild;
	}
}

function processItemResponse(data)
{
	data = JSON.parse(data);
	for(var i = 0; i < data.length; i++)
	{
		var item = data[i];
		var div = createItemDisplay(item);

		var displayCase = document.getElementById("display-case");
		displayCase.appendChild(div);
	}
}

function removeItemFromWishlist(iid)
{
	var URL = "../../backend/api/AddItemToWishlist.php?iid="+iid+"&remove";
	$.ajax({
		url: URL,
		success: function(data)
		{
			data=JSON.parse(data);
			if(data.success)
			{
				//alert("Item removed from wishlist");
				location.reload();
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function createItemDisplay(item)
{
	var outer = document.createElement("li");
	outer.className = "list-group-item row";
	var value;
	if(item["price"] != undefined)
	{
		value = item["price"];
	}
	else
	{
		value = item["min_price"];
	}

	var divLeft=document.createElement("div");
	divLeft.className="col-md-3";
	divLeft.style.textAlign="center";
	outer.appendChild(divLeft);

	var img = document.createElement("img");
	if(item.img != null)
		img.src = item["img"];
	else
		img.src="../images/na.jpg";
	img.style = "width: auto; height: 150px; align:center";
	divLeft.appendChild(img);

	var divRight=document.createElement("div");
	divRight.className="col-md-9";
	divRight.style="height: 150px";
	outer.appendChild(divRight);

	var name = document.createElement("a");
	name.innerHTML = item["name"];
	//name.className = "pull-right";
	name.href = "../item/?iid=" + item["iid"];
	divRight.appendChild(name);

	var price = document.createElement("div");
	price.innerHTML = "$" + value;
	//price.className = "pull-right";
	divRight.appendChild(price);

	var descr = document.createElement("div");
	//descr.className = "pull-right";
	descr.innerHTML = item["descr"];
	divRight.appendChild(descr);

	var remove = document.createElement("button");
	remove.style="bottom: 0; right: 0; position: absolute";
	remove.innerHTML="Remove";
	remove.onclick= function(){removeItemFromWishlist(item["iid"]);};
	divRight.appendChild(remove);

	return outer;
}