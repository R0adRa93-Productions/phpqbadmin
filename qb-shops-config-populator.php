<?php
 require("includes/config.inc.php");
 require("includes/functions.inc.php");
 $query = null;
 $output = null;
 $timestamp = null;
 $shopconf = array();
 $shopprod = array();
 $query = "SELECT * FROM `qb-shops-config`";
 $shopconf = sqlrun($query);
 $query = "SELECT * FROM `qb-shops-products`";
 $shopprod = sqlrun($query);
 $fh = fopen(SHOPS,'w');
 $timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
 $timestamp = date('YmdHis', $timestamp);
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\r\n0Config.UseTarget = GetConvar('UseTarget', 'false') == 'true',\r\nConfig.FirearmsLicenseCheck = {$shopconf[0]['firearmlicensecheck']},\r\nConfig.SellCasinoChips = {coords = {$shopconf[0]['sellcasinochips-coords']}, radius = {$shopconf[0]['sellcasinochips-radius']}, ped = '$shopconf[0]['sellcasinochips-ped']'}";
 foreach($shopprod as $k => $v){
  if($v['enabled'] === 'true'){
   $output .= " ['shop{$v['qb-shops-location_id']}'] = {
   label = '{$v['label']}',
   blipName = '{$v['label']}',
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
 $output .= "}\rHouseshops = {}";
 if(fwrite($fh,$output)){
  echo "<html><head><title>phpqbadmin Happy Potato</title></head><body><h1>Happy Potato</h1><p>The qb-shops/config.lua file was <em>successfully</em> updated.</p></body></html>";
  fclose($fh);
 }else{
  echo "<html><head><title>phpqbadmin Sad Potato</title></head><body><h1>Sad Potato</h1><p>The qb-shops/config.lua file was <em>not</em> updated.</p></body></html>";
 }
?>