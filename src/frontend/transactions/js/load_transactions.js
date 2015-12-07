function initTransactions()
{

	checkIfLoggedIn(function(check)
	{
		if(check == false)
		{
			window.location.href="../homepage/";
		}

		var URL = "../../backend/api/Transaction.php";
		$.ajax({
			url: URL,
			success: function(data)
			{
				data = JSON.parse(data);
				var myself = data["current_user"];
				processItemResponse(myself,data["items"]);
			},
			error: function(xhr, ajaxOptions, thrownError)
			{
				console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
			}
		});
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

function processItemResponse(myself, data)
{
	//data = JSON.parse(data);
	for(var i = 0; i < data.length; i++)
	{
		var item = data[i];
		var div = createItemDisplay(myself,item);

		var displayCase = document.getElementById("display-case");
		displayCase.appendChild(div);
	}
}

function addReview(info)
{
	var rating = prompt("Rating: 0-5", 1);
	var comment = prompt("Enter a comment:","comment");
	var URL = "../../backend/api/AddRating.php?iid="+info["iid"]+"&rating="+rating+"&comment="+comment;
	$.ajax({
		url: URL,
		success: function(data)
		{
			data = JSON.parse(data);
			if(data["success"])
			{
				location.reload();
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

function createItemDisplay(myself, item)
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
	//name.href = "../item/?iid=" + item["iid"];
	divRight.appendChild(name);

	var date = document.createElement("div");
	if(item["utdate"] != undefined)
		date.innerHTML = "Sold on: "+item["utdate"];
	else
		date.innerHTML = "Sold on: "+item["stdate"];
	//name.className = "pull-right";
	//name.href = "../item/?iid=" + item["iid"];
	divRight.appendChild(date);

	var price = document.createElement("div");
	price.innerHTML = "Price: $" + value;
	//price.className = "pull-right";
	divRight.appendChild(price);

	var descr = document.createElement("div");
	//descr.className = "pull-right";
	descr.innerHTML = item["descr"];
	divRight.appendChild(descr);

	var action = document.createElement("p");
	action.style="bottom: 0; right: 0; position: absolute";
	if(myself == item["cusername"])
	{
		action.innerHTML="Sold";
		if(item["rating"] == 0 && item["comment"] == null)
		{
			var review = document.createElement("div");
			review.innerHTML = item["busername"] + " has not rated this transaction yet.";
			divRight.appendChild(review);
		}
		else
		{
			var review = document.createElement("div");
			review.innerHTML = "Rating: "+item["rating"]+"<br>Comment: "+item["comment"];
			divRight.appendChild(review);
		}
	}
	else if(myself == item["busername"])
	{
		action.innerHTML="Purchased";
		if(item["rating"] == 0 && item["tcomment"] == null)
		{
			var review = document.createElement("div");
			review.className="btn btn-sm btn-primary";
			review.onclick = function(){addReview(item)};
			//review.innerHTML="Write Review ";
			var glyph = document.createElement("span");
			glyph.className="glyphicon glyphicon-pencil";
			glyph.innerHTML = " Write Review";
			review.appendChild(glyph);
			divRight.appendChild(review);
		}
		else
		{
			var review = document.createElement("div");
			review.innerHTML = "Rating: "+item["rating"]+"<br>Comment: "+item["tcomment"];
			divRight.appendChild(review);
		}
	}
	else
	{
		action.innerHTML="Sold";
		if(item["rating"] == 0 && item["comment"] == null)
		{
			var review = document.createElement("div");
			review.innerHTML = item["busername"] + " has not rated this transaction yet.";
			divRight.appendChild(review);
		}
		else
		{
			var review = document.createElement("div");
			review.innerHTML = "Rating: "+item["rating"]+"<br>Comment: "+item["comment"];
			divRight.appendChild(review);
		}
	}
	divRight.appendChild(action);

	return outer;
}