
<?php
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
   location='index.html';
   </script>";
 }

$InputtedRoom ="";
$InputtedRoomErr ="";



  // if (empty($_POST["Room"]))
  //  {
    //   $InputtedRoomErr = "Room is required";
  //   } else
    // {
       $InputtedRoom = test_input($_POST["Room"]);
       $InputtedTime = test_input($_POST["BookingFor"]);
       $InputtedDuration = test_input($_POST["FormDuration"]);
       //// check if name only contains letters and whitespace
    // }



$sql = "UPDATE `roomcontent` SET `IsBooked` = '1', `LatestBooking` = '$InputtedTime', `BookedDuration` = '$InputtedDuration'  WHERE `roomcontent`.`Room` LIKE '$InputtedRoom'";



if (mysqli_query($conn, $sql))
{
 alert("Booked");
}
else
{

 alert("Error");

}
mysqli_close($conn);




?>
