function initCategories(catId)
{
	var URL = "../../backend/api/Categories.php?catId="+catId;
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
	console.log(data);
	data = JSON.parse(data);

	if(data.length>0)
	{
		clearCategoriesExcept(null);
		var URL = "../../backend/api/GetParentCategory.php?catId="+data[0].cid;
		$.ajax({
			url: URL,
			success: function(data)
			{
				data = JSON.parse(data)[0];
				var category = createCategory(data);

				var displayCase = document.getElementById("category-list");
				displayCase.insertBefore(category,displayCase.firstChild);
				if(category["cid"] != 0)
				{
					category.href="javascript:loadParentCategory('"+category["cid"]+"')";
					category.className+=" active";
					category.innerHTML = "<span class='glyphicon glyphicon-chevron-up'></span>" + category.innerHTML;
				}
				else
				{
					category.className+=" active";
					category.href="#";
					//category.innerHTML = "<span class='glyphicon glyphicon-chevron-up'></span>" + category.innerHTML;
				}

				clearItems();
				initItems(category["cid"]);
			},
			error: function(xhr, ajaxOptions, thrownError)
			{
				console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
			}
		});
	}
	else
	{
		clearItems();
		var displayCase = document.getElementById("category-list");
		var category = displayCase.firstChild;
		category.className+=" active";
		category.innerHTML = "<span class='glyphicon glyphicon-chevron-up'></span>" + category.innerHTML;
		initItems(category["cid"]);
	}

	for(var i = 0; i < data.length; i++)
	{
		var cat = data[i];
		var div = createCategory(cat);

		var displayCase = document.getElementById("category-list");
		displayCase.appendChild(div);
	}
}

function loadParentCategory(catId)
{
	var URL = "../../backend/api/GetParentCategory.php?catId="+catId;
	$.ajax({
		url: URL,
		success: function(data)
		{
			clearCategoriesExcept(null);
			data = JSON.parse(data)[0];
			initCategories(data.cid);
		},
		error: function(xhr, ajaxOptions, thrownError)
		{
			console.log("Error on ajax call...\n" + xhr.status + "\n" + thrownError + "\nURL: " + URL);
		}
	});
}

function clearCategoriesExcept(catId)
{
	var displayCase = document.getElementById("category-list");
	var nodes = displayCase.childNodes;
	for(var i = nodes.length - 1; i >= 0; i--)
	{
		if(nodes[i]["cid"] != catId)
		{
			displayCase.removeChild(nodes[i]);
		}
		else
		{
			nodes[i].href="javascript:loadParentCategory('"+nodes[i]["cid"]+"')";
		}
	}
}

function createCategory(cat)
{
	var name = document.createElement("a");
	name.className = "list-group-item";
	name.href="javascript:initCategories('"+cat.cid+"');clearCategoriesExcept('"+cat.cid+"')";
	name.innerHTML = cat.cname;
	name["cid"] = cat.cid;

	return name;
}