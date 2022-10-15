<?php
require("includes/config.inc.php");
$query = "SELECT * FROM `qb-core-shared-vehicles`";
$sql = sqlrun($query);
$cnt = null;
$output = null;
$output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\r\nQBShared = QBShared or {}\r\nQBShared.Vehicles = {}\r\nQBShared.VehicleHashes = {}\r\nQBShared.Vehicles = {\r\n";
foreach($sql as $k => $v){
  if($v['enabled'] === 'true'){
   $output .= " [\"{$v['model']}\"] = {[\"name\"] = \"{$v['name']}\",[\"brand\"] = \"{$v['brand']}\",[\"model\"] = \"{$v['model']}\",[\"price\"] = {$v['price']},[\"category\"] = \"{$v['category']}\",[\"categoryLabel\"] = \"{$v['categorylabel']}\",[\"hash\"] = `{$v['model']}`,[\"shop\"] = {";
    $v['shop'] = explode(",",$v['shop']);
    $cnt = count($v['shop']);
    foreach($v['shop'] as $k2 => $v2){
      $cnt--;
      $output .= "\"$v2\"";
      if($cnt > 0){$output .= ",";}
    }
    $output .= "}},\r\n";
  }
}
$output .= "}\r\nfor _, v in pairs(QBShared.Vehicles) do\r\n QBShared.VehicleHashes[v.hash] = v\r\nend";
write_config(QB_CORE_SHARED_VEHICLES,$output);
?>