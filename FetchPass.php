<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
    <link rel="shortcut icon" type="image/png" href="/favicon.png"/>
  <link rel="shortcut icon" type="image/png" href="https://www.hull.ac.uk/site-elements/img/favicon/favicon-57.png"/>
    <script src="main.js"></script>
</head>
<body>
<div class="message">
        <h1>Location Reporting</h1>
        <h2>With Hull University</h2>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a class="active" href="Fetch.php">Fetch</a></li>
            <li><a href="Search.html">Search</a></li>
          </ul>

</div>
</body>

</html>




<?php
$dbhost = "35.246.48.149";
$dbuser = "appengine";
$dbpass = "Test";
$db = "Bookings";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);
            $Fetch="SELECT * FROM logintable";
            $result = mysqli_query($conn, $Fetch);
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
                color: black;
            }
            table tr:nth-child(odd) {
               background-color: rgba(255, 255, 255, 0.9);
               color: black;
            }
            table th {
                background-color: black;
                color: white;
            }
            </style>
            <table>
        <tr>
        <th>ID</th>
        <th>Password</th>
        <th>UserType</th>

        </tr>";
        while ($row = mysqli_fetch_array($result)) {
            {
                echo "<tr>";
                echo "<td>".$row['ID']."</td>";
                echo "<td>" . $row['Password']. "</td>";
                echo "<td>" . $row['UserType'] . "</td>";
                echo "</tr>" ;
            }
        }
        mysqli_free_result($result);
        mysqli_close($conn);


?>
