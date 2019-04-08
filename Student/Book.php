<?php
require_once("../zapcallib.php");
require("../vendor/autoload.php");
require("../env.php");
  $servername = null;
  $username = 'appengine';
  $password = 'Test';
  $dbname = Bookings;
  $dbport = null;
  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname,
  	$dbport, "/cloudsql/agile-235110:europe-west2:agile-4");


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
   location='StudentPortal.html';
   </script>";
 }

$InputtedRoom ="";
$InputtedRoomErr ="";



       $StudentID = test_input($_POST["StudentID"]);
       $InputtedRoom = test_input($_POST["Room"]);
       $InputtedDate = test_input($_POST["BookingFor"]);
       $InputtedDuration = test_input($_POST["FormDuration"]);
       $InputtedTime = test_input($_POST["Timebook"]);

       $Stamp = $InputtedDate  . ' ' . $InputtedTime .":00";
       $Time1 = $InputtedTime .":00";



$sql = "UPDATE `roomcontent` SET `IsBooked` = 'Yes', `LatestBooking` = '$Stamp', `BookedDuration` = '$InputtedDuration' WHERE `Room` LIKE '$InputtedRoom' AND `Time` LIKE '$Time1'";
$InputtedTime=$Stamp;
$inputtedminutes=$InputtedDuration % 60;
$Inputtedhours=(int)($InputtedDuration/60);
$roomssql="INSERT INTO rooms (entryID, ts, StudentID, Room, booking_for, booking_end, Activity, UserType) VALUES (NULL, CURRENT_TIMESTAMP, '$StudentID', '$InputtedRoom', '$InputtedTime', (SELECT ADDTIME('$InputtedTime', '$Inputtedhours:$inputtedminutes')), '$Activity' ,'Student')";

if (mysqli_query($conn, $sql) && mysqli_query($conn, $roomssql))
{
 alert("Booked");
}
else
{
echo  mysqli_error($conn);
 alert("Error");

}




mysqli_close($conn);




?>
