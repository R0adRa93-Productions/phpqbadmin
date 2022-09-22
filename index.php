<?php
require("includes/config.inc.php");
require("includes/functions.inc.php");
?>
<html>
 <head>
  <title>PHPQBADMIN</title>
 </head>
 <body>
  <h1>Welcome to PHPQBAdmin</h1>
  <h2>Select an option</h2>
  <p>
   <ul>
    <li>qb-core
     <ul>
      <li>Manage \shared\items.lua
       <ul>
        <li><a href="qb-core-shared-items-populator.php">qb-core/shared/items.lua populator</a></li>
       </ul>
      </li>
      <li>Manage \shared\vehicles.lua
       <ul>
        <li><a href="qb-core-shared-vehicles-populator.php">qb-core/shared/vehicles.lua populator</a></li>
        <li><a href="qb-core-shared-vehicles-categories-list.php">List Vehicle Categories</a></li>
       </ul>
      </li>
     </ul>
    </li>
    <li>qb-garages
     <ul>
      <li>Manage \config.lua
       <ul>
        <li><a href="qb-garages-config-populator.php">qb-garages/config.lua populator</a></li>
       </ul>
      </li>
     </ul>
    </li>
   </ul>
  </p>
 </body>
</html>