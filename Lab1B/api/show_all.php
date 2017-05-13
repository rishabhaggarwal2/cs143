<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

$db_connection = mysql_connect("localhost", "cs143", "");
if(!$db_connection) {
    $errmsg = mysql_error($db_connection);
    print "Connection failed: $errmsg <br />";
    exit(1);
}
mysql_select_db("CS143", $db_connection);
$param = "SELECT title, year, rating FROM Movie";
$result = mysql_query($param, $db_connection);

$outp = "";
$count = 0;
while($rs = mysql_fetch_array($result, MYSQL_ASSOC)) {
	// $count :
    if ($outp != "") {
    	$outp .= ",";
    }
    $outp .= '{"first":"'  . $rs["title"] . '",';
    $outp .= '"last":"'   . $rs["year"]        . '",';
    $outp .= '"id":"'. $rs["rating"]     . '"}';
}
$outp ='{"records":['.$outp.']}';

mysql_free_result($result);
mysql_close($db_connection);

// $outp ='{"records":[{"first": "hello", "last": "none"},{"first": "hello", "last": "none"}]}';

echo($outp);
?>