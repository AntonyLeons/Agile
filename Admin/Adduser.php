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
         $UserIDErr = $PasswordErr = $UserTypeErr = "";
         $UserID = $Password = $UserType =  "";


        $servername = null;
        $username = 'appengine';
        $password = 'Test';
        $dbname = Bookings;
        $dbport = null;
                     // Create connection
        $conn = new mysqli($servername, $username, $password, $dbname,
        $dbport, "/cloudsql/agile-235110:europe-west2:agile-4");


                $UserID = test_input($_POST["UserID"]);
               $Password = test_input($_POST["Password"]);
                $UserType = test_input($_POST["UserType"]);




              $sql = "INSERT INTO `logintable`(`ID`, `Password`, `UserType`) VALUES ('$UserID','$Password','$UserType')";
               if (mysqli_query($conn, $sql))
              {
                alert("Submitted");

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
