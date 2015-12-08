function init()
{
	checkIfLoggedIn(function(data){
		if(data != false)
		{
			if(data["supplier"])
			{
				var wishlist = document.getElementById("wishlist");
				wishlist.parentNode.removeChild(wishlist);
				var URL = "../../backend/api/Supplier.php";
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
			else
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
		}
		else
		{
			window.location.href = "../homepage/";
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
		if(data["company_name"] == undefined)
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
					{
						address.innerHTML+="<a type='button' class='btn btn-sm btn-success pull-right' onclick='addAddress();'><span class='glyphicon glyphicon-plus'></span></a>";
						return;
					}
					//address.innerHTML = dat[0]["street"]+" "+dat[0]["city"]+", "+dat[0]["astate"]+" "+dat[0]["zip"]+" Apt #"+dat[0]["apt_number"];
					//"<a type='button' class='btn btn-sm btn-danger pull-right' onclick=\"removeAddress(\'"+addr+"\');\"><span class='glyphicon glyphicon-minus'></span></a>";
					var div = document.createElement("div");
					div.innerHTML = dat[0]["street"]+" "+dat[0]["city"]+", "+dat[0]["astate"]+" "+dat[0]["zip"]+" <br>Apt #"+dat[0]["apt_number"];
					
					var a = document.createElement("div");
					a.type="button";
					a.className="btn btn-sm btn-danger pull-right";
					a.onclick = function(){removeAddress(dat[0])};
					//a.addEventListener("click",function(){alert();}, false);
					a.innerHTML="<span class='glyphicon glyphicon-minus'></span>";
					div.appendChild(a);
					address.appendChild(div);


					for(var i = 1; i < dat.length; i++)
					{
						//addr = JSON.stringify(dat[i]);
						//address.innerHTML+="<br><div>"+dat[i]["street"]+" "+dat[i]["city"]+", "+dat[i]["astate"]+" "+dat[i]["zip"]+" Apt #"+dat[i]["apt_number"];
						//					+"<a type='button' class='btn btn-sm btn-danger pull-right' onclick=\"removeAddress(\'"+addr+"\');\"><span class='glyphicon glyphicon-minus'></span></a></div>";

						var div = document.createElement("div");
						div.innerHTML = dat[i]["street"]+" "+dat[i]["city"]+", "+dat[i]["astate"]+" "+dat[i]["zip"]+" <br>Apt #"+dat[i]["apt_number"];
						
						var a = document.createElement("div");
						a.type="button";
						a.className="btn btn-sm btn-danger pull-right";
						//a.onclick = function(){removeAddress(dat[i])};
						a.onclick = function(e,c){
							removeAddress(e);
						};
						a.onclick = a.onclick.bind(null,dat[i]);
						//a.addEventListener("click",function(){alert();}, false);
						a.innerHTML="<span class='glyphicon glyphicon-minus'></span>";
						div.appendChild(a);
						address.appendChild(document.createElement("br"));
						address.appendChild(div);
					}

					//address.innerHTML+="<br><br><a type='button' class='btn btn-sm btn-success pull-right' onclick='addAddress();'><span class='glyphicon glyphicon-plus'></span></a>";
					address.appendChild(document.createElement("br"));
					a = document.createElement("div");
					a.type="button";
					a.className="btn btn-sm btn-success pull-right";
					a.onclick = function(){addAddress()};
					//a.addEventListener("click",function(){alert();}, false);
					a.innerHTML="<span class='glyphicon glyphicon-plus'></span>";
					address.appendChild(a);
				}
			});

			$.ajax({
				url: "../../backend/api/Phone.php?userName=" + data["username"],
				success: function(dat){
					dat = JSON.parse(dat);
					var phone = document.getElementById("phone");
					if(dat.length == 0)
					{
						phone.innerHTML+="<a type='button' class='btn btn-sm btn-success pull-right' onclick='addPhone();'><span class='glyphicon glyphicon-plus'></span></a>";
						return;
					}
					/*
					phone.innerHTML = formatPhone(dat[0]["number"]);

					for(var i = 1; i < dat.length; i++)
					{
						phone.innerHTML+="<br>"+formatPhone(dat[i]["number"]);
					}

					phone.innerHTML+="<a type='button' class='btn btn-sm btn-success pull-right' onclick='addPhone();'><span class='glyphicon glyphicon-plus'></span></a>";*/
					var div = document.createElement("div");
					div.innerHTML = formatPhone(dat[0]["number"]);
					
					var a = document.createElement("div");
					a.type="button";
					a.className="btn btn-sm btn-danger pull-right";
					a.onclick = function(){removePhone(dat[0]["number"])};
					//a.addEventListener("click",function(){alert();}, false);
					a.innerHTML="<span class='glyphicon glyphicon-minus'></span>";
					div.appendChild(a);
					phone.appendChild(div);

					;

					for(var i = 1; i < dat.length; i++)
					{

						//addr = JSON.stringify(dat[i]);
						//address.innerHTML+="<br><div>"+dat[i]["street"]+" "+dat[i]["city"]+", "+dat[i]["astate"]+" "+dat[i]["zip"]+" Apt #"+dat[i]["apt_number"];
						//					+"<a type='button' class='btn btn-sm btn-danger pull-right' onclick=\"removeAddress(\'"+addr+"\');\"><span class='glyphicon glyphicon-minus'></span></a></div>";

						var div = document.createElement("div");
						div.innerHTML = formatPhone(dat[i]["number"]);
						
						var a = document.createElement("div");
						a.type="button";
						a.className="btn btn-sm btn-danger pull-right";

						a.onclick = function(e,c){
							removePhone(e);
						};
						a.onclick = a.onclick.bind(null,dat[i]["number"]);

						//a.addEventListener("click",function(){alert();}, false);
						a.innerHTML="<span class='glyphicon glyphicon-minus'></span>";
						div.appendChild(a);
						phone.appendChild(document.createElement("br"));
						phone.appendChild(div);
					}

					//address.innerHTML+="<br><br><a type='button' class='btn btn-sm btn-success pull-right' onclick='addAddress();'><span class='glyphicon glyphicon-plus'></span></a>";
					phone.appendChild(document.createElement("br"));
					a = document.createElement("div");
					a.type="button";
					a.className="btn btn-sm btn-success pull-right";
					a.onclick = function(){addPhone()};
					//a.addEventListener("click",function(){alert();}, false);
					a.innerHTML="<span class='glyphicon glyphicon-plus'></span>";
					phone.appendChild(a);
				}
			});

			$.ajax({
				url: "../../backend/api/CreditCard.php?userName=" + data["username"],
				success: function(dat){
					dat = JSON.parse(dat);
					var address = document.getElementById("creditcard");
					if(dat["error"] != undefined)
					{
						address.innerHTML+="<a type='button' class='btn btn-sm btn-success pull-right' onclick='addCreditCard();'><span class='glyphicon glyphicon-plus'></span></a>";
						return;
					}
					//address.innerHTML = dat[0]["street"]+" "+dat[0]["city"]+", "+dat[0]["astate"]+" "+dat[0]["zip"]+" Apt #"+dat[0]["apt_number"];
					//"<a type='button' class='btn btn-sm btn-danger pull-right' onclick=\"removeAddress(\'"+addr+"\');\"><span class='glyphicon glyphicon-minus'></span></a>";
					var div = document.createElement("div");
					div.innerHTML = dat[0]["cnumber"]+" "+dat[0]["cname"]+", "+dat[0]["ctype"]+" "+dat[0]["expiration"];
					
					var a = document.createElement("div");
					a.type="button";
					a.className="btn btn-sm btn-danger pull-right";
					a.onclick = function(){removeCreditCard(dat[0])};
					//a.addEventListener("click",function(){alert();}, false);
					a.innerHTML="<span class='glyphicon glyphicon-minus'></span>";
					div.appendChild(a);
					address.appendChild(div);


					for(var i = 1; i < dat.length; i++)
					{
						//addr = JSON.stringify(dat[i]);
						//address.innerHTML+="<br><div>"+dat[i]["street"]+" "+dat[i]["city"]+", "+dat[i]["astate"]+" "+dat[i]["zip"]+" Apt #"+dat[i]["apt_number"];
						//					+"<a type='button' class='btn btn-sm btn-danger pull-right' onclick=\"removeAddress(\'"+addr+"\');\"><span class='glyphicon glyphicon-minus'></span></a></div>";

						var div = document.createElement("div");
						div.innerHTML = dat[i]["cnumber"]+" "+dat[i]["cname"]+", "+dat[i]["ctype"]+" "+dat[i]["expiration"];
						
						var a = document.createElement("div");
						a.type="button";
						a.className="btn btn-sm btn-danger pull-right";
						//a.onclick = function(){removeCreditCard(dat[i]);};
						a.onclick = function(e,c){
							removeCreditCard(e);
						};
						a.onclick = a.onclick.bind(null,dat[i]);
						//a.addEventListener("click",function(){alert();}, false);
						a.innerHTML="<span class='glyphicon glyphicon-minus'></span>";
						div.appendChild(a);
						address.appendChild(document.createElement("br"));
						address.appendChild(div);
					}

					//address.innerHTML+="<br><br><a type='button' class='btn btn-sm btn-success pull-right' onclick='addAddress();'><span class='glyphicon glyphicon-plus'></span></a>";
					address.appendChild(document.createElement("br"));
					a = document.createElement("div");
					a.type="button";
					a.className="btn btn-sm btn-success pull-right";
					a.onclick = function(){addCreditCard()};
					//a.addEventListener("click",function(){alert();}, false);
					a.innerHTML="<span class='glyphicon glyphicon-plus'></span>";
					address.appendChild(a);
				}
			});
		}
		else
		{
			var name = document.getElementById("uname");
			name.innerHTML = data["poc"];

			var username = document.getElementById("username");
			username.innerHTML = data["company_name"];
			var usernameTitle = document.getElementById("username-title");
			usernameTitle.innerHTML = "Company Name";

			var dob = document.getElementById("dob");
			dob.innerHTML = data["address"];
			var dobTitle = document.getElementById("dob-title");
			dobTitle.innerHTML = "Address";

			var gender = document.getElementById("gender");
			gender.innerHTML = data["category"];
			var genderTitle = document.getElementById("gender-title");
			genderTitle.innerHTML = "Category";

			var email = document.getElementById("email");
			email.innerHTML = data["phone"];
			var emailTitle = document.getElementById("email-title");
			emailTitle.innerHTML = "Phone Number";

			var address = document.getElementById("address");
			var addressTitle = document.getElementById("address-title");
			address.parentNode.removeChild(address);
			addressTitle.parentNode.removeChild(addressTitle);

			var phone = document.getElementById("phone");
			var phoneTitle = document.getElementById("phone-title");
			phone.parentNode.removeChild(phone);
			phoneTitle.parentNode.removeChild(phoneTitle);

		}
	}
}

