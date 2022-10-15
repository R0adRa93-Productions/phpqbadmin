<?php
 require("includes/config.inc.php");
 $query = null;
 $output = null;
 $path = null;
 $path = 'qb-drugs/config.lua';
 $s0 = array();
 $s1 = array();
 $s2 = array();
 $s3 = array();
 $s4 = array();
 $cnt = 0;
 $query = "SELECT * FROM `qb-drugs-config`";
 $s0 = sqlrun($query);
 $query = "SELECT * FROM `qb-drugs-config-deliveryitems`";
 $s1 = sqlrun($query);
 $query = "SELECT * FROM `qb-drugs-config-deliverylocations`";
 $s2 = sqlrun($query);
 $query = "SELECT * FROM `qb-drugs-config-drugsprice`";
 $s3 = sqlrun($query);
 $query = "SELECT * FROM `qb-drugs-config-products`";
 $s4 = sqlrun($query);
 $output = "Config = Config or {}\r\nConfig.Dealers = {}\r\nConfig.UseTarget = GetConvar('UseTarget','false') == '{$s0[0]['usetarget']}'\r\nConfig.PoliceCallChance = {$s0[0]['policecallchance']}\r\nConfig.SuccessChance = {$s0[0]['successchance']}\r\nConfig.ScamChance = {$s0[0]['scamchance']}\r\nConfig.RobberyChance = {$s0[0]['robberychance']}\r\nConfig.MinimumDrugSalePolice = {$s0[0]['minimumdrugsalepolice']}\r\nConfig.UseMarkedBills = '{$s0[0]['usemarkedbills']}'\r\nConfig.DeliveryRepGain = {$s0[0]['deliveryrepgain']}\r\nConfig.DeliveryRepLoss = {$s0[0]['deliveryreploss']}\r\nConfig.PoliceDeliveryModifier = {$s0[0]['policedeliverymodifer']}\r\nConfig.WrongAmountFee = {$s0[0]['wrongamountfee']}\r\nConfig.OverdueDeliveryFee = {$s0[0]['overduedeliveryfee']}\r\nConfig.DeliveryItems = {";
 foreach($s1 as $k => $v){
  $cnt++;
  $output .= "\r\n [$cnt] = {[\"item\"] = \"{$v['item']}\",[\"minrep\"] = {$v['minrep']},[\"payout\"] = {$v['payout']}},";
 }
 $cnt = 0;
 $output .= "\r\n}\r\nConfig.DeliveryLocations = {";
 foreach($s2 as $k => $v){
    $cnt++;
    $output .= "\r\n [$cnt] = {[\"label\"] = \"{$v['label']}\",[\"coords\"] = {$v['coords']}},";
 }
 $output .= "\r\n}\r\nConfig.DrugsPrice = {";
 foreach($s3 as $k => $v){
    $output .= "\r\n [\"{$v['name']}\"] = {[\"min\"] = {$v['min']},[\"max\"] = {$v['max']}},";
 }
 $cnt = 0;
 $output .= "\r\n}\r\nConfig.Products = {";
 foreach($s4 as $k => $v){
    $cnt++;
    $output .= "\r\n [$cnt] = {[\"name\"] = \"{$v['name']}\",[\"price\"] = {$v['price']},[\"price\"] = {$v['price']},[\"amount\"] = {$v['amount']},[\"info\"] = {{$v['info']}},[\"type\"] = \"{$v['type']}\",[\"slot\"] = $cnt,[\"minrep\"] = {$v['minrep']}},";
 }
 $output .= "\r\n}";
 write_config(QB_DRUGS_CONFIG,$output);
?>