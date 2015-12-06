function checkIfLoggedIn(callback)
{
    $.ajax({
        url: "../../backend/api/Login.php?check",
        success: function(data)
        {
            data = JSON.parse(data);
            if(data["success"] != undefined)
            {
                addAccountOptions(data["user"]);
                if(callback != undefined)
                    callback(data);
            }
            else if(data["error"] == "not logged in.")
            {
                addLoginOptions();
                if(callback != undefined)
                    callback(false);
            }
        }
    });
}

function submitLogin()
{
    var username = document.getElementById("login-username");
    var password = document.getElementById("login-password");
    var type = document.getElementById("login-user");
    var loginType="user"
    if(!type.checked)
        loginType="supplier"

    var URL = "../../backend/api/Login.php?user="+username.value+"&pass="+password.value;

    if(loginType=="supplier")
        URL+="&supplier";

    $.ajax({
        url: URL,
        success: function(data)
        {
            data = JSON.parse(data);
            if(data["error"] != undefined)
            {
                var err = document.getElementById("login-error");
                err.style["display"] = "block";
                var errMes = document.getElementById("login-error-message");
                errMes.innerHTML=data["error"];
            }
            else
            {
                var params="";
                if(window.location.href.lastIndexOf("?") != -1)
                    params = window.location.href.substring(window.location.href.lastIndexOf("?"));
                window.location.href="./"+params;
            }
        }
    });
}

function submitLogout()
{
    $.ajax({
        url: "../../backend/api/Login.php?logout",
        success: function(data)
        {
            var params="";
                if(window.location.href.lastIndexOf("?") != -1)
                    params = window.location.href.substring(window.location.href.lastIndexOf("?"));
            window.location.href="./"+params;
        }
    });
}

function addAccountOptions(username)
{
    var nav = document.getElementById("navbar-buttons");
    nav.innerHTML+=
    "<li id='account-button'>"
        +"<a href='../Account/'>"+username+"</a>"
    +"</li>";

    nav.innerHTML+=
    "<li id='account-button'>"
        +"<a href='javascript:submitLogout();'>Log out</a>"
    +"</li>";
}

//http://bootsnipp.com/snippets/featured/clean-modal-login-form
function addLoginOptions()
{
    var nav = document.getElementById("navbar-buttons");
    nav.innerHTML+=
    "<li id='login-button'>"
        +"<a href='#' data-toggle='modal' data-target='#login-modal'>Login</a>"
    +"</li>";

    document.body.innerHTML+=
    "<div class='modal fade' id='login-modal' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true' style='display: none;'>"
        +"<div class='modal-dialog'>"
            +"<div class='loginmodal-container'>"
                +"<h1>Login to Your Account</h1><br>"
                +"<form>"
                +"    <input id='login-username' type='text' name='user' placeholder='Username'>"
                +"    <input id='login-password' type='password' name='pass' placeholder='Password'>"
                +"    <input id='login-user' type='radio' name='sex' value='User' checked='true'>User</input>"
                +"    <input type='radio' name='sex' value='Supplier'>Supplier</input>"
                +"    <input type='submit' name='login' class='login loginmodal-submit' value='Login' onclick='submitLogin();return false;'>"
                +"</form>"

                +"<div id='login-error' class='alert alert-danger' role='alert' style='display: none;'>"
                    +"<span class='glyphicon glyphicon-exclamation-sign' aria-hidden='true'></span>"
                    +"<span class='sr-only'>Error:</span><span id='login-error-message'>Invalid credentials.</span>"
                +"</div>"

                +"<div class='login-help'>"
                    +"<a href='../registeruser'>Register User</a> - <a href='../registersupplier'>Register Supplier</a>"
                +"</div>"
            +"</div>"
        +"</div>"
    +"</div>";
}