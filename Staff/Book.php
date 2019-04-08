
<?php
require_once("../zapcallib.php");
date_default_timezone_set('Europe/London');
$dbhost = "localhost";
$dbuser = "appengine";
$dbpass = "Test";
$db = "Bookings";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);


function test_input($data)
{
   $data = trim($data);
   $data = stripslashes($data);
   $data = htmlspecialchars($data);
   return $data;
 }

 function alert($msg)
 {
   echo "<script type='text/javascript'>
   alert('$msg');
   location='StaffPortal.html';
   </script>";
 }

$InputtedRoom ="";
$InputtedRoomErr ="";



       $StudentID = test_input($_POST["StaffID"]);
       $InputtedRoom = test_input($_POST["Room"]);
       $InputtedDate = test_input($_POST["BookingFor"]);
       $InputtedDuration = test_input($_POST["FormDuration"]);


       $InputtedTime = test_input($_POST["Timebook"]);

       $Stamp = $InputtedDate  . ' ' . $InputtedTime .":00";
       $Time1 = $InputtedTime .":00";

       $Past='';
       if($Stamp < date("Y-m-d H:i:s"))
       {
         $Past="1";
       }

if($Past =='')
{
$sql = "UPDATE `roomcontent` SET `IsBooked` = 'Yes', `LatestBooking` = '$Stamp', `BookedDuration` = '$InputtedDuration'  WHERE `roomcontent`.`Room` LIKE '$InputtedRoom' AND `Time` LIKE '$Time1'";
$InputtedTime=$Stamp;
$inputtedminutes=$InputtedDuration % 60;
$Inputtedhours=(int)($InputtedDuration/60);
$roomssql="INSERT INTO rooms (entryID, ts, StudentID, Room, booking_for, booking_end, Activity, UserType) VALUES (NULL, CURRENT_TIMESTAMP, '$StudentID', '$InputtedRoom', '$InputtedTime', (SELECT ADDTIME('$InputtedTime', '$Inputtedhours:$inputtedminutes')), '$Activity' ,'Staff')";

if (mysqli_query($conn, $sql) && mysqli_query($conn, $roomssql))
{
 alert("Booked");
}
else
{

 alert("Error");

}

try {
  $msg = "Dear Student\n Your Timetable has changed as there has been a booking \n Please rate the room \n https://forms.gle/vAbdPkoWbCtpPFah9";
  $msg = wordwrap($msg,70);
  $email = "Jamesjduncan99@gmail.com";
  mail($email,"Timetabling",$msg);
}
catch (\Exception $e) {

}
}
else {
  if($Past==1)
  {
    alert("Time has passed");
  }
}
mysqli_close($conn);
?>
