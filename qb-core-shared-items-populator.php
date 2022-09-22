<?php
 require("includes/config.inc.php");
 require("includes/functions.inc.php");
 $query1 = "SELECT * FROM `qb-core-shared-items-weapons`";
 $query2 = "SELECT * FROM `qb-core-shared-items`";
 $sql1 = sqlrun($query1);
 $sql2 = sqlrun($query2);
 $fh = fopen(ITEMS,'w');
 $output = null;
 $timestamp = null;
 $timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
 $timestamp = date('YmdHis', $timestamp);
 $output = "-- Date and Time Edited: " . date("Y-m-d H:i:s") . "\rQBShared = QBShared or {}\rQBShared.Items = {\r";
 foreach($sql1 as $k => $v){
   if($v['enabled'] === 'true'){
    $output .= " ['{$v['name']}'] = {['name'] = '{$v['name']}', ['label'] = '{$v['label']}', ['weight'] = {$v['weight']}, ['type'] = '{$v['type']}', ['ammotype'] = '{$v['ammotype']}', ['image'] = '{$v['image']}', ['unique'] = {$v['itemunique']}, ['useable'] = {$v['useable']}, ['description'] = \"{$v['description']}\", ['enabled'] = {$v['enabled']}},\r";
   }
 }
 foreach($sql2 as $k => $v){
   if($v['enabled'] === 'true'){
     $output .= " ['{$v['name']}'] = {['name'] = '{$v['name']}', ['label'] = '{$v['label']}', ['weight'] = {$v['weight']}, ['image'] = '{$v['image']}', ['unique'] = {$v['itemunique']}, ['useable'] = {$v['useable']}, ['shouldClose'] = {$v['shouldClose']}, ['combinable'] = {$v['combinable']}, ['description'] = \"{$v['description']}\", ['enabled'] = {$v['enabled']}},\r";
   }
 }
 $output .= "}";
 if(fwrite($fh,$output)){
  echo "<html><head><title>phpqbadmin Happy Potato</title></head><body><h1>Happy Potato</h1><p>The items.lua file was <em>successfully</em> updated.</p></body></html>";
 }else{
  echo "<html><head><title>phpqbadmin Sad Potato</title></head><body><h1>Sad Potato</h1><p>The items.lua file was <em>not</em> updated.</p></body></html>";
 }
 fclose($fh);
?>