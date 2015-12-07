function refreshAuctions()
{
	var URL = "../../backend/api/RefreshAuctions.php";
	$.ajax({
		url: URL,
		success: function(data)
		{
			//alert(data);
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}