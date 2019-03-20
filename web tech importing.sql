Use Bookings;
CREATE TABLE ACW (
entryID INT NOT NULL AUTO_INCREMENT, PRIMARY KEY(entryID),
ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
StudentID INT not null,
FirstName VARCHAR (20) not null,
Surname VARCHAR (20) not null,
Location VARCHAR (20) not null,
UserType VARCHAR(7) not null
);
