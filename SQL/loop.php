<?php

$dbhost = "localhost";
         $dbuser = "appengine";
         $dbpass = "Test";
         $db = "Bookings";
         $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $db);

         $i = 1;
         while($i <= 100){

             $sql = "INSERT INTO roomcontent ( `Room` ,`IsBooked`, `IsDisabledAccess`, `IsProjector`, `Date`, `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab` ) SELECT `Room` ,`IsBooked`, `IsDisabledAccess`, `IsProjector`,(SELECT DATE_ADD('2019-04-09', INTERVAL '$i' DAY)), `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab` FROM roomcontent";
            mysqli_query($conn, $sql);
               $i++;
         }
