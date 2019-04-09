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


                $UserID = test_input($_POST["UserID"]);
                $sql = "DELETE FROM `logintable` WHERE `logintable`.`ID` = '$UserID';";

                if (mysqli_query($conn, $sql))
               {
                 alert("User Deleted");

               }
               else
               {
                 alert("error");

               }
               mysqli_close($conn);

        }
        catch(Exception $e)
        {
            echo("Error!");
        }
?>
