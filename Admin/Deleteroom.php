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

                $sql = "DELETE FROM `roomcontent` WHERE `Room` LIKE '$RoomName'";

                if (mysqli_query($conn, $sql))
               {
                 alert("Room Deleted");

               }
           //  }
               else
               {
               //  $message="$UserIDErr $PasswordErr $UserIDErr";
                 alert("error");

               }
               mysqli_close($conn);


              alert("Room Added");

        }
        catch(Exception $e)
        {
            echo("Error!");
        }
?>
