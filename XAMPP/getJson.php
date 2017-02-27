
//Create database in mysql XAMPP Server and store this file in htdocs
<?php
$link = mysql_pconnect("localhost", "chaitanya", "") or die("Could not connect");
mysql_select_db("testDB") or die("Could not select database");
 
$arr = array();
 
$rs = mysql_query("SELECT * FROM test1");
 
while($obj = mysql_fetch_object($rs)) {
$arr[] = $obj;
}
echo '{"results":'.json_encode($arr).'}';
?>
