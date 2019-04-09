<?php
require("../vendor/autoload.php");
require("../env.php");
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
          $servername = null;
          $username = 'appengine';
          $password = 'Test';
          $dbname = Bookings;
          $dbport = null;
          // Create connection
          $conn = new mysqli($servername, $username, $password, $dbname,
          	$dbport, "/cloudsql/agile-235110:europe-west2:agile-4");



                $RoomName = test_input($_POST["RoomName"]);
                $sql = "DELETE FROM `roomcontent` WHERE `Room` LIKE '$RoomName'";

                if (mysqli_query($conn, $sql))
               {
                 alert("Room Deleted");

               }
               else
               {
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
