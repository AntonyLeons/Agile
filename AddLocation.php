<?php
 function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }

  function alert($msg)
  {
    echo "<script type='text/javascript'>alert('$msg'); location='AddLocation.html';</script>";
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
              if (!preg_match("/^[1-9][0-9]{2,10}$/",$StudentID)) {
                $StudentIDErr = "Only Numbers allowed in StudentID"; 
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

            $FirstName="SELECT FirstName FROM ACW WHERE StudentID=?";
            $Surname="SELECT Surname FROM ACW WHERE StudentID=?";
            $UserType="SELECT UserType FROM ACW WHERE StudentID=?";
            $params = array($StudentID);
            $FirstName= sqlsrv_query($conn, $FirstName, $params);
            $Surname= sqlsrv_query($conn, $Surname, $params);
            $UserType= sqlsrv_query($conn, $UserType, $params);
            $FirstName= sqlsrv_fetch_array($FirstName);
            $Surname= sqlsrv_fetch_array($Surname);
            $UserType= sqlsrv_fetch_array($UserType);
            if(($StudentIDErr =="") && ($LocationErr ==""))
          {
            $check="SELECT StudentID FROM ACW WHERE StudentID =?";
            $check = sqlsrv_query($conn, $check, $params);     
            $check= sqlsrv_fetch_array($check);
            if ($check['StudentID']==$StudentID) {
            $insert = "INSERT INTO ACW (Timestamp,StudentID,FirstName,Surname,Location,UserType) VALUES (SYSDATETIME(),?,?,?,?,?)";
            $params = array($StudentID,$FirstName[FirstName],$Surname[Surname],$Location,$UserType[UserType]);
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
            $message="$StudentIDErr $LocationErr";
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