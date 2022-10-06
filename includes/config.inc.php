<?php
 //Session Information
 session_start();
 $sid = SID;
 $dbinfo = array();
 $lang = "English"; // Set default language -- Currently only English is Supported
 define('RESOURCES', 'C:/Program Files/fxserver-test/txData/QBCoreFramework/resources'); // Set Path to Resources Folder
 $messages = array();
 require_once("{$_SERVER['DOCUMENT_ROOT']}/../secureconfigfiles/phpqbadmin-dbinfo.inc.php"); // Load Language File
 require_once('includes/resources.inc.php');
 require_once('includes/functions.inc.php');
?>