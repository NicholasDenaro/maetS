function initListings(catId)
{

	checkIfLoggedIn(function()
	{
		var URL = "../../backend/api/ItemByUser.php";
		var username = getUsernameFromURL();
		if(username != -1)
			URL += "?username="+username;

		$.ajax({
			url: URL,
			success: function(data)
			{
				var check = JSON.parse(data);
				if(check["error"])
				{
					window.location.href="../homepage/";
				}
				processItemResponse(data);
			},
			error: function(xhr, ajaxOptions, thrownError)
			{
				console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
			}
		});
	});

	/*$.ajax({
		url:"../../backend/api/Login.php?check",
		success: function(dat)
		{
			dat = JSON.parse(dat);

			URL = "../../backend/api/ItemByUser.php?userId="+dat["user"];
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
	});*/
}

function getUsernameFromURL()
{
	var str = window.location.search;
	str = str.substring(str.lastIndexOf("?") + 1);
	var pair = str.split('=');
	if(pair[0]=="username")
	{
		return pair[1];
	}
	return -1;
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

function createItemDisplay(item)
{
	/*var outer = document.createElement("li");
	outer.className = "list-group-item";
	var value;
	if(item["price"] != undefined)
	{
		value = item["price"];
	}
	else
	{
		value = item["min_price"];
	}

	var img = document.createElement("img");
	if(item.img != null)
		img.src = item["img"];
	else
		img.src="../images/na.jpg";
	img.style = "width: auto; height: 150px;";
	outer.appendChild(img);

	var descr = document.createElement("div");
	descr.className = "pull-right";
	descr.innerHTML = item["descr"];
	outer.appendChild(descr);

	var price = document.createElement("div");
	price.className = "";
	price.innerHTML = "$" + value;
	outer.appendChild(price);*/

	var outer = document.createElement("li");
	outer.className = "list-group-item row";
	var value;
	if(item["price"] != undefined)
	{
		value = "Price: $"+item["price"];
	}
	else
	{
		value = "Bid: $"+item["min_price"];
	}

	var divLeft=document.createElement("div");
	divLeft.className="col-md-3";
	divLeft.style.textAlign="center";
	outer.appendChild(divLeft);

	var img = document.createElement("img");
	if(item.img != null && item.img != "")
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
	price.innerHTML = value;
	//price.className = "pull-right";
	divRight.appendChild(price);

	if(item["price"] == undefined)
	{
		var ending = document.createElement("div");
		ending.innerHTML = "Ending on: "+item["end_date"];
		//price.className = "pull-right";
		divRight.appendChild(ending);
	}

	var descr = document.createElement("div");
	//descr.className = "pull-right";
	descr.innerHTML = item["descr"];
	divRight.appendChild(descr);

	return outer;
}