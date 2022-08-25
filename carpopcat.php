<?php
require("includes/config.inc.php");
$query = "SELECT `category` FROM `vehicles` GROUP BY `category`";
$sql = sqlrun($query);
foreach($sql as $k => $v){
  echo "{$v['category']}<br />";
}
$query = "SELECT * FROM `vehicles` WHERE `category` = 'pdm' or `category` = 'pdm1' GROUP BY `category`";
echo "<br /><br /><br />";
$sql = sqlrun($query);
foreach($sql as $k => $v){
  echo "{$v['id']}<br />";
}
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
    while($row = $result->fetch_assoc()){
     $return[] = $row;
    }
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
?>