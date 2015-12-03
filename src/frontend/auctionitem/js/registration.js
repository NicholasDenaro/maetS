function init()
{
	checkIfLoggedIn();

	var URL = "../../backend/api/Category.php?catId=%";
	$.ajax({
		url: URL,
		success: function(data)
		{
			data = JSON.parse(data);
			var select = document.getElementById("category-selector");
			for(var i = 0; i < data.length; i++)
			{
				select[i] = new Option(data[i].cname,data[i].cid);
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function auctionItem()
{
	var form = document.forms[0];

	var name = form[0].value;
	var descr = form[1].value;
	var price = form[2].value;
	var endDate = form[3].value;
	var url = form[4].value;
	var location = form[5].value;
	var keywords = form[6].value;
	var category = form[7].value;

	var URL = "../../backend/api/AddAuctionItem.php?name="+name+"&descr="+descr+"&price="+price+"&end_date="+endDate+"&img="+url+"&location="+location+"&keywords="+keywords.split(' ')+"&category="+category;
	alert(URL);
	$.ajax({
		url: URL,
		success: function(data)
		{
			data = JSON.parse(data);
			if(data.success)
			{
				document.location.href="../Account";
			}
			else
			{
				alert("Failed to put item up for sale.");
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}