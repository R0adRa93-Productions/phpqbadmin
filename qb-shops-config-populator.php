<?php
 require("includes/config.inc.php");
 $query = null;
 $output = null;
 $timestamp = null;
 $shopconf = array();
 $shopprod = array();
 $shoplist = array();
 $cnt = 0;
 $store = null;
 $query = "SELECT * FROM `qb-shops-config`";
 $shopconf = sqlrun($query);
 $query = "SELECT * FROM `qb-shops-config-products` ORDER BY `shops` ASC";
 $shopprod = sqlrun($query);
 $query = "SELECT * FROM `qb-shops-config-locations`";
 $shoplocs = sqlrun($query);
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\r\nConfig = {}\r\nConfig.UseTarget = GetConvar('UseTarget','false') == 'true' -- Do not touch use server config file\r\nConfig.ShopsInvJsonFile = './json/shops-inventory.json' -- do not touch\r\nConfig.FirearmsLicenseCheck = {$shopconf[0]['firearmslicensecheck']}\r\nConfig.SellCasinoChips = {coords = {$shopconf[0]['sellcasinochips-coords']},radius = {$shopconf[0]['sellcasinochips-radius']},ped = '{$shopconf[0]['sellcasinochips-ped']}'}\r\nConfig.Products = {\r\n";
 foreach($shopprod as $k => $v){
  if($v['enabled'] === 'true'){
   if($store != $v['shops']){
    if($store !== null){$output .= " },\r\n";}
    $output .= " ['{$v['shops']}'] = {\r\n";
    $store = $v['shops'];
    $cnt = 0;
   }
   $cnt++;
   $output .= "  [$cnt] = {[\"name\"] = \"{$v['name']}\",[\"price\"] = {$v['price']},[\"amount\"] = {$v['amount']},[\"type\"] = \"{$v['type']}\",[\"slot\"] = $cnt";
   if(isset($v['requiredJob'])){
    $output .= ",requiredJob = \"{$v['requiredJob']}\"";
   }
   if(isset($v['info'])){
    $output .= ",[\"info\"] = {{$v['info']}}";
   }else{
    $output .= ",[\"info\"] = {}";
   }
   if($v['requiresLicense'] === 'true') {
    $output .= ",requiresLicense = {$v['requiresLicense']}";
   }
   $output .= "},\r\n";
  }
 }
 $output .= " }\r\n}\r\nConfig.Locations = {\r\n";
 foreach($shoplocs as $k => $v){
  $output .= " [\"{$v['name']}\"] = {[\"name\"] = \"{$v['name']}\",[\"label\"] = \"{$v['label']}\",[\"coords\"] = {$v['coords']},[\"ped\"] = \"{$v['ped']}\",[\"scenario\"] = \"{$v['scenario']}\",[\"radius\"] = {$v['radius']},[\"targetIcon\"] = \"{$v['targetIcon']}\",[\"targetLabel\"] = \"{$v['targetLabel']}\",[\"products\"] = Config.Products[\"{$v['products']}\"],[\"showblip\"] = {$v['showblip']},[\"blipsprite\"] = {$v['blipsprite']},[\"blipscale\"] = {$v['blipscale']},[\"blipcolor\"] = {$v['blipcolor']}";
  if($v['type'] !== ''){
   $output .= ",[\"type\"] = \"{$v['type']}\"";
  }
  $output .= "},\r\n";
 }
 $output .= "}";
 write_config(QB_SHOPS_CONFIG,$output);
?>