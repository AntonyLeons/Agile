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


          //  if (empty($_POST["UserID"])) {
              //  $UserIDErr = "User ID is required";
              //} else {
                $UserID = test_input($_POST["UserID"]);
                // check if name only contains letters and whitespace
                //if (!preg_match("/^[0-9][0-9]{2,10}$/",$UserID)) {
                //  $UserIDErr = "Only Numbers allowed in User ID";
                //}
              //}
              //if (empty($_POST["Password"])) {
              //  $PasswordErr = "Password is required";
            //  } else {
               $Password = test_input($_POST["Password"]);


            //  }
              //if (empty($_POST["UserType"])) {
            //    $UserTypeErr = "User Type is required";
            //  } else {
                $UserType = test_input($_POST["UserType"]);
              //  if (!preg_match("/^[a-zA-Z ]{2,20}$/",$UserType)) {
                //  $UserTypeErr = "Only letters and white space allowed in First Name";
              //  }
            //  }



            //  if(($UserIDErr =="") && ($PasswordErr =="") && ($UserIDErr ==""))
            //  {
              $sql = "INSERT INTO `logintable`(`ID`, `Password`, `UserType`) VALUES ('$UserID','$Password','$UserType')";
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
