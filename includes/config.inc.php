<?php
 //Session Information
 session_start();
 $sid = SID;
 $dbinfo = array();
 // Database Configuration Begins
 $dbinfo['username'] = "root"; // MySQL user name
 $dbinfo['password'] = ""; // MySQL Password
 $dbinfo['host'] = "localhost"; // MySQL Server Address
 $dbinfo['dbname'] = "phpqbadmin"; // Database Name
 $lang = "English"; // Set default language -- Currently only English is Supported
 define('RESOURCES', 'C:/Program Files/FXServer/txData/QBCoreFramework/resources'); // Set Path to Resources Folder
 $messages = array();
 require_once('includes/resources.inc.php');
 require_once('includes/functions.inc.php');
?>
