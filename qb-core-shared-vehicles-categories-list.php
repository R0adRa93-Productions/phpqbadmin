<?php
require("includes/config.inc.php");
require("includes/functions.inc.php");
$query = "SELECT `category` FROM `qb-core-shared-vehicles` GROUP BY `category`";
$sql = sqlrun($query);
foreach($sql as $k => $v){
  echo "{$v['category']}<br />";
}
$query = "SELECT * FROM `qb-core-shared-vehicles` WHERE `category` = 'pdm' or `category` = 'pdm1' GROUP BY `category`";
echo "<br /><br /><br />";
$sql = sqlrun($query);
foreach($sql as $k => $v){
  echo "{$v['id']}<br />";
}
?>