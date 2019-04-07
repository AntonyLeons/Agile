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
echo  mysqli_error($conn);
 alert("Error");

}




mysqli_close($conn);




?>
