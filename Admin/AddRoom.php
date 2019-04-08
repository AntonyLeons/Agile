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
        // $UserIDErr = $PasswordErr = $UserTypeErr = "";
         //$RoomName = $RoomBuilding = $OpeningTime = $Disabled = $Projector = $RoomCapacity = $Chemicallab = $ComputerLab = $Timeopen =   "";

         $dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);


          //  if (empty($_POST["UserID"])) {
              //  $UserIDErr = "User ID is required";
              //} else {
                $RoomName = test_input($_POST["RoomName"]);
                // check if name only contains letters and whitespace
                //if (!preg_match("/^[0-9][0-9]{2,10}$/",$UserID)) {
                //  $UserIDErr = "Only Numbers allowed in User ID";
                //}
              //}
              //if (empty($_POST["Password"])) {
              //  $PasswordErr = "Password is required";
            //  } else {
               $RoomBuilding = test_input($_POST["RoomBuilding"]);


            //  }
              //if (empty($_POST["UserType"])) {
            //    $UserTypeErr = "User Type is required";
            //  } else {
                $OpeningTime = test_input($_POST["OpeningTime"]);
              //  if (!preg_match("/^[a-zA-Z ]{2,20}$/",$UserType)) {
                //  $UserTypeErr = "Only letters and white space allowed in First Name";
              //  }
            //  }
$Disabled = test_input($_POST["Disabled"]);
$Projector = test_input($_POST["Projector"]);
$RoomCapacity = test_input($_POST["RoomCapacity"]);
$Chemicallab = test_input($_POST["Chemicallab"]);
$ComputerLab = test_input($_POST["ComputerLab"]);
$Timeopen = test_input($_POST["Timeopen"]);


            //  if(($UserIDErr =="") && ($PasswordErr =="") && ($UserIDErr ==""))
            //  {
              $sql = "INSERT INTO `roomcontent`(`Room`, `Society`, `IsBooked`, `IsDisabledAccess`, `RoomID`, `IsProjector`, `LatestBooking`, `BookedDuration`, `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab`, `Activity`) VALUES
('$RoomName',NULL,'No','$Disabled','#this is where autoID should be ','$Projector', NULL,NULL,'#GeneratedTime','$RoomCapacity','$RoomBuilding','$ComputerLab','$Chemicallab',NULL)";
               if (mysqli_query($conn, $sql))
              {
                alert("Submitted");

              }
          //  }
              else
              {
              //  $message="$UserIDErr $PasswordErr $UserIDErr";
                alert("error");

              }
              mysqli_close($conn);
        }
        catch(Exception $e)
        {
            echo("Error!");
        }
?>
