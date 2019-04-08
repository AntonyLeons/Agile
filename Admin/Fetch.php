<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../styles.css" />
    <link rel="shortcut icon" type="image/png" href="/favicon.png"/>
  <link rel="shortcut icon" type="image/png" href="https://www.hull.ac.uk/site-elements/img/favicon/favicon-57.png"/>
    <script src="main.js"></script>
</head>
<body>
<div class="message">
        <h1>Location Reporting</h1>
        <h2>With Hull University</h2>
        <ul>
            <li><a href="AdminPortal.html">Home</a></li>
            <li><a class="active" href="Avalible.html">Find Avalible Rooms</a></li>
            <li><a href="Search.html">My Timetable</a></li>
            <li><a href="../index.html">Logout</a></li>
          </ul>

</div>
</body>

</html>




<?php
require __DIR__ . '/vendor/autoload.php';
require __DIR__ . '/env.php';
  $servername = null;
  $username = 'appengine';
  $password = 'Test';
  $dbname = Bookings;
  $dbport = null;
  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname,
  	$dbport, "/cloudsql/agile-235110:europe-west2:agile-4");
            $Fetch="SELECT * FROM rooms";
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
        <th>Society</th>
        <th>Room</th>
        <th>Start</th>
        <th>End</th>
        <th>Activity</th>
        <th>User Type</th>
        </tr>";
        while ($row = mysqli_fetch_array($result)) {
            {
                echo "<tr>";
                echo "<td>".$row['entryID']."</td>";
                echo "<td>" . $row['ts']. "</td>";
                echo "<td>" . $row['StudentID'] . "</td>";
                echo "<td>" . $row['Society'] . "</td>";
                echo "<td>" . $row['Room'] . "</td>";
                echo "<td>" . $row['booking_for'] . "</td>";
                echo "<td>" . $row['booking_end'] . "</td>";
                echo "<td>" . $row['Activity'] . "</td>";
                echo "<td>" . $row['UserType'] . "</td>";
                echo "</tr>" ;
            }
        }
        mysqli_free_result($result);
        mysqli_close($conn);


?>
