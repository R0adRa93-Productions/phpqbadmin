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
function stripslashes_deep($value)
{
   $value = is_array($value) ?
               array_map('stripslashes_deep', $value) :
               stripslashes($value);

   return $value;
}
function page_control_list()
{
 $query = "select * from page_list";
 $request = mysql_query($query, $db_connection) or die(mysql_error());
 while($run = mysql_fetch_array($request))
 {
  
 }
 mysql_free_result($request);
}
function hmaody()
{
 global $yearmax;
 global $self;
 $option = array();
 for($cnt = 0; $cnt<6; $cnt++)
 {
  $option[$cnt] = NULL;
 }
 for($cnt = 1; $cnt <= 12; $cnt++)
 {
  if($cnt == date('h')){$selected = "SELECTED"; $value = $cnt;}else{$selected = NULL;}
  $option[0] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
 }
 $minute = date('i');
 if($minute > 55){$minute = "55";}
 elseif($minute > 50 and $minute < 55){$minute = "50";}
 elseif($minute > 45 and $minute < 50){$minute = "45";}
 elseif($minute > 40 and $minute < 45){$minute = "40";}
 elseif($minute > 35 and $minute < 40){$minute = "35";}
 elseif($minute > 30 and $minute < 35){$minute = "30";}
 elseif($minute > 25 and $minute < 30){$minute = "25";}
 elseif($minute > 20 and $minute < 25){$minute = "20";}
 elseif($minute > 15 and $minute < 20){$minute = "15";}
 elseif($minute > 10 and $minute < 15){$minute = "10";}
 elseif($minute > 05 and $minute < 10){$minute = "05";}
 else{$minute = sprintf("%02.0f", "0");}
// if($minute > 0 and $minute < 05){$minute = sprintf("%02.0f", "0");}
 for($cnt=0; $cnt<=59; $cnt++)
 {
  if($cnt%05 == 0)
  {
   if($cnt == $minute){$selected = "SELECTED";}
   else{$selected = NULL;}
   $cnt = sprintf("%02.0f", $cnt);
   $option[1] .= parse_form_option($cnt, $selected, $cnt);
   unset($selected);
  }
 }
 $ampm = date('A');
 if($ampm == "PM"){$select = "SELECTED"; $checked = "CHECKED"; $check = NULL;}else{$select = NULL; $check = "CHECKED"; $checked = NULL;}
 if($_SERVER['PHP_SELF'] == $self . "plugins/cab_verify.php")
 {
  $option[2] .= "<option value=\"AM\">AM</option>";
  $option[2] .= "<option value=\"PM\" $select>PM</option>";
 }else{
  $option[2] .= "<input type=\"radio\" name=\"ampm\" value=\"AM\" $check/>AM";
  $option[2] .= "<input type=\"radio\" name=\"ampm\" value=\"PM\" $checked />PM";
 }
 $month = date('m');
 for($cnt=1; $cnt<=12; $cnt++)
 {
  if($month == $cnt){$selected = "SELECTED"; $value = $cnt;}else{$selected = NULL;}
  $option[3] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
 }
 for($cnt=1; $cnt<=31; $cnt++)
 {
  $day = date('j');
  if($cnt == $day){$selected = "SELECTED"; $value = $cnt;}else{$selected = NULL;}
  $option[4] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
 }
 $year = date('Y');
 $year2 = $year + $yearmax;
 $cnt = $year;
 while($cnt <= $year2)
 {
  if($cnt == $year){$selected = "SELECTED"; $value = $cnt;}else{$selected = NULL;}
  $option[5] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
  $cnt++;
 }
 return($option);
}
function hmaody_split($split)
{
 list($h,$m,$a,$o,$d,$y) = explode("|",$split);
 $option = hmaody_preset($h,$m,$a,$o,$d,$y);
 return($option);
}
function hmaody_preset($h,$m,$a,$o,$d,$y)
{
 global $yearmax;
 $option = array();
 for($cnt = 0; $cnt<6; $cnt++)
 {
  $option[$cnt] = NULL;
 }
 for($cnt = 1; $cnt <= 12; $cnt++)
 {
  if($cnt == $h){$selected = "SELECTED";}else{$selected = NULL;}
  $option[0] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
 }
 for($cnt=0; $cnt<=59; $cnt++)
 {
  if($cnt%05 == 0)
  {
   if($cnt == $m){$selected = "SELECTED";}
   else{$selected = NULL;}
   $cnt = sprintf("%02.0f", $cnt);
   $option[1] .= parse_form_option($cnt, $selected, $cnt);
   unset($selected);
  }
 }
 if($a == "PM"){$selected = "SELECTED";}else{$selected = NULL;}
 $option[2] .= "<option>AM</option>";
 $option[2] .= "<option $selected>PM</option>";
 for($cnt=1; $cnt<=12; $cnt++)
 {
  if($o == $cnt){$selected = "SELECTED";}else{$selected = NULL;}
  $option[3] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
 }
 for($cnt=1; $cnt<=31; $cnt++)
 {
  if($cnt == $d){$selected = "SELECTED";}else{$selected = NULL;}
  $option[4] .= parse_form_option($cnt, $selected, $cnt);
 }
 $year = date('Y');
 $year2 = $year + $yearmax;
 $cnt = $year;
 while($cnt <= $year2)
 {
  if($cnt == $y){$selected = "SELECTED";}else{$selected = NULL;}
  $option[5] .= parse_form_option($cnt, $selected, $cnt);
  unset($selected);
  $cnt++;
 }
 return($option);
}
function timeconvert24($year,$month,$day,$hour,$minute,$ampm)
{
 $timeconvert24 = strftime("%Y%m%d%H%M%S", strtotime("$year/$month/$day $hour:$minute:00 $ampm"));
 return($timeconvert24);
}

?>