<?php
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
    location='AdminPortal.html';
    </script>";
  }
try
        {
         $dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);

                $RoomName = test_input($_POST["RoomName"]);
               $RoomBuilding = test_input($_POST["RoomBuilding"]);
                $OpeningTime = test_input($_POST["OpeningTime"]);

$Disabled = test_input($_POST["Disabled"]);
$Projector = test_input($_POST["Projector"]);
$RoomCapacity = test_input($_POST["RoomCapacity"]);
$Chemicallab = test_input($_POST["Chemicallab"]);
$ComputerLab = test_input($_POST["ComputerLab"]);
$Timeopen = test_input($_POST["Timeopen"]);

$OpeningTime = test_input($_POST["OpeningTime"]);
$timestamp =  strtotime($OpeningTime);
$timestamp_one_hour_earlier = $timestamp - 3600;
$shiftedtime = strftime('%H:%M', $timestamp_one_hour_earlier);
$timestamp = strtotime($shiftedtime);

              for ($i=0; $i < $Timeopen ; $i++) {

                $timestamp_one_hour_later = $timestamp + 3600;
                $shiftedtime = strftime('%H:%M', $timestamp_one_hour_later);
                $timestamp = strtotime($shiftedtime);


                $sql = "INSERT INTO `roomcontent`(`Room`, `IsBooked`, `IsDisabledAccess`, `RoomID`, `IsProjector`, `LatestBooking`, `BookedDuration`, `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab`) VALUES
              ('$RoomName','No','$Disabled',NULL,'$Projector', NULL,NULL,'$shiftedtime','$RoomCapacity','$RoomBuilding','$ComputerLab','$Chemicallab')";

                mysqli_query($conn, $sql);

              }
              alert("Room Added");

        }
        catch(Exception $e)
        {
            echo("Error!");
        }
?>
