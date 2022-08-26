<?php
 require("includes/config.inc.php");
 require("includes/functions.inc.php");
 $query = null;
 $output = null;
 $timestamp = null;
 $garconf = array();
 $garloc = array();
 $query = "SELECT * FROM `qb-garages-config`";
 $garconf = sqlrun($query);
 $query = "SELECT * FROM `qb-garages-locations`";
 $garloc = sqlrun($query);
 $fh = fopen("C:\\Program Files\\FXServer\\txData\\QBCoreFramework\\resources\\[qb]\\qb-garages\\config.lua",'w');
 $timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
 $timestamp = date('YmdHis', $timestamp);
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\rAutoRespawn = {$garconf[0]['autorespawn']}\rSharedGarages = {$garconf[0]['sharedgarages']}\rVisuallyDamageCars = {$garconf[0]['visuallydamagecars']}\rGarages = {\r";
 foreach($garloc as $k => $v){
  $output .= " ['garage{$v['qb-garages-location_id']}'] = {label = '{$v['label']}',takeVehicle = {$v['takevehicle']},spawnVehicle = {$v['spawnvehicle']},blipName = '{$v['label']}',showBlip = {$v['showblip']},blipNumber = {$v['blipnumber']},type = '{$v['type']}',vehicle = '{$v['vehicle']}'";
  if($v['putvehicle']){
   $output .= ",putVehicle = {$v['putvehicle']}";
  }
  if($v['job']){
    $output .= ",job = '{$v['job']}'";
   }
  $output .= "},\r";
 }
 $output .= "}\rHouseGarages = {}";
 if(fwrite($fh,$output)){
  echo "<html><head><title>phpqbadmin Happy Potato</title></head><body><h1>Happy Potato</h1><p>The qb-garages/config.lua file was <em>successfully</em> updated.</p></body></html>";
  fclose($fh);
 }else{
  echo "<html><head><title>phpqbadmin Sad Potato</title></head><body><h1>Sad Potato</h1><p>The qb-garages/config.lua file was <em>not</em> updated.</p></body></html>";
 }
?>