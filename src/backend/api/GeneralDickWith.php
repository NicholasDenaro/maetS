<?php

require_once("ApiLibrary.php");

//echo json_encode(getParentCategory("432g7h6g45435ff"));

//$headers = "From: SteamBackwards@gmail.com\r\nReply-To: SteamBackwards@gmail.com\r\nX-Mailer: PHP/".phpversion();

//set_time_limit(1000);
echo mail("SteamBackwards@gmail.com","subject","message");

?>