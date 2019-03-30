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
if (empty($_POST["StudentID"])) {
							 $StudentIDErr = "StudentID is required";
						 } else {
							 $StudentID = test_input($_POST["StudentID"]);
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

echo "Number of events found: " . $icalobj->countEvents() . "\n";

$ecount = 0;

// read back icalendar data that was just parsed
if(isset($icalobj->tree->child))
{
	foreach($icalobj->tree->child as $node)
	{
		if($node->getName() == "VEVENT")
		{
			$ecount++;
			echo "Event $ecount:\n";
			foreach($node->data as $key => $value)
			{
				if(is_array($value))
				{
					for($i = 0; $i < count($value); $i++)
					{
						$p = $value[$i]->getParameters();
						echo "  $key: " . $value[$i]->getValues() . "\n";
					}
				}
				else
				{
					echo "  $key: " . $value->getValues() . "\n";
				}
			}
		}
	}
}

?>
