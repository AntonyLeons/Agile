<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Search</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
  <link rel="shortcut icon" type="image/png" href="/favicon.png"/>
<link rel="shortcut icon" type="image/png" href="https://www.hull.ac.uk/site-elements/img/favicon/favicon-57.png"/>
  <script src="main.js"></script>
</head>
<body>
    
</body>
<div class="message">
        <h1>Location Reporting</h1>    
        <p>With Hull University</p>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="AddLocation.html">Edit Location</a></li>
            <li><a href="CurrentLocation.html">Current Location</a></li>
            <li><a href="EditData.html">Edit Data</a></li>
            <!-- <li><a href="Fetch.php">Fetch</a></li>
            <li><a href="Last24hrs.php">Last 24hrs</a></li> -->
            <li><a class="active" href="Search.html">Search</a></li>
          </ul>

</div>
</html>

<?php
  function alert($msg)
  {
    echo "<script type='text/javascript'>alert('$msg');location='Search.html';</script>";
  }
function test_input($data) {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
try  
        {  
          $StudentIDErr = $FirstNameErr = $SurnameErr = $LocationErr = $UserTypeErr = "";
         $StudentID = $FirstName = $Surname = $Location = $UserType = "";
          $serverName = "sql.rde.hull.ac.uk";  
            $connectionOptions = array("Database"=>"rde_554538");
            $conn = sqlsrv_connect($serverName, $connectionOptions);
            if ($_GET["StudentID"]) {
              $StudentID = test_input($_GET["StudentID"]);
              // check if name only contains letters and whitespace
              if (!preg_match("/^[0-9][0-9]{2,10}$/",$StudentID)) {
                $StudentIDErr = "Only Numbers allowed in StudentID"; 
              }
            }
            if ($_GET["FirstName"]) {
              $FirstName = test_input($_GET["FirstName"]);
              // check if name only contains letters and whitespace
              if (!preg_match("/^[a-zA-Z ]{2,20}$/",$FirstName)) {
                $FirstNameErr = "Only letters and white space allowed in First Name"; 
              }
            }
              
            if ($_GET["Surname"]) {
              $Surname = test_input($_GET["Surname"]);
              // check if name only contains letters and whitespace
              if (!preg_match("/^[a-zA-Z ]{2,20}$/",$Surname)) {
                $SurnameErr = "Only letters and white space allowed in Surname"; 
              }
            }
            if ($_GET["Location"])  {
              $Location = test_input($_GET["Location"]);
              // check if name only contains letters and whitespace
              if (!preg_match("/^[a-zA-Z ]{2,40}$/",$Location)) {
                $LocationErr = "Only letters and white space allowed in Location"; 
              }
            }
            if ($_GET["UserType"])  {
              $UserType = test_input($_GET["UserType"]);
               if (!preg_match("/^[a-zA-Z ]{0,7}$/",$Surname)) {
                $SurnameErr = "Only letters and white space allowed in UserType"; 
               }
            }
            if(($StudentIDErr =="") && ($FirstNameErr =="") && ($SurnameErr =="") && ($LocationErr =="") && ($UserTypeErr == ""))
              {
              if(empty($_GET["checkbox"]))
              {
                $Fetch="SELECT * FROM ACW WHERE (?='' OR StudentID LIKE '%' + ? + '%') AND (?='' OR FirstName LIKE '%' + ? + '%') AND (?='' OR Surname LIKE '%' + ? + '%') AND (?='' OR Location LIKE '%' + ? + '%') AND (?='' OR UserType LIKE '%' + ? + '%')";
              }
              else
              {
                $Fetch="SELECT * FROM ACW WHERE (?='' OR StudentID LIKE '%' + ? + '%') AND (?='' OR FirstName LIKE '%' + ? + '%') AND (?='' OR Surname LIKE '%' + ? + '%') AND (?='' OR Location LIKE '%' + ? + '%') AND (?='' OR UserType LIKE '%' + ? + '%') AND Timestamp >= DATEADD(day,-1,GETDATE())";
              }
              $params = array($StudentID,$StudentID,$FirstName,$FirstName,$Surname,$Surname,$Location,$Location,$UserType,$UserType);
              $result= sqlsrv_query($conn, $Fetch, $params);

            echo "
            <style>
            
            table, th, td 
            {
            border: 4px solid black;
            border-collapse: collapse;
            }
            table{width:100%;}
            th, td {
                padding: 15px;
            }
            table tr:nth-child(even) {
                background-color: rgba(187, 187, 187, 0.9);
            }
            table tr:nth-child(odd) {
               background-color: rgba(255, 255, 255, 0.9);
            }
            table th {
                background-color: black;
                color: white;
            }
            </style>
            <table>
        <tr>
        <th>ID</th>
        <th>TimeStamp</th>
        <th>StudentID</th>
        <th>First Name</th>
        <th>Surname</th>
        <th>Location</th>
        <th>User Type</th>
        </tr>";
           while($row = sqlsrv_fetch_array($result)) 
            {
                echo "<tr>";
                echo "<td>" . $row['ID'] . "</td>";
                echo "<td>" . $row['Timestamp']->format('d-m-y H:i:s') . "</td>";
                echo "<td>" . $row['StudentID'] . "</td>";
                echo "<td>" . $row['FirstName'] . "</td>";
                echo "<td>" . $row['Surname'] . "</td>";
                echo "<td>" . $row['Location'] . "</td>";
                echo "<td>" . $row['UserType'] . "</td>";
                echo "</tr>" ;
            }
            
            if (!$sql) {
                if (($errors = sqlsrv_errors()) != null) {
                    foreach ($errors as $error) {
                        echo $error['message'];
                    }
                }
            } 
          }
          else
          {
            $message="$StudentIDErr $FirstNameErr $SurnameErr $LocationErr $UserTypeErr";
            alert($message); 
            sqlsrv_close($conn);
          }
            sqlsrv_close($conn);
        }
        catch(Exception $e)
        {  
            echo("Error!");
        }  


?>