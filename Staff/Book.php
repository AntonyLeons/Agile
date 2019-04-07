
<?php
require_once("../zapcallib.php");
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
       $InputtedTime = test_input($_POST["BookingFor"]);
       $InputtedDuration = test_input($_POST["FormDuration"]);



$sql = "UPDATE `roomcontent` SET `IsBooked` = 'Yes', `LatestBooking` = '$InputtedTime', `BookedDuration` = '$InputtedDuration'  WHERE `roomcontent`.`Room` LIKE '$InputtedRoom'";
$inputtedminutes=$InputtedDuration % 60;
(int)$Inputtedhours=$InputtedDuration/60;
$InputtedTime= ZDateHelper::fromiCaltoUnixDateTime($InputtedTime);
$InputtedTime= ZDateHelper::toSqlDateTime($InputtedTime);
$roomssql="INSERT INTO rooms (entryID, ts, StudentID, Room, booking_for, booking_end, UserType) VALUES (NULL, CURRENT_TIMESTAMP, '$StudentID', '$InputtedRoom', '$InputtedTime', (SELECT ADDTIME('$InputtedTime', '$Inputtedhours:$inputtedminutes')),'Admin')";

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


mysqli_close($conn);




?>
