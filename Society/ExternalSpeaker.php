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
    location='SocietyPortal.html';
    </script>";
  }
try
        {
         $UserIDErr = $PasswordErr = $UserTypeErr = "";
         $UserID = $Password = $UserType =  "";

         $dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);

                $SocietyID = test_input($_POST["SocietyID"]);
               $BookedRoomID = test_input($_POST["BookedRoomID"]);
                $SpeakerID = test_input($_POST["SpeakerID"]);

            $SpeakerName = test_input($_POST["SpeakerName"]);
            $Affiliation = test_input($_POST["Affiliation"]);
            $SpeechTopic = test_input($_POST["SpeechTopic"]);
            $SpeechDescription = test_input($_POST["SpeechDescription"]);

$SpeakerIDCompare ="SELECT `ID` FROM `logintable` WHERE `UserType` LIKE 'Speaker' AND `ID` LIKE '$SpeakerID'";
$fetchedresult = mysqli_query($conn, $SpeakerIDCompare);
$row = mysqli_fetch_array($fetchedresult);



$BookedRoomFetchCompare = "SELECT `RoomID` FROM `roomcontent` WHERE `IsBooked` LIKE 'Yes' AND `RoomID` LIKE '$BookedRoomID'";
$fetchedresult2 = mysqli_query($conn, $BookedRoomFetchCompare);
$row2 = mysqli_fetch_array($fetchedresult2);

if ($row['ID'] == $SpeakerID)
{
  if($row2['RoomID'] == $BookedRoomID)
  {


    $sql = "INSERT INTO `speakers`(`SpeakerID`, `SocietyID`, `RoomID`, `SpeakerName`, `Affiliation`, `SpeechTopic`, `SpeechDescription`, `PrimKey`) VALUES ('$SpeakerID','$SocietyID','$BookedRoomID','$SpeakerName','$Affiliation','$SpeechTopic','$SpeechDescription',NULL)";
     if (mysqli_query($conn, $sql))
    {
      alert("Submitted");

    }
    else
    {
     alert("error");

    }
  }
  else {
    alert("Please Book a room for you speaker");
  }

}
else {
    alert("Wrong Speaker ID. If you dont know your speakers ID please contact the union");
}


              mysqli_close($conn);
        }
        catch(Exception $e)
        {
           echo("Error!");
        }
?>
