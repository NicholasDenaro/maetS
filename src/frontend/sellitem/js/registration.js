function init()
{

}

function sellItem()
{
	var form = document.forms[0];

	var name = form[0].value;
	var descr = form[1].value;
	var price = form[2].value;
	var url = form[3].value;
	var location = form[4].value;
	var keywords = form[5].value;
	var category = form[6].value;

	var URL = "../../backend/api/AddSaleItem.php?name="+name+"&descr="+descr+"&price="+price+"&img="+url+"&location="+location+"&keywords="+keywords.split(' ')+"&category="+category;
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