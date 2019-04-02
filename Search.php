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
            <li><a href="Fetch.php">Fetch</a></li>
            <li><a class="active" href="Search.html">Search</a></li>
          </ul>

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
  function alert($msg)
  {
    echo "<script type='text/javascript'>
    alert('$msg');
    location='index.html';
    </script>";
  }

  $dbhost = "localhost";
  $dbuser = "appengine";
  $dbpass = "Test";
  $db = "bookings";
  $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);


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
if (empty($_GET["StudentID"])) {
							 $StudentIDErr = "StudentID is required";
						 } else {
							 $StudentID = test_input($_GET["StudentID"]);
							 // check if name only contains letters and whitespace
							 if (!preg_match("/^[0-9][0-9]{2,10}$/",$StudentID)) {
								 $StudentIDErr = "Only Numbers allowed in StudentID";
							 }
						 }
             if ($_GET["Selection"])  {
              $Selection = test_input($_GET["Selection"]);
               if (!preg_match("/^[a-zA-Z ]{0,7}$/",$Selection)) {
                $SelectionErr = "Invalid Selection";
               }
             }
file_put_contents("import.ics", fopen("http://calendars.hull.ac.uk/tcs/Stucal.asp?p1={$StudentID}", 'r'));
require_once("zapcallib.php");

//$icalfile = count($argv) > 1 ? $argv[1] : "abrahamlincoln.ics";
$icalfeed = file_get_contents("import.ics");
$sql="DROP TABLE IF EXISTS `TEMP`;";
$result = mysqli_query($conn, $sql);
$sql="CREATE TABLE IF NOT EXISTS `TEMP` (
  `entryID` varchar(20),
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `StudentID` varchar(20) DEFAULT NULL,
  `Society` varchar(20) DEFAULT NULL,
  `booking_for` timestamp NULL DEFAULT NULL,
  `booking_end` timestamp NULL DEFAULT NULL,
  `Activity` varchar(100) DEFAULT NULL,
  `Room` varchar(255) DEFAULT NULL,
  `UserType` varchar(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;";
$result = mysqli_query($conn, $sql);
$sql="INSERT TEMP SELECT * FROM rooms;";
$result = mysqli_query($conn, $sql);

// create the ical object
$icalobj = new ZCiCal($icalfeed);

//echo "Number of events found: " . $icalobj->countEvents() . "<br />";

$ecount = 0;

// read back icalendar data that was just parsed
if(isset($icalobj->tree->child))
{
	foreach($icalobj->tree->child as $node)
	{
		if($node->getName() == "VEVENT")
		{
			$ecount++;
		//	echo "Event $ecount:<br />";
      $k=0;
        echo "<tr>";
			foreach($node->data as $key => $value)
			{
          $k++;
        if($k=="1")
        {
          $k1=($value->getValues());
          $k1= ZDateHelper::fromiCaltoUnixDateTime($k1);
          $k1= ZDateHelper::toSqlDateTime($k1);
        }
        if($k=="2")
        {
          $k2=($value->getValues());
          $k2= ZDateHelper::fromiCaltoUnixDateTime($k2);
          $k2= ZDateHelper::toSqlDateTime($k2);
        }
        if($k=="9")
        {
          $k9=($value->getValues());
        }
        if($k=="11")
        {
            $k11=($value->getValues());
            $k11=rtrim($k11,"*");
        }
			}
              echo "</tr>" ;
              $sql = "INSERT INTO TEMP (entryID, ts, StudentID, Society, Room, booking_for, booking_end, Activity, UserType) VALUES ('', CURRENT_TIMESTAMP, '$StudentID', '', '$k11', '$k1', '$k2', '$k9','Timetabling')";
          if  (mysqli_query($conn, $sql)){
            }
            else {
            echo  mysqli_error($conn);
            }
		}
	}
}
if($Selection=='Now')
{
$Fetch="SELECT * FROM TEMP WHERE StudentID LIKE '$StudentID' AND booking_for > CURRENT_TIMESTAMP  ORDER BY `temp`.`booking_for` ASC";
$result = mysqli_query($conn, $Fetch);
}
else if($Selection=='All')
{
  $Fetch="SELECT * FROM TEMP WHERE StudentID LIKE '$StudentID' ORDER BY `temp`.`booking_for` ASC";
  $result = mysqli_query($conn, $Fetch);
}
else if($Selection=='Week')
{
$Fetch="SELECT * FROM TEMP WHERE StudentID LIKE '$StudentID' AND booking_for > (SELECT DATE_ADD(CURDATE(), INTERVAL - WEEKDAY(CURDATE()) DAY))  ORDER BY `temp`.`booking_for` ASC";
$result = mysqli_query($conn, $Fetch);
}
while ($row = mysqli_fetch_array($result)) {
    {
        echo "<tr>";
        echo "<td>" . $row['entryID'] . "</td>";
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
