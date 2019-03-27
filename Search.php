<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Search</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" media="screen" href="styles.css" />
    <link rel="shortcut icon" type="image/png" href="/favicon.png" />
    <link rel="shortcut icon" type="image/png" href="https://www.hull.ac.uk/site-elements/img/favicon/favicon-57.png" />
    <script src="main.js"></script>
</head>

<body>

</body>
<div class="message">
    <h1>Room Booking</h1>
    <p>With Hull University</p>
    <ul>
        <li><a href="index.html">Home</a></li>
       <!-- <li><a href="AddLocation.html">Edit Location</a></li>
        <li><a href="CurrentLocation.html">Current Location</a></li>
        <li><a href="EditData.html">Edit Data</a></li>
         <li><a href="Fetch.php">Fetch</a></li>
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
function test_input($data)
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
  $StudentIDErr = $SocietyErr = $BookingForErr = $RoomErr = $UserTypeErr = $BookingTillErr = "";
  $StudentID = $Society = $BookingFor = $Room = $UserType = $Activity = $BookingTill = "";

  $dbhost = "localhost";
  $dbuser = "appengine";
  $dbpass = "Test";
  $db = "Bookings";
  $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);

    $StudentID = test_input($_GET["StudentID"]);
    // check if name only contains letters and whitespace
    if (!preg_match("/^[0-9][0-9]{2,10}$/", $StudentID)) {
      $StudentIDErr = "Only Numbers allowed in StudentID";
    }
  
    $Society = test_input($_GET["Society"]);
    // check if name only contains letters and whitespace

  if (($StudentIDErr == "") && $SocietyErr=="") {
      if (empty($_GET["checkbox"])) {
          $Fetch = "SELECT * FROM rooms WHERE ('$StudentID'='' OR StudentID = '$StudentID') AND ('$Society'='' OR Society = '$Society')";
        } else {
          $Fetch = "SELECT * FROM rooms WHERE ('$StudentID'='' OR StudentID = '$StudentID') AND ('$Society'='' OR Society = '$Society')  AND ts >= DATEADD(day,-1,GETDATE())";
        }
       //// SELECT * FROM rooms WHERE ('$StudentID'='' OR StudentID LIKE '554538' ) AND ('$Society'='' OR Society LIKE '$Society') AND ('$Activity'='' OR Activity LIKE '$Activity') AND ('$Room'='' OR Room LIKE '$Room' ) AND ('$UserType'='' OR UserType LIKE '$UserType')
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
        <th>Activity</th>
        <th>User Type</th>
        </tr>";
          while ($row = mysqli_fetch_array($result)) {
              echo "<tr>";
              echo "<td>" . $row['entryID'] . "</td>";
              echo "<td>" . $row['ts'] . "</td>";
              echo "<td>" . $row['StudentID'] . "</td>";
              echo "<td>" . $row['Society'] . "</td>";
              echo "<td>" . $row['Room'] . "</td>";
              echo "<td>" . $row['Activity'] . "</td>";
              echo "<td>" . $row['UserType'] . "</td>";
              echo "</tr>";
            }
            mysqli_free_result($result);
        } else {
          alert("$SocietyErr");
        }
      mysqli_close($conn);
      
  ?>