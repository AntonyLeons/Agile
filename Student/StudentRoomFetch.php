<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Data</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="../styles.css" />
    <script src="main.js"></script>
</head>
<body>
<div class="message">
        <h1>Location Reporting</h1>
        <h2>With Hull University</h2>
        <ul>
            <li><a href="StudentPortal.html">Home</a></li>
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
require("../vendor/autoload.php");
require("../env.php");
  $servername = null;
  $username = 'appengine';
  $password = 'Test';
  $dbname = Bookings;
  $dbport = null;
  // Create connection
  $conn = new mysqli($servername, $username, $password, $dbname,
  	$dbport, "/cloudsql/agile-235110:europe-west2:agile-4");

function test_input($data)
 {
    $data = trim($data);
    $data = stripslashes($data);
    $data = htmlspecialchars($data);
    return $data;
  }


$maxcapacity =20;

$TimeSearch = $_GET["Timesearch"];
            $Fetch="SELECT * FROM roomcontent WHERE `Time` LIKE '%$TimeSearch%' AND `IsBooked` LIKE 'No' AND `IsComputerLab`LIKE 'No' AND `RoomCapacity` <=  '$maxcapacity' AND `IsChemicalLab` LIKE 'No'";
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
        <th>Disabled Access?</th>

        <th>Time</th>
        <th>Capacity</th>
        <th>Building</th>


        </tr>";

        while ($row = mysqli_fetch_array($result)) {
            {
                echo "<tr>";
                echo "<td>".$row['Room']."</td>";
                echo "<td>" . $row['IsDisabledAccess'] . "</td>";
                echo "<td>" . $row['Time'] . "</td>";
                echo "<td>" . $row['RoomCapacity'] . "</td>";
                echo "<td>" . $row['RoomBuilding'] . "</td>";
              ;

                echo "</tr>" ;
            }
        }
        mysqli_close($conn);
        mysqli_free_result($result);
?>
