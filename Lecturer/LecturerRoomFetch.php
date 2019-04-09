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
            <li><a href="LecturerPortal.html">Home</a></li>
            <li><a class="active" href="Avalible.html">Find Avalible Rooms</a></li>
            <li><a href="Search.html">My Timetable</a></li>
            <li><a href="../index.html" onclick="logoutclear()">Logout</a></li>
          </ul>

          <script>
          var logoutclear = function()
          {
            localStorage.clear();
          }
          </script>

</div>
</body>

</html>




<?php
function test_input($data)
 {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }
$dbhost = "localhost";
$dbuser = "appengine";
$dbpass = "Test";
$db = "Bookings";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);
$TimeSearch = $_GET["Timesearch"];
            $Fetch="SELECT * FROM roomcontent WHERE `Time` LIKE '%$TimeSearch%' AND `IsBooked` LIKE 'No'";
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
        <th>Room</th>
        <th>IsBooked</th>
        <th>Disabled Access?</th>

        <th>Projector? </th>
        <th>Latest Booking</th>
        <th>Duration Of Booking</th>
        <th>Time</th>
        <th>Capacity</th>
        <th>Building</th>
        <th>Computer Lab?</th>
        <th>Chemical Lab?</th>
        </tr>";

        while ($row = mysqli_fetch_array($result)) {
            {
                echo "<tr>";
                echo "<td>".$row['Room']."</td>";
                echo "<td>" . $row['IsBooked']. "</td>";
                echo "<td>" . $row['IsDisabledAccess'] . "</td>";

                echo "<td>" . $row['IsProjector'] . "</td>";
                echo "<td>" . $row['LatestBooking'] . "</td>";
                echo "<td>" . $row['BookedDuration'] . "</td>";
                  echo "<td>" . $row['Time'] . "</td>";
                echo "<td>" . $row['RoomCapacity'] . "</td>";
                echo "<td>" . $row['RoomBuilding'] . "</td>";
                echo "<td>" . $row['IsComputerLab'] . "</td>";
                echo "<td>" . $row['IsChemicalLab'] . "</td>";
                echo "</tr>" ;
            }
        }
        mysqli_close($conn);
        mysqli_free_result($result);
?>