function addAddress()
{
	var street = prompt("Enter the street:","street");
	var city = prompt("Enter the city:","city");
	var state = prompt("Enter the state:","state");
	var zip = prompt("Enter the zip:",12345);
	var apt = prompt("Enter the appartment number:",1);

	var address = {
		street: street,
		city: city,
		astate: state,
		zip: zip,
		apt_number: apt
	};

	$.ajax({
		url: "../../backend/api/AddAddress.php?address=" + JSON.stringify(address,"",""),
		success: function(dat){
			dat = JSON.parse(dat);
			if(dat["success"])
			{
				location.reload();
			}
			else
			{
				alert(dat["error"]);
			}
		}
	});
}

function removeAddress(address)
{
	$.ajax({
		url: "../../backend/api/AddAddress.php?remove&address=" + JSON.stringify(address,"",""),
		success: function(dat){
			dat = JSON.parse(dat);
			if(dat["success"])
			{
				location.reload();
			}
			else
			{
				alert(dat["error"]);
			}
		}
	});
}

function addCreditCard()
{
	var street = prompt("Enter the number:","123456789");
	var city = prompt("Enter the name on the card:","John Smith");
	var state = prompt("Enter the card type:","VISA");
	var zip = prompt("Enter the expiration:","2020-12-27");

	var card = {
		cnumber: street,
		cname: city,
		ctype: state,
		expiration: zip
	};

	$.ajax({
		url: "../../backend/api/AddCreditCard.php?card=" + JSON.stringify(card,"",""),
		success: function(dat){
			dat = JSON.parse(dat);
			if(dat["success"])
			{
				document.location.reload();
			}
			else
			{
				alert(dat["error"]);
			}
		}
	});
}

function removeCreditCard(card)
{
	$.ajax({
		url: "../../backend/api/AddCreditCard.php?remove&card=" + JSON.stringify(card,"",""),
		success: function(dat){
			dat = JSON.parse(dat);
			if(dat["success"])
			{
				location.reload();
			}
			else
			{
				alert(dat["error"]);
			}
		}
	});
}

function addPhone()
{
	var number = prompt("Enter your phone number:\nX+(XXX)XXX-XXXX","1+(123)123-1234");
	number = number.replace('+',"");
	number = number.replace('(',"");
	number = number.replace(')',"");
	number = number.replace('-',"");
	if(isNaN(number))
	{
		alert("Incorrect format");
	}
	else
	{
		$.ajax({
			url: "../../backend/api/AddPhone.php?number=" + number,
			success: function(dat){
				dat = JSON.parse(dat);
				if(dat["success"])
				{
					location.reload();
				}
				else
				{
					alert(dat["error"]);
				}
			}
		});
	}
}

function removePhone(number)
{
	$.ajax({
		url: "../../backend/api/AddPhone.php?remove&number=" + number,
		success: function(dat){
			dat = JSON.parse(dat);
			if(dat["success"])
			{
				location.reload();
			}
			else
			{
				alert(dat["error"]);
			}
		}
	});
}

function formatPhone(phone)
{
	return phone[0] + "+(" + phone.substring(1,4) + ")" + phone.substring(4,7) + "-" + phone.substring(7);
}