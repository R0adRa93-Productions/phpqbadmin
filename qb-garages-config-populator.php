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
 $fh = fopen(GARAGES,'w');
 $timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
 $timestamp = date('YmdHis', $timestamp);
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\rAutoRespawn = {$garconf[0]['autorespawn']}\rSharedGarages = {$garconf[0]['sharedgarages']}\rVisuallyDamageCars = {$garconf[0]['visuallydamagecars']}\rGarages = {\r";
 foreach($garloc as $k => $v){
  if($v['enabled'] === 'true'){
   $output .= " ['garage{$v['name']}'] = {
   label = '{$v['label']}',
   blipName = '{$v['blipname']}',
   showBlip = {$v['showblip']},
   blipNumber = {$v['blipnumber']},
   takeVehicle = {$v['takevehicle']},
   spawnPoint = {$v['spawnpoint']},
   type = '{$v['type']}',
   vehicle = '{$v['vehicle']}'";
   if($v['putvehicle']){
    $output .= ",\r  putVehicle = {$v['putvehicle']}";
   }
   if($v['job']){
     $output .= ",\r  job = '{$v['job']}'";
    }
   $output .= "\r },\r";
  }
 }
 $output .= "}\rHouseGarages = {}";
 if(fwrite($fh,$output)){
  echo "<html><head><title>phpqbadmin Happy Potato</title></head><body><h1>Happy Potato</h1><p>The qb-garages/config.lua file was <em>successfully</em> updated.</p></body></html>";
  fclose($fh);
 }else{
  echo "<html><head><title>phpqbadmin Sad Potato</title></head><body><h1>Sad Potato</h1><p>The qb-garages/config.lua file was <em>not</em> updated.</p></body></html>";
 }
?>