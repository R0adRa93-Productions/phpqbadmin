<?php
 require("includes/config.inc.php");
 $query1 = "SELECT * FROM `qb-core-shared-items-weapons`";
 $query2 = "SELECT * FROM `qb-core-shared-items`";
 $sql1 = sqlrun($query1);
 $sql2 = sqlrun($query2);
 $output = null;
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\rQBShared = QBShared or {}\rQBShared.Items = {\r";
 foreach($sql1 as $k => $v){
  if($v['enabled'] === 'true'){
   $output .= " [\"{$v['name']}\"] = {[\"name\"] = \"{$v['name']}\",[\"label\"] = \"{$v['label']}\",[\"weight\"] = {$v['weight']},[\"type\"] = \"{$v['type']}\",[\"ammotype\"] = \"{$v['ammotype']}\",[\"image\"] = \"{$v['image']}\",[\"unique\"] = {$v['itemunique']},[\"useable\"] = {$v['useable']},[\"description\"] = \"{$v['description']}\",[\"enabled\"] = {$v['enabled']}";
   if(isset($v['expire'])){
    $output .= ",[\"expire\"] = {$v['expire']}";
   }
   $output .= "},\r\n";
  }
 }
 foreach($sql2 as $k => $v){
  if($v['enabled'] === 'true'){
   $output .= " [\"{$v['name']}\"] = {[\"name\"] = \"{$v['name']}\",[\"label\"] = \"{$v['label']}\",[\"weight\"] = {$v['weight']},[\"image\"] = \"{$v['image']}\",[\"unique\"] = {$v['itemunique']},[\"useable\"] = {$v['useable']},[\"shouldClose\"] = {$v['shouldClose']},[\"combinable\"] = {$v['combinable']},[\"description\"] = \"{$v['description']}\",[\"enabled\"] = {$v['enabled']}";
   if(isset($v['expire'])){
    $output .= ",[\"expire\"] = {$v['expire']}";
   }
   $output .= "},\r\n";
  }
 }
 $output .= "}";
 write_config(QB_CORE_SHARED_ITEMS,$output);
?>