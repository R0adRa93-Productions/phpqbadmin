<?php
require("includes/config.inc.php");
require("includes/functions.inc.php");
$query = "SELECT * FROM `qb-core-shared-vehicles`";
$sql = sqlrun($query);
$fh = fopen(VEHICLES,'w');
$counta = null;
$countb = null;
$output = null;
$timestamp = null;
$timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
$timestamp = date('YmdHis', $timestamp);
$output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "
QBShared = QBShared or {}
QBShared.Vehicles = {}
QBShared.VehicleHashes = {}
QBShared.Vehicles = {
";
$counta = count($sql);
foreach($sql as $k => $v){
  $counta--;
  if($v['enabled'] === 'true'){
   $output .= " ['{$v['model']}'] = {['name'] = '{$v['name']}',['brand'] = '{$v['brand']}',['model'] = '{$v['model']}',['price'] = '{$v['price']}',['category'] = '{$v['category']}',['hash'] = '{$v['model']}',['store'] = {";
   $v['store'] = explode(',',$v['store']);
   $countb = count($v['store']);
   foreach($v['store'] as $k => $v){
    $count--;
    $output .= "'{$v}'";
    if($count > 0){$output .= ",";}
   }
   $output .= "}}";
   if($counta > 0){$output .= ",";}
   $output .= "\r\n";
  }
}
$output .= "}
for _, v in pairs(QBShared.Vehicles) do
 QBShared.VehicleHashes[v.hash] = v
end
";
if(fwrite($fh,$output)){
 echo "<html><head><title>phpqbadmin Happy Potato</title></head><body><h1>Happy Potato</h1><p>The vehicles.lua file was <em>successfully</em> updated.</p></body></html>";
}else{
 echo "<html><head><title>phpqbadmin Sad Potato</title></head><body><h1>Sad Potato</h1><p>The vehicles.lua file was <em>not</em> updated.</p></body></html>";
}
fclose($fh);
?>