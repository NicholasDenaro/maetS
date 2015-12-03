function submitRegistration()
{
	var form = document.forms[0];

	var username = form[0].value;
	var password = form[1].value;
	var email = form[2].value;
	var name = form[3].value;
	var dob = form[4].value;
	var gender = form[5].value;
	var income = form[6].value;

	var URL = "../../backend/api/AddUser.php?username="+username+"&password="+password+"&email="+email+"&name="+name+"&dob="+dob+"&gender="+gender+"&income="+income;
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
				alert("User name is taken.");
			}
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}