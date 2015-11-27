function initCategories()
{
	var URL = "../../backend/api/Categories.php?catId=432g7h6g45435ff";
	$.ajax({
		url: URL,
		success: function(data)
		{
			processCategoryResponse(data);
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function processCategoryResponse(data)
{
	data = JSON.parse(data);
	for(var i = 0; i < data.length; i++)
	{
		var cat = data[i];
		var div = createCategory(cat);

		var displayCase = document.getElementById("category-list");
		displayCase.appendChild(div);
	}
}

function createCategory(cat)
{
	var name = document.createElement("a");
	name.className = "list-group-item";
	name.href="./?catId="+cat.cid;
	name.innerHTML = cat.cname;

	return name;
}