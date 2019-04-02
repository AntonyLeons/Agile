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
            <li><a class="active" href="Fetch.php">Fetch</a></li>
            <li><a href="Search.html">Search</a></li>
          </ul>

</div>
</body>

</html>




<?php
$dbhost = "localhost";
$dbuser = "appengine";
$dbpass = "Test";
$db = "Bookings";
$conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);
            $Fetch="SELECT * FROM roomcontent";
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
        <th>Room</th>
        <th>IsBooked</th>
        <th>Disabled Access?</th>

        <th>Projector? </th>
        <th>Latest Booking</th>
        <th>Duration Of Booking</th>
        <th>Capacity</th>
        <th>Building</th>
        <th>Computer Lab?</th>

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
                echo "<td>" . $row['RoomCapacity'] . "</td>";
                echo "<td>" . $row['RoomBuilding'] . "</td>";
                echo "<td>" . $row['IsComputerLab'] . "</td>";

                echo "</tr>" ;
            }
        }
        mysqli_close($conn);
        mysqli_free_result($result);
?>