--Database used: SQLite.js(SQL.js) with SQL Fiddle.

CREATE TABLE ProjectRoomBookings
(roomNum INTEGER NOT NULL,
startTime INTEGER NOT NULL,
endTime INTEGER NOT NULL,
groupName CHAR(10) NOT NULL,
PRIMARY KEY (roomNum, startTime),
CONSTRAINT CHK1 CHECK (startTime < endTime)
);

INSERT into ProjectRoomBookings values(1,7,9,'A');
INSERT into ProjectRoomBookings values(1,11,13,'B');
INSERT into ProjectRoomBookings values(1,10,11,'C');
INSERT into ProjectRoomBookings values(2,15,14,'D');

/*

1. In order to fix the first issue, we add a constraint to make sure that every row that is entered has startTime lesser than endTime.
If we add a row where the startTime is greater than endTime, then the constraint is violated and we get a error.

*/