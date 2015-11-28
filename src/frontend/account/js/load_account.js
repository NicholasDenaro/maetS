function init()
{
	var URL = "../../backend/api/User.php";
	$.ajax({
		url: URL,
		success: function(data)
		{
			processResponse(data);
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function processResponse(data)
{
	data = JSON.parse(data);
	data = data[0];
	if(data == undefined)
	{
		window.location.href = "../homepage/";
	}
	else
	{
		var name = document.getElementById("uname");
		name.innerHTML = data["uname"];

		var username = document.getElementById("username");
		username.innerHTML = data["username"];

		var dob = document.getElementById("dob");
		dob.innerHTML = data["dob"];

		var gender = document.getElementById("gender");
		gender.innerHTML = data["gender"];

		var email = document.getElementById("email");
		email.innerHTML = data["email"];
		email.href = "mailto:" + data["email"];

		$.ajax({
			url: "../../backend/api/Address.php?userName=" + data["username"],
			success: function(dat){
				dat = JSON.parse(dat);
				var address = document.getElementById("address");
				if(dat.length == 0)
					return;
				address.innerHTML = dat[0]["street"]+" "+dat[0]["city"]+", "+dat[0]["astate"]+" "+dat[0]["zip"]+" Apt #"+dat[0]["apt_number"];

				for(var i = 1; i < dat.length; i++)
				{
					address.innerHTML+="<br>"+dat[i]["street"]+" "+dat[i]["city"]+", "+dat[i]["astate"]+" "+dat[i]["zip"]+" Apt #"+dat[i]["apt_number"];
				}
			}
		});

		$.ajax({
			url: "../../backend/api/Phone.php?userName=" + data["username"],
			success: function(dat){
				dat = JSON.parse(dat);
				if(dat.length == 0)
					return;
				var phone = document.getElementById("phone");
				phone.innerHTML = formatPhone(dat[0]["number"]);

				for(var i = 1; i < dat.length; i++)
				{
					phone.innerHTML+="<br>"+formatPhone(dat[i]["number"]);
				}
			}
		});
	}
}

function formatPhone(phone)
{
	return phone[0] + " (" + phone.substring(1,4) + ")" + phone.substring(4,7) + "-" + phone.substring(7);
}