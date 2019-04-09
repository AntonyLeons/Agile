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
         $UserIDErr = $PasswordErr = $UserTypeErr = "";
         $UserID = $Password = $UserType =  "";

         $dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);


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
