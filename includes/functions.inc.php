<?php
 require_once("config.inc.php");
 function sqlrun($query){
  global $dbinfo;
  global $messages;
  global $lang;
  $dbcon = NULL;
  $result = array();
  $row = array();
  $return = array();
  $dbcon = new mysqli($dbinfo['host'],$dbinfo['username'],$dbinfo['password'],$dbinfo['dbname']);
  if($dbcon->connect_error){
   if(R0ADBUG !== NULL){$messages[] = $dbcon->connect_error;}
   $messages[] = $lang['ersql'];
  }
  if($result = $dbcon->query($query)){
   if($result->num_rows > 0){
    while($row = $result->fetch_assoc()){$return[] = $row;}
   }else{$return[0]['empty'] = "empty";}
    $result->free();
  }else{
   $return['error'] = "true";
   if(R0ADBUG !== NULL){
    $messages[] = $dbcon->error;
    $messages[] = $query;
   }
   $messages[] = $lang['ersql'];
  }
  $dbcon->close();
  return($return);
 }
 function stripslashes_deep($value){
  $value = is_array($value) ? array_map('stripslashes_deep', $value) : stripslashes($value);
  return $value;
 }
 function write_config($file,$output){
  $fh = null;
  $timestamp = null;
  $timestamp = mktime(date('H'),date('i'),date('s'),date('m'),date('d'),date('Y'));
  $timestamp = date('YmdHis', $timestamp);
  $fh = fopen($file,'w');
  if(fwrite($fh,$output)){
   echo "<html><head><title>phpqbadmin Happy Potato</title></head><body><h1>Happy Potato</h1><p>$file was <em>successfully</em> updated.</p></body></html>";
   fclose($fh);
  }else{
   echo "<html><head><title>phpqbadmin Sad Potato</title></head><body><h1>Sad Potato</h1><p>$file was <em>not</em> updated.</p></body></html>";
  }
 }
?>