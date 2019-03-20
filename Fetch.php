<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
    <script src="main.js"></script>
</head>
<body>
<div class="message">
        <h1>Location Reporting</h1>    
        <p>With Hull University</p>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="AddLocation.html">Edit Location</a></li>
            <li><a href="EditData.html">Edit Data</a></li>
            <li><a class="active" href="Fetch.php">Fetch</a></li>
            <li><a href="Last24hrs.php">Last 24hrs</a></li>
            <li><a href="Search.html">Search</a></li>
          </ul>

</div>
</body>

</html>
<?php
try  
        {  $serverName = "sql.rde.hull.ac.uk";  
            $connectionOptions = array("Database"=>"rde_554538");
            $conn = sqlsrv_connect($serverName, $connectionOptions);
            $Fetch="SELECT * FROM ACW";
            $result= sqlsrv_query($conn, $Fetch);
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
            sqlsrv_close($conn);
        }  
        catch(Exception $e)
        {  
            echo("Error!");
        }  
?>