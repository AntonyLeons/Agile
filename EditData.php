<?php
 function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
  function alert($msg)
  {
    echo "<script type='text/javascript'>alert('$msg');location='EditData.html';</script>";
  }
try  
        {  
          $StudentIDErr = $FirstNameErr = $SurnameErr = $LocationErr = $UserTypeErr = "";
         $StudentID = $FirstName = $Surname = $Location = $UserType = "";
          $serverName = "sql.rde.hull.ac.uk";  
            $connectionOptions = array("Database"=>"rde_554538");
            $conn = sqlsrv_connect($serverName, $connectionOptions);
            
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
                $SFirstNameErr = "Name is required";
              } else {
                $FirstName = test_input($_POST["FirstName"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,20}$/",$FirstName)) {
                  $FirstNameErr = "Only letters and white space allowed"; 
                }
              }
                
              if (empty($_POST["Surname"])) {
                $SurnameErr = "Surname is required";
              } else {
                $Surname = test_input($_POST["Surname"]);
                // check if name only contains letters and whitespace
                if (!preg_match("/^[a-zA-Z ]{2,20}$/",$Surname)) {
                  $SurnameErr = "Only letters and white space allowed"; 
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

              if(($StudentIDErr =="") && ($FirstNameErr =="") && ($SurnameErr =="") && ($UserTypeErr == ""))
              {
                $check="SELECT StudentID FROM ACW WHERE StudentID ='$StudentID'";
                $check = sqlsrv_query($conn, $check);     
                $check= sqlsrv_fetch_array($check);
                if ($check['StudentID']==$StudentID) {
                $insert = "UPDATE dbo.ACW SET FirstName=?,Surname=?,UserType=? WHERE StudentID=?";
                $params = array($FirstName,$Surname,$UserType,$StudentID);
                $sql = sqlsrv_query($conn, $insert, $params);
                alert("Submitted"); 
              }
              else
              {
                $message="StudentID $StudentID Does NOT exist";
                alert($message); 
              }
              }
            else
          {
            $message="$StudentIDErr $FirstNameErr $SurnameErr $UserTypeErr";
            alert($message); 
            sqlsrv_close($conn);
          }
            if (!$sql) {
                if (($errors = sqlsrv_errors()) != null) {
                    foreach ($errors as $error) {
                        echo $error['message'];
                    }
                }
            } 
            sqlsrv_close($conn);
        }  
        catch(Exception $e)
        {  
            echo("Error!");
        }  
?>