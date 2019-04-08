
<?php
function alert($msg)
{
  echo "<script type='text/javascript'>
  alert('$msg');
  location='index.html';
  </script>";
}

$dbhost = "localhost";
$dbuser = "appengine";
$dbpass = "Test";
$db = "Bookings";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);


$GetID =   $_POST["IDform"];
$GetPass =   $_POST["Passwordform"];

$validateID ="SELECT ID FROM logintable WHERE `ID` LIKE $GetID";
$ValidatePass = "SELECT Password FROM logintable WHERE `ID` LIKE $GetID";
$usertype = "SELECT UserType FROM logintable WHERE `ID` LIKE $GetID";

$result = mysqli_query($conn,$validateID);

$dataID = mysqli_fetch_array($result);


        if ($dataID['ID'] == $GetID)
        {
        $result2 =  mysqli_query($conn,$ValidatePass);
          $dataPass = mysqli_fetch_array($result2);
          if ($dataPass['Password'] == $GetPass)
          {
          $result3 = mysqli_query($conn, $usertype);
            $dataUser = mysqli_fetch_array($result3);
              if ($dataUser['UserType'] =="Staff")
              {
                echo "<script type='text/javascript'>
                location='Staff/StaffPortal.html';
                </script>";
              }
              if ($dataUser['UserType'] =="Student")
              {
                echo "<script type='text/javascript'>
                location='Student/StudentPortal.html';
                </script>";
              }
              if ($dataUser['UserType'] =="Admin")
              {
                echo "<script type='text/javascript'>
                location='Admin/AdminPortal.html';
                </script>";
              }
              if ($dataUser['UserType'] =="Lecturer")
              {
                echo "<script type='text/javascript'>
                location='Lecturer/LecturerPortal.html';
                </script>";
              }
              if ($dataUser['UserType'] =="Society")
              {
                echo "<script type='text/javascript'>
                location='Society/SocietyPortal.html';
                </script>";
              }
          }
          else
          {
              alert("Unknown ID or Password");
          }
        }
        else
        {
         alert("Unknown ID or Password");
        }

       mysqli_free_result($result);
       mysqli_free_result($result2);
       mysqli_free_result($result3);
        mysqli_close($conn);


?>
