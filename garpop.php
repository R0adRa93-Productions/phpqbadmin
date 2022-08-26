<?php
require("includes/config.inc.php");
$query = null;
$input = null;
$timestamp = null;
$garconf = array();
$garloc = array();
$query = "SELECT * FROM `qb-garages-config`";
$garconf = sqlrun($query);
$query = "SELECT * FROM `qb-garage-locations`";
$garloc = sqlrun($query);
$fh = fopen("C:\\Program Files\\FXServer\\txData\\QBCoreFramework\\resources\\[qb]\\qb-garages\\config.lua",'w');
$timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
$timestamp = date('YmdHis', $timestamp);
$input = "-- Date and Time Edited: " . date("Y-m-d H:i:s")

$input .= "
AutoRespawn = false
SharedGarages = false
VisuallyDamageCars = true

";
foreach($sql as $k => $v){
  $input .= " ['{$v['model']}'] = {['name'] = '{$v['name']}',['brand'] = '{$v['brand']}',['model'] = '{$v['model']}',['price'] = '{$v['price']}',['category'] = '{$v['category']}',['hash'] = '{$v['model']}'},\r";
}
$input .= "}
for _, v in pairs(QBShared.Vehicles) do
 QBShared.VehicleHashes[v.hash] = v
end
";
echo "<h1>{$garloc[0]['autorespawn']}</h1>";
/*
if(fwrite($fh,$input)){
 echo "<html><head><title>vehpop Happy Potato</title></head><body><h1>Happy Potato</h1><p>The vehicles.lua file was <em>successfully</em> updated.</p></body></html>";
 fclose($fh);
}else{
 echo "<html><head><title>vehpop Sad Potato</title></head><body><h1>Sad Potato</h1><p>The vehicles.lua file was <em>not</em> updated.</p></body></html>";
}
*/
function sqlrun($query){
  global $dbinfo;
  global $messages;
  global $lang;
  $dbcon = NULL;
  $result = array();
  $row = array();
  $return = array();
  $dbcon = new mysqli($dbinfo['host'],$dbinfo['username'],$dbinfo['password'],$dbinfo['dbname']);
  if($dbcon->connect_error){
   if(R0ADBUG !== NULL){$messages[] = $dbcon->connect_error;}
   $messages[] = $lang['ersql'];
  }
  if($result = $dbcon->query($query)){
   if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){
     $return[] = $row;
    }
   }else{$return[0]['empty'] = "empty";}
   $result->free();
  }else{
   $return['error'] = "true";
   if(R0ADBUG !== NULL){
    $messages[] = $dbcon->error;
    $messages[] = $query;
   }
   $messages[] = $lang['ersql'];
  }
  $dbcon->close();
  return($return);
 }
?>