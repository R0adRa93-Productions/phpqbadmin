<?php
require_once("config.inc.php");
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
function timecalls($mdy)
{
 global $header;
 global $db_connection;
 global $bgform;
 global $sid;
 if($_POST['submit'] != "All"){$header .= "<b>{$_POST['month']}/{$_POST['day']}/{$_POST['year']}</b>";}
 else{$header .= "<b>All Timecalls Posted</b>";}
 $form = NULL;
 $query = "SELECT DATE_FORMAT(dispatches.reservation, '%h|%i|%p|%m|%d|%Y' ) AS timecall, dispatches.a1_area_id AS a1, dispatches.a1_address AS address, dispatches.a2_area_id AS a2, dispatches.pass_name AS pass_name, dispatches.dispatch_id AS dispatch_id, dispatches.cab_id AS cab_id, clients.client_id AS client_id, clients.cancel AS cancel, clients.comments AS comments, clients.home_phone AS home_phone FROM dispatches, clients WHERE $mdy dispatches.stat_id = '0' AND dispatches.client_id = clients.client_id OR $mdy dispatches.stat_id = '8' AND dispatches.client_id = clients.client_id";
 $request = mysql_query($query, $db_connection) or die(mysql_error());
 while($run = mysql_fetch_array($request))
 {
  $run = stripslashes_deep($run);
  list($h,$m,$a,$o,$d,$y) = explode("|",$run['timecall']);
  list($h,$m,$a,$o,$d,$y) = hmaody_preset($h,$m,$a,$o,$d,$y);
  $date_time = parse_reservation_date_time($h,$m,$a,$o,$d,$y);
  $cab_id = active_cabs($run['cab_id']);
  $form .= parse_reservation_form($_SERVER['PHP_SELF'], $date_time, $run['a1'], $run['address'], $run['a2'], $run['pass_name'], $run['comments'], $run['dispatch_id'], $run['client_id'], $run['cancel'], $run['home_phone'], $cab_id,$sid);
 }
 $main_content = parse_reservation_layout($form);
 mysql_free_result($request);
 return($main_content);
}
function reservations($mdy, $phone)
{
 global $header;
 global $db_connection;
 global $sid;
 if($_POST['submit'] != "All"){$header .= "<b>{$_POST['month']}/{$_POST['day']}/{$_POST['year']}</b>";}
 else{$header .= "<b>All Reservations Posted</b>";}
 $form = NULL;
 $query = "SELECT DATE_FORMAT(dispatches.reservation, '%h|%i|%p|%m|%d|%Y' ) AS reservation, dispatches.a1_area_id AS a1, dispatches.a1_address AS address, dispatches.a2_area_id AS a2, dispatches.pass_name AS pass_name, dispatches.dispatch_id AS dispatch_id, dispatches.cab_id AS cab_id, clients.client_id AS client_id, clients.cancel AS cancel, clients.comments AS comments, clients.home_phone AS home_phone FROM dispatches, clients WHERE $mdy dispatches.stat_id = '0' AND dispatches.client_id = clients.client_id AND clients.home_phone = $phone OR $mdy dispatches.stat_id = '8' AND dispatches.client_id = clients.client_id AND clients.home_phone = $phone";
 $request = mysql_query($query, $db_connection) or die(mysql_error());
 while($run = mysql_fetch_array($request))
 {
  $run = stripslashes_deep($run);
  list($h,$m,$a,$o,$d,$y) = explode("|",$run['reservation']);
  list($h,$m,$a,$o,$d,$y) = hmaody_preset($h,$m,$a,$o,$d,$y);
  $date_time = parse_reservation_date_time($h,$m,$a,$o,$d,$y);
  $cab_id = active_cabs($run['cab_id']);
  $form .= parse_reservation_form($_SERVER['PHP_SELF'], $date_time, $run['a1'], $run['address'], $run['a2'], $run['pass_name'], $run['comments'], $run['dispatch_id'], $run['client_id'], $run['cancel'], $run['home_phone'], $cab_id,$sid);
 }
 $main_content = parse_reservation_layout($form);
 mysql_free_result($request);
 return($main_content);
}
function btm_form($sid)
{
 $action = $_SERVER['PHP_SELF'];
 $query_name = parse_div_cell("midl",parse_query_name($action,$sid));
 return($query_name);
}
function custinfo($sid)
{
 if($_POST['submit'] == "Insert Customer" || $_POST['submit'] == "Edit Customer"){$citystate = citystate2();}else{$citystate = NULL;}
 if(isset($_POST['client_id'])){$client_id = $_POST['client_id'];}else{$client_id = NULL;}
 if(!isset($_POST['first_name'])){$first_name = NULL;}else{$first_name = $_POST['first_name'];}
 if(!isset($_POST['last_name'])){$last_name = NULL;}else{$last_name = $_POST['last_name'];}
 if(!isset($_POST['address_1'])){$address_1 = NULL;}else{$address_1 = $_POST['address_1'];}
 if(!isset($_POST['address_2'])){$address_2 = NULL;}else{$address_2 = $_POST['address_2'];}
 if(!isset($_POST['home_phone'])){$home_phone = NULL;}else{$home_phone = $_POST['home_phone'];}
 if(!isset($_POST['zip_code'])){$zip_code = NULL;}else{$zip_code = $_POST['zip_code'];}
 if(isset($_POST['submit']))
 {
  if($_POST['submit'] == "Edit Customer"){$eori = "Edit Customer";}
  elseif($_POST['submit'] == "Insert Customer"){$eori = "Add Customer";}
  else{$eori = "Insert Customer";}
 }else{$eori = "Insert Customer";}
 $action = $_SERVER['PHP_SELF'];
 $custinfo = parse_div_cell("midc",parse_custinfo_form($action, $first_name, $last_name, $address_1, $address_2, $home_phone, $zip_code, $citystate, $client_id, $eori,$sid));
 return($custinfo);
}
function discus($tnc,$sid)
{
 global $db_connection;
 global $midrig;
 $midrig['left'] = btm_form($sid);
 $midrig['center'] = NULL;
 $midrig['right'] = NULL;
 $query = "select clients.first_name AS fname, clients.last_name AS lname, clients.address_1 AS add1, clients.address_2 AS add2, clients.home_phone AS home_phone, clients.cancel AS cancel, clients.blank AS blank, clients.complete AS complete, clients.comments AS comments, clients.client_id AS client_id, zip_codes.zip_code AS zip_code, cities.city_name AS city, states.state_name AS state FROM clients, states, zip_codes, cities WHERE $tnc clients.state_id = states.state_id AND clients.zip_id = zip_codes.zip_id AND clients.city_id = cities.city_id";
 $request = @mysql_query($query, $db_connection);
 $cnt = 0;
 while($run = @mysql_fetch_array($request))
 {
  $run = stripslashes_deep($run);
  $a1_area_id = ""; // "$run['a1_area_id']";
  $a2_area_id = ""; //$run['a2_area_id'];
  $midrig['center'] .= parse_div_cell("midc",parse_custstat_form($_SERVER['PHP_SELF'], $run['fname'], $run['lname'], $run['add1'], $run['add2'], $run['home_phone'], $run['zip_code'], $run['city'], $run['state'], $run['cancel'], $run['blank'], $run['complete'], $run['client_id'],$sid));
  $midrig['right'] .= parse_div_cell("midr",disinfo($_SERVER['PHP_SELF'], $a1_area_id, $run['add1'], $run['add2'], $a2_area_id, $run['fname'], $run['lname'], $run['home_phone'], $run['client_id'], $run['comments'],$sid));
 }
 mysql_free_result($request);
}
function disinfo($action, $a1_area_id, $add1, $add2, $a2_area_id, $fname, $lname, $phone, $client_id, $comments,$sid)
{
 $a1_address = $add1 . " " . $add2;
 $pname = $fname . " " . $lname;
 $cab_id = active_cabs(NULL);
 list($hour,$minute,$ampm,$month,$day,$year) = hmaody();
 $time_call = parse_row_time_call($hour, $minute, $ampm, $month, $day, $year);
 $disinfo = parse_disinfo($action, $a1_area_id, $a1_address, $a2_area_id, $pname, $cab_id, $time_call, $phone, $client_id, $comments,$sid);
 return($disinfo);
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
function dispatch($dispatch_id)
{
 $buttons = "
 <input type=\"submit\" name=\"status\" value=\"Dispatch\" />
  <br />
 <input type=\"submit\" name=\"status\" value=\"Cancel\" onclick=\"return verify()\" />
  <br />
 <input type=\"submit\" name=\"status\" value=\"Delete\" onclick=\"return verify()\" />
</td><td>&nbsp;";
 return($buttons);
}
function pick_up($dispatch_id)
{
 $buttons = "
 <input type=\"submit\" name=\"status\" value=\"Pickup\" /><br />
 <input type=\"submit\" name=\"status\" value=\"Cancel\" onclick=\"return verify()\" /><br />
 <input type=\"submit\" name=\"status\" value=\"Blank\" />
 </td><td>
 <input type=\"submit\" name=\"status\" value=\"Hand Back\" /><br />
 <input type=\"submit\" name=\"status\" value=\"Reset\" /><br />
 <input type=\"submit\" name=\"status\" value=\"Delete\" onclick=\"return verify()\" />";
 return($buttons);
}
function cleared()
{
 $buttons = "<input type=\"submit\" name=\"status\" value=\"Cleared\" />";
 return($buttons);
}
function white_error()
{
 $buttons = "Something is wrong CALL CG";
 return($buttons);
}
function time_test($add)
{ 
 $timetest = mktime(date('H'),date('i')+$add,date('s'),date('m'),date('d'),date('Y'));
 $timetest = date('YmdHis', $timetest);
 return($timetest);
}
function active_cabs($cab_id)
{
 global $db_connection;
 $selected=NULL;
 $option = parse_form_option(0,$selected,"No Cab");
 $query = "select cabs.cab_id AS cab_id, cabs.cab_num AS cab_num FROM cabs WHERE cabs.on_line = 'YES' AND cab_id != 0 ORDER BY cab_num";
 $request = mysql_query($query, $db_connection) or die(mysql_error());
 while($row = mysql_fetch_array($request))
 {
  $row = stripslashes_deep($row);
  if($row['cab_id'] == $cab_id){$selected = "selected=\"1\"";}else{$selected = NULL;}
  $option .= parse_form_option($row['cab_id'], $selected, $row['cab_num']);
 }
 mysql_free_result($request);
 return($option);
}
function all_cabs()
{
 global $db_connection;
 $option = "<option value=\"00\">ALL</option>";
 $selected = NULL;
 $query = "select cabs.cab_id AS cab_id, cabs.cab_num AS cab_num FROM cabs WHERE cab_id != 0 ORDER BY cab_num";
 $request = mysql_query($query, $db_connection) or die(mysql_error());
 while($row = mysql_fetch_array($request))
 {
  $row = stripslashes_deep($row);
  $option .= parse_form_option($row['cab_id'], $selected, $row['cab_num']);
 }
 mysql_free_result($request);
 return($option);
}
function citystate2()
{
 global $db_connection;
 $option_city = NULL;
 $option_state = NULL;
 $query = "select cities.city_name, states.state_abreviation, cities.city_id, states.state_id, zip_codes.zip_id FROM cities, states, zip_codes WHERE zip_codes.zip_code = '{$_POST['zip_code']}' AND zip_codes.city_id = cities.city_id AND cities.state_id = states.state_id";
 $request = @mysql_query($query, $db_connection);
 while($result = mysql_fetch_array($request))
 {
  $result = stripslashes_deep($result);
  $zips[] = $result[4];
  $selected = NULL;
  $option_city .= parse_form_option($result[2], $selected, $result[0]);
  $option_state .= parse_form_option($result[3], $selected, $result[1]);
 }
 $zip_id = $zips[0];
 $citystate = parse_citystate($option_city, $option_state, $zip_id);
 mysql_free_result($request);
 return($citystate);
}
function parse_query_name($action,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/query_name.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_cab_verify_form($month, $day, $year, $hour, $minute, $ampm, $cab, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/cab_verify_form.tpl.php");
 $parser->SetParameter("ACTION", $_SERVER['PHP_SELF']);
 $parser->SetParameter("MONTH", $month);
 $parser->SetParameter("DAY", $day);
 $parser->SetParameter("YEAR", $year);
 $parser->SetParameter("HOUR", $hour);
 $parser->SetParameter("MINUTE", $minute);
 $parser->SetParameter("AMPM", $ampm);
 $parser->SetParameter("CAB", $cab);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_cab_verify($cab_num, $bid, $pickup, $a1, $address, $a2, $pass_name, $client_phone, $status)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/cab_verify.tpl.php");
 $parser->SetParameter("CAB_NUM", $cab_num);
 $parser->SetParameter("BID", $bid);
 $parser->SetParameter("PICKUP", $pickup);
 $parser->SetParameter("PICKUP_AREA", $a1);
 $parser->SetParameter("PICKUP_ADDRESS", $address);
 $parser->SetParameter("DROP_OFF_AREA", $a2);
 $parser->SetParameter("PASS_NAME", $pass_name);
 $parser->SetParameter("CLIENT_PHONE", $client_phone);
 $parser->SetParameter("STATUS", $status);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_cab_verify_layout($row)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/cab_verify_layout.tpl.php");
 $parser->SetParameter("ROW", $row);
 $output = $parser->SubTemplate();
 return($output);
}
function parse_recent_fares_form($action, $sid, $cab_num, $bid, $pickup, $a1, $address, $a2, $pass_name, $client_phone, $status, $dispatch_id)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/recent_fares_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("SID", $sid);
 $parser->SetParameter("CAB_NUM", $cab_num);
 $parser->SetParameter("BID", $bid);
 $parser->SetParameter("PICKUP", $pickup);
 $parser->SetParameter("PICKUP_AREA", $a1);
 $parser->SetParameter("PICKUP_ADDRESS", $address);
 $parser->SetParameter("DROP_OFF_AREA", $a2);
 $parser->SetParameter("PASS_NAME", $pass_name);
 $parser->SetParameter("CLIENT_PHONE", $client_phone);
 $parser->SetParameter("STATUS", $status);
 $parser->SetParameter("DISPATCH_ID", $dispatch_id);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_recent_fares_layout($row)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/recent_fares_layout.tpl.php");
 $parser->SetParameter("ROW", $row);
 $output = $parser->SubTemplate();
 return($output);
}
function parse_disinfo($action, $a1_area_id, $a1_address, $a2_area_id, $pass_name, $cab_id, $time_call, $home_phone, $client_id, $comments, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/disinfo.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("A1_AREA_ID", $a1_area_id);
 $parser->SetParameter("A1_ADDRESS", $a1_address);
 $parser->SetParameter("A2_AREA_ID", $a2_area_id);
 $parser->SetParameter("PASS_NAME", $pass_name);
 $parser->SetParameter("CAB_ID", $cab_id);
 $parser->SetParameter("TIME_CALL", $time_call);
 $parser->SetParameter("HOME_PHONE", $home_phone);
 $parser->SetParameter("CLIENT_ID", $client_id);
 $parser->SetParameter("COMMENTS", $comments);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_form_option($value, $selected, $data)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/form_option.tpl.php");
 $parser->SetParameter("VALUE", $value);
 $parser->SetParameter("SELECTED", $selected);
 $parser->SetParameter("DATA", $data);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_row_time_call($hour, $minute, $ampm, $month, $day, $year)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/row_time_call.tpl.php");
 $parser->SetParameter("HOUR", $hour);
 $parser->SetParameter("MINUTE", $minute);
 $parser->SetParameter("AMPM", $ampm);
 $parser->SetParameter("MONTH", $month);
 $parser->SetParameter("DAY", $day);
 $parser->SetParameter("YEAR", $year);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_custstat_form($action, $first_name, $last_name, $address_1, $address_2, $home_phone, $zip_code, $city, $state, $cancel, $blank, $complete, $client_id, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/custstat_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("FIRST_NAME", $first_name);
 $parser->SetParameter("LAST_NAME", $last_name);
 $parser->SetParameter("ADDRESS_1", $address_1);
 $parser->SetParameter("ADDRESS_2", $address_2);
 $parser->SetParameter("HOME_PHONE", $home_phone);
 $parser->SetParameter("ZIP_CODE", $zip_code);
 $parser->SetParameter("CITY", $city);
 $parser->SetParameter("STATE", $state);
 $parser->SetParameter("CANCEL", $cancel);
 $parser->SetParameter("BLANK", $blank);
 $parser->SetParameter("COMPLETE", $complete);
 $parser->SetParameter("CLIENT_ID", $client_id);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_custinfo_form($action, $first_name, $last_name, $address_1, $address_2, $home_phone, $zip_code, $citystate, $client_id, $eori, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/custinfo_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("FIRST_NAME", $first_name);
 $parser->SetParameter("LAST_NAME", $last_name);
 $parser->SetParameter("ADDRESS_1", $address_1);
 $parser->SetParameter("ADDRESS_2", $address_2);
 $parser->SetParameter("HOME_PHONE", $home_phone);
 $parser->SetParameter("ZIP_CODE", $zip_code);
 $parser->SetParameter("CITY_STATE", $citystate);
 $parser->SetParameter("CLIENT_ID", $client_id);
 $parser->SetParameter("EORI", $eori);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_div_cell($class, $content)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/div_cell.tpl.php");
 $parser->SetParameter("CLASS", $class);
 $parser->SetParameter("CONTENT", $content);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_btm_layout($left,$center,$right)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/btm_layout.tpl.php");
 $parser->SetParameter("LEFT", $left);
 $parser->SetParameter("CENTER", $center);
 $parser->SetParameter("RIGHT", $right);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_citystate($option_city, $option_state, $zip_id)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/citystate.tpl.php");
 $parser->SetParameter("OPTION_CITY", $option_city);
 $parser->SetParameter("OPTION_STATE", $option_state);
 $parser->SetParameter("ZIP_ID", $zip_id);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_disp_layout($form)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/disp_layout.tpl.php");
 $parser->SetParameter("FORM", $form);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_disp_form($action, $class, $time, $a1, $add1, $name, $phone, $a2, $pass_name, $cabs, $comments, $complete, $cancel, $blank, $client_id, $dispatch_id, $cab, $oldstat, $buttons, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/disp_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("CLASS", $class);
 $parser->SetParameter("TIME", $time);
 $parser->SetParameter("A1", $a1);
 $parser->SetParameter("ADD1", $add1);
 $parser->SetParameter("NAME", $name);
 $parser->SetParameter("PHONE", $phone);
 $parser->SetParameter("A2", $a2);
 $parser->SetParameter("PASS_NAME", $pass_name);
 $parser->SetParameter("CABS", $cabs);
 $parser->SetParameter("COMMENTS", $comments);
 $parser->SetParameter("COMPLETE", $complete);
 $parser->SetParameter("CANCEL", $cancel);
 $parser->SetParameter("BLANK", $blank);
 $parser->SetParameter("CLIENT_ID", $client_id);
 $parser->SetParameter("DISPATCH_ID", $dispatch_id);
 $parser->SetParameter("REQ", $cab);
 $parser->SetParameter("OLDSTAT", $oldstat);
 $parser->SetParameter("BUTTONS", $buttons);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_timecall_first_form($action,$month,$day,$year,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/timecall_first_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("MONTH", $month);
 $parser->SetParameter("DAY", $day);
 $parser->SetParameter("YEAR", $year);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_reservation_first_form($action,$month,$day,$year,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/reservation_first_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("MONTH", $month);
 $parser->SetParameter("DAY", $day);
 $parser->SetParameter("YEAR", $year);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_reservation_date_time($hour, $minute, $ampm, $month, $day, $year)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/reservation_date_time.tpl.php");
 $parser->SetParameter("HOUR", $hour);
 $parser->SetParameter("MINUTE", $minute);
 $parser->SetParameter("AMPM", $ampm);
 $parser->SetParameter("MONTH", $month);
 $parser->SetParameter("DAY", $day);
 $parser->SetParameter("YEAR", $year);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_reservation_form($action,$date_time,$a1,$address,$a2,$pass_name,$comments,$dispatch_id,$client_id,$cancel,$home_phone,$cab_id,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/reservation_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("DATE_TIME", $date_time);
 $parser->SetParameter("A1", $a1);
 $parser->SetParameter("ADDRESS", $address);
 $parser->SetParameter("A2", $a2);
 $parser->SetParameter("PASS_NAME", $pass_name);
 $parser->SetParameter("COMMENTS", $comments);
 $parser->SetParameter("DISPATCH_ID", $dispatch_id);
 $parser->SetParameter("CLIENT_ID", $client_id);
 $parser->SetParameter("CANCEL", $cancel);
 $parser->SetParameter("HOME_PHONE", $home_phone);
 $parser->SetParameter("CAB_ID", $cab_id);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_reservation_layout($form)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/reservation_layout.tpl.php");
 $parser->SetParameter("FORM", $form);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_cab_edit_form($action,$cab_num,$yes,$no,$cab_id,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/cab_edit_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("CAB_NUM", $cab_num);
 $parser->SetParameter("YES", $yes);
 $parser->SetParameter("NO", $no);
 $parser->SetParameter("CAB_ID", $cab_id);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_cab_add_form($action, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/cab_add_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_cab_layout($form)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/cab_layout.tpl.php");
 $parser->SetParameter("FORM", $form);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_employee_control_add_form($action, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/employee_control_add_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_employee_control_add_form_2($action,$fname,$mname,$lname,$un,$acheck,$bcheck,$ccheck,$dcheck,$echeck,$fcheck,$gcheck,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/employee_control_add_form_2.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("FIRST_NAME", $fname);
 $parser->SetParameter("MIDDLE_NAME", $mname);
 $parser->SetParameter("LAST_NAME", $lname);
 /*$parser->SetParameter("ADDRESS_1", $add1);
 $parser->SetParameter("ADDRESS_2", $add2);
 $parser->SetParameter("HOME_PHONE", $hph);
 $parser->SetParameter("MOBILE_PHONE", $mph);*/
 $parser->SetParameter("USER_NAME", $un);
 $parser->SetParameter("ACHECK", $acheck);
 $parser->SetParameter("BCHECK", $bcheck);
 $parser->SetParameter("CCHECK", $ccheck);
 $parser->SetParameter("DCHECK", $dcheck);
 $parser->SetParameter("ECHECK", $echeck);
 $parser->SetParameter("FCHECK", $fcheck);
 $parser->SetParameter("GCHECK", $gcheck);
 $parser->SetParameter("SID", $sid);
 //$parser->SetParameter("ZIP_CODE", $zip);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_employee_control_edit_form($action,$fname,$mname,$lname,$un,$acheck,$bcheck,$ccheck,$dcheck,$echeck,$fcheck,$gcheck,$employee_id,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/employee_control_edit_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("FIRST_NAME", $fname);
 $parser->SetParameter("MIDDLE_NAME", $mname);
 $parser->SetParameter("LAST_NAME", $lname);
 /*$parser->SetParameter("ADDRESS_1", $add1);
 $parser->SetParameter("ADDRESS_2", $add2);
 $parser->SetParameter("HOME_PHONE", $hph);
 $parser->SetParameter("MOBILE_PHONE", $mph);*/
 $parser->SetParameter("USER_NAME", $un);
 $parser->SetParameter("ACHECK", $acheck);
 $parser->SetParameter("BCHECK", $bcheck);
 $parser->SetParameter("CCHECK", $ccheck);
 $parser->SetParameter("DCHECK", $dcheck);
 $parser->SetParameter("ECHECK", $echeck);
 $parser->SetParameter("FCHECK", $fcheck);
 $parser->SetParameter("GCHECK", $gcheck);
 $parser->SetParameter("EMPLOYEE_ID", $employee_id);
 $parser->SetParameter("SID", $sid);
 //$parser->SetParameter("ZIP_CODE", $zip);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_employee_control_layout($form)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/employee_control_layout.tpl.php");
 $parser->SetParameter("FORM", $form);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_signin_form($action,$sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/signin_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_fix_dispatch_layout($form)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/dispatch_layout.tpl.php");
 $parser->SetParameter("FORM", $form);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function parse_fix_dispatch_form($action, $time, $a1, $add1, $name, $phone, $a2, $pass_name, $cabs, $comments, $complete, $cancel, $blank, $client_id, $dispatch_id, $cab, $oldstat, $buttons, $sid)
{
 global $dds;
 $parser = new SubTemplateParser($dds . "templates/dispatch_form.tpl.php");
 $parser->SetParameter("ACTION", $action);
 $parser->SetParameter("TIME", $time);
 $parser->SetParameter("A1", $a1);
 $parser->SetParameter("ADD1", $add1);
 $parser->SetParameter("NAME", $name);
 $parser->SetParameter("PHONE", $phone);
 $parser->SetParameter("A2", $a2);
 $parser->SetParameter("PASS_NAME", $pass_name);
 $parser->SetParameter("CABS", $cabs);
 $parser->SetParameter("COMMENTS", $comments);
 $parser->SetParameter("COMPLETE", $complete);
 $parser->SetParameter("CANCEL", $cancel);
 $parser->SetParameter("BLANK", $blank);
 $parser->SetParameter("CLIENT_ID", $client_id);
 $parser->SetParameter("DISPATCH_ID", $dispatch_id);
 $parser->SetParameter("REQ", $cab);
 $parser->SetParameter("OLDSTAT", $oldstat);
 $parser->SetParameter("BUTTONS", $buttons);
 $parser->SetParameter("SID", $sid);
 $output = $parser->SubTemplate();
 unset($parser);
 return($output);
}
function output_main($title, $header, $content, $footer)
{
 global $dds;
 $parser = new TemplateParser($dds . "templates/main.tpl.php");
 $parser->SetParameter("TITLE", $title);
 $parser->SetParameter("HEADER", $header);
 $parser->SetParameter("CONTENT", $content);
 $parser->SetParameter("FOOTER", $footer);
 $parser->CreatePage();
 unset($parser);
}
function output_dispatch($title, $header, $content, $footer)
{
 global $dds;
 $parser = new TemplateParser($dds . "templates/dispatch.tpl.php");
 $parser->SetParameter("TITLE", $title);
 $parser->SetParameter("HEADER", $header);
 $parser->SetParameter("CONTENT", $content);
 $parser->SetParameter("FOOTER", $footer);
 $parser->CreatePage();
 unset($parser);
}
function output_btm($title, $sid, $header, $content, $footer)
{
 global $dds;
 $parser = new TemplateParser($dds . "templates/btm.tpl.php");
 $parser->SetParameter("TITLE", $title);
 $parser->SetParameter("SID", $sid);
 $parser->SetParameter("HEADER", $header);
 $parser->SetParameter("CONTENT", $content);
 $parser->SetParameter("FOOTER", $footer);
 $parser->CreatePage();
 unset($parser);
}
?>