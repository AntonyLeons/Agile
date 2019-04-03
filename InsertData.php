<?php
require_once("zapcallib.php");
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
try
        {
         $StudentIDErr = $SocietyErr = $BookingForErr = $RoomErr = $UserTypeErr = $BookingTillErr = $PastErr = $Past2Err = "";
         $StudentID = $Society = $BookingFor = $Room = $UserType = $Activity = $BookingTill = $Past = $Past2 = "";

         $dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "Bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);


            if (empty($_POST["StudentID"])) {
                $StudentIDErr = "StudentID is required";
              } else {
                $StudentID = test_input($_POST["StudentID"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[0-9][0-9]{2,10}$/",$StudentID)) {
                  $StudentIDErr = "Only Numbers allowed in StudentID";
                }
              }
              if (empty($_POST["Society"])) {
                $SocietyErr = "Society is required";
              } else {
                $Society = test_input($_POST["Society"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,20}$/",$Society)) {
                  $SocietyErr = "Only letters and white space allowed in First Name";
                }
              }
              if (empty($_POST["BookingFor"])) {
                $BookingForErr = "Booking Start is required";
              } else {
                $BookingFor = $_POST["BookingFor"];
              }
              if (empty($_POST["BookingTill"])) {
                $BookingTillErr = "Booking End is required";
              } else {
                $BookingTill = $_POST["BookingTill"];
              }
              if (empty($_POST["Room"])) {
                $RoomErr = "Room is required";
              } else {
                $Room = test_input($_POST["Room"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,40}$/",$Room)) {
                  $RoomErr = "Only letters and white space allowed in Room";
                }
              }
              if (empty($_POST["Activity"])) {
                $ActivityErr = "Activity is required";
              } else {
                $Activity = test_input($_POST["Activity"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,40}$/",$Activity)) {
                  $ActivityErr = "Only letters and white space allowed in Room";
                }
              }
              if (empty($_POST["UserType"])) {
                $UserTypeErr = "UserType is required";
              } else {
                $UserType = test_input($_POST["UserType"]);
                 if (!preg_match("/^[a-zA-Z ]{0,7}$/",$UserType)) {
                  $UserTypeErr = "Only letters and white space allowed in UserType";
                 }
              }
              // $BookingTillp=ZDateHelper::tounixdate($BookingTill);
              // $Past2=ZDateHelper::isPast($BookingTillp);
              // $BookingForp=ZDateHelper::tounixdate($BookingFor);
              // $Past=ZDateHelper::isPast($BookingForp);

              if($Past==1)
              {
                $PastErr="BOOKING START DATE OR TIME IS IN THE PAST";
              }
              if($Past2==1)
              {
                $Past2Err="BOOKING END DATE OR TIME IS IN THE PAST";
              }
              if(($StudentIDErr =="") && ($SocietyErr =="") && ($BookingForErr =="") && ($BookingTillErr =="") && ($PastErr == "") && ($Past2Err == "") && ($UserTypeErr == ""))
              {
              $sql = "INSERT INTO rooms (entryID, ts, StudentID, Society, Room, booking_for, booking_end, Activity, UserType) VALUES (NULL, CURRENT_TIMESTAMP, '$StudentID', '$Society', '$Room', '$BookingFor', '$BookingTill', '$Activity','$UserType')";
               if (mysqli_query($conn, $sql))
              {
                alert("Submitted");

              }
            }
              else
              {
                $message="$StudentIDErr $SocietyErr $BookingForErr $RoomErr $UserTypeErr $Past1Err $Past2Err";
                alert($message);

              }
              mysqli_close($conn);
        }
        catch(Exception $e)
        {
            echo("Error!");
        }
?>
