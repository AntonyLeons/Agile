INSERT INTO roomcontent ( `Room` ,`IsBooked`, `IsDisabledAccess`, `IsProjector`, `Date`, `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab` ) SELECT `Room` ,`IsBooked`, `IsDisabledAccess`, `IsProjector`, "2019-04-09", `Time`, `RoomCapacity`, `RoomBuilding`, `IsComputerLab`, `IsChemicalLab` FROM roomcontent