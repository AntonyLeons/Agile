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

$OpeningTime = test_input($_POST["OpeningTime"]);
$timestamp =  strtotime($OpeningTime);
$timestamp_one_hour_earlier = $timestamp - 3600;
$shiftedtime = strftime('%H:%M', $timestamp_one_hour_earlier);
$timestamp = strtotime($shiftedtime);

            //  if(($UserIDErr =="") && ($PasswordErr =="") && ($UserIDErr ==""))
            //  {

            //for (int i =0; i< $Timeopen; i++)
          //  {
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
