<?php
 require("includes/config.inc.php");
 $query = null;
 $output = null;
 $timestamp = null;
 $garconf = array();
 $garloc = array();
 $query = "SELECT * FROM `qb-garages-config`";
 $garconf = sqlrun($query);
 $query = "SELECT * FROM `qb-garages-locations`";
 $garloc = sqlrun($query);
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\r\nConfig = Config or {}\r\nConfig.AutoRespawn = {$garconf[0]['autorespawn']}\r\nConfig.SharedGarages = {$garconf[0]['sharedgarages']}\r\nConfig.VisuallyDamageCars = {$garconf[0]['visuallydamagecars']}\r\nConfig.Garages = {\r\n";
 foreach($garloc as $k => $v){
  if($v['enabled'] === 'true'){
   $output .= " [\"{$v['name']}\"] = {[\"label\"] = \"{$v['label']}\",[\"blipName\"] = \"{$v['blipname']}\",[\"showBlip\"] = {$v['showblip']},[\"blipNumber\"] = {$v['blipnumber']},[\"takeVehicle\"] = {$v['takevehicle']},[\"spawnPoint\"] = {$v['spawnpoint']},[\"type\"] = \"{$v['type']}\",[\"vehicle\"] = \"{$v['vehicle']}\"";
   if($v['putvehicle']){
    $output .= ",[\"putVehicle\"] = {$v['putvehicle']}";
   }
   if($v['job']){
     $output .= ",[\"job\"] = '{$v['job']}'";
   }
   $output .= "},\r\n";
  }
 }
 $output .= "}\r\nConfig.HouseGarages = {}";
 write_config(QB_GARAGES_CONFIG,$output);
?>