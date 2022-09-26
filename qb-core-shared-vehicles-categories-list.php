<?php
 require("includes/config.inc.php");
 require("includes/functions.inc.php");
 $query = "SELECT `category` FROM `qb-core-shared-vehicles` GROUP BY `category`";
 $sql = sqlrun($query);
 foreach($sql as $k => $v){
   echo "{$v['category']}<br />";
 }
?>