function initListings(catId)
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

function createItemDisplay(item)
{
	var outer = document.createElement("li");
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
	outer.appendChild(price);

	return outer;
}