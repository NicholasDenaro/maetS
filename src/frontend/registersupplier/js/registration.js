function submitRegistration()
{
	var form = document.forms[0];

	var username = form[0].value;
	var password = form[1].value;
	var phone = form[2].value;
	var poc = form[3].value;
	var address = form[4].value;
	var category = form[5].value;


	var URL = "../../backend/api/AddSupplier.php?company="+username+"&password="+password+"&phone_number="+phone+"&poc="+poc+"&address="+address+"&category="+category;
	$.ajax({
		url: URL,
		success: function(data)
		{
			data = JSON.parse(data);
			if(data.success)
			{
				document.location.href="../Homepage";
			}
			else
			{
				alert("Company name is taken.");
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}