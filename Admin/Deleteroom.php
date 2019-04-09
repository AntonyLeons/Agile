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
