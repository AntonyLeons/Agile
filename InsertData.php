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
    location='index.html';
    </script>";
  }
try  
        { 
         $StudentIDErr = $FirstNameErr = $SurnameErr = $LocationErr = $UserTypeErr = "";
         $StudentID = $FirstName = $Surname = $Location = $UserType = "";

         $dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "Bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);
         
         
            if (empty($_POST["StudentID"])) {
                $StudentIDErr = "StudentID is required";
              } else {
                $StudentID = test_input($_POST["StudentID"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[0-9][0-9]{2,10}$/",$StudentID)) {
                  $StudentIDErr = "Only Numbers allowed in StudentID"; 
                }
              }
              if (empty($_POST["FirstName"])) {
                $FirstNameErr = "Firstname is required";
              } else {
                $FirstName = test_input($_POST["FirstName"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,20}$/",$FirstName)) {
                  $FirstNameErr = "Only letters and white space allowed in First Name"; 
                }
              }
                
              if (empty($_POST["Surname"])) {
                $SurnameErr = "Surname is required";
              } else {
                $Surname = test_input($_POST["Surname"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,20}$/",$Surname)) {
                  $SurnameErr = "Only letters and white space allowed in Surname"; 
                }
              }
              if (empty($_POST["Location"])) {
                $LocationErr = "Location is required";
              } else {
                $Location = test_input($_POST["Location"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,40}$/",$Location)) {
                  $LocationErr = "Only letters and white space allowed in Location"; 
                }
              }
              if (empty($_POST["UserType"])) {
                $UserTypeErr = "UserType is required";
              } else {
                $UserType = test_input($_POST["UserType"]);
                 if (!preg_match("/^[a-zA-Z ]{0,7}$/",$UserType)) {
                  $UserTypeErr = "Only letters and white space allowed in UserType"; 
                 }
              }
              $sql = "INSERT INTO ACW (StudentID,FirstName,Surname,Location,UserType) VALUES ('$StudentID','$FirstName','$Surname','$Location','$UserType')";
               if (mysqli_query($conn, $sql)) 
              {
                alert("Submitted"); 
              }
              else
              {
                $message="$StudentIDErr $FirstNameErr $SurnameErr $LocationErr $UserTypeErr";
                alert("message");
                
              }
              mysqli_close($conn);
        }  
        catch(Exception $e)
        {  
            echo("Error!");
        }  
?>