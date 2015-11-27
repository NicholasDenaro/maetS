function initItems()
{
	var id = getParameterFromURL();

	var URL="";
	if(id[0] == null)
	{
		URL = "../../backend/api/SaleItem.php?itemId=%";
	}
	else if(id[0] == "catId")
	{
		URL = "../../backend/api/Categorized.php?catId="+id[1];
	}
	$.ajax({
		url: URL,
		success: function(data)
		{
			processItemResponse(data);
			if(id[0]==null)
			{
				var URL = "../../backend/api/AuctionItem.php?itemId=%";
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
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function getParameterFromURL()
{
	var str = window.location.search;
	str = str.substring(str.lastIndexOf("?") + 1);
	var pair = str.split('=');
	if(pair[0] == "iid" || pair[0] == "catId")
	{
		return pair;
	}
	return null;
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
	var outer = document.createElement("div");
	outer.className = "col-sm-4 col-lg-4 col-md-4";

	var thumb = document.createElement("div");
	thumb.className = "thumbnail";
	outer.appendChild(thumb);

	var img = document.createElement("img");
	img.alt = "";
	if(item.img != null)
		img.src = "../images/" + item.img;
	else
		img.src="../images/na.jpg";
	img.style="width: auto; height: 150px;"
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
	name.innerHTML = item.iid;
	capt.appendChild(nameheader);
	nameheader.appendChild(name);

	var desc = document.createElement("p");
	desc.innerHTML = item.descr;
	capt.appendChild(desc);

	var ratingHolder = document.createElement("div");
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
	starHolder.appendChild(star);

	return outer;
}