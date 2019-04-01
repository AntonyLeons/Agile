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
<th>TimeStamp</th>
<th>StudentID</th>
<th>Society</th>
<th>Start</th>
<th>End</th>
<th>Activity</th>
<th>Room</th>
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
file_put_contents("import.ics", fopen("http://calendars.hull.ac.uk/tcs/Stucal.asp?p1={$StudentID}", 'r'));
require_once("zapcallib.php");

//$icalfile = count($argv) > 1 ? $argv[1] : "abrahamlincoln.ics";
$icalfeed = file_get_contents("import.ics");

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
        if($k=="0")
        {
          echo "<td>". date("d-m-Y h:i"). "</td>";
          echo "<td>".$StudentID. "</td>";
          echo "<td>"."null". "</td>";
        }
          $k++;
        if($k=="1")
        {
          $k1=($value->getValues());
          $k1= ZDateHelper::fromiCaltoUnixDateTime($k1);
          $k1= ZDateHelper::toSqlDateTime($k1);
          echo "<td>" . $k1 . "</td>";
        }
        if($k=="2")
        {
          $k2=($value->getValues());
          $k2= ZDateHelper::fromiCaltoUnixDateTime($k2);
          $k2= ZDateHelper::toSqlDateTime($k2);
          echo "<td>" . $k2 . "</td>";
        }
        if($k=="9")
        {
          $k9=($value->getValues());
          echo "<td>" . $k9 . "</td>";
        }
        if($k=="11")
        {
            $k11=($value->getValues());
            $k11=rtrim($k11,"*");
            echo "<td>" . $k11 . "</td>";
            echo "<td>" . "Timetabling" . "</td>";
        }
			}
              echo "</tr>" ;
		}
	}
}
?>
