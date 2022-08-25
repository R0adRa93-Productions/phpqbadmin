<?php
//Session Information
session_start();
$sid = SID;
$dbinfo = array();
// Database Configuration Begins - Development Server
$dbinfo['username'] = "root";
$dbinfo['password'] = "";
$dbinfo['host'] = "localhost";
$dbinfo['dbname'] = "qbcoreframework_f1c09a";
//$dbcon = mysqli_connect($db_info['host'], $db_info['username'], $db_info['password']) or die('MYSQL Issues A');
$messages = array();
$lang = "English";
?>
