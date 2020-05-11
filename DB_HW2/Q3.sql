#Database used: MySQL5.6 with SQL Fiddle.

CREATE TABLE TrackProject(PID VARCHAR(8) NOT NULL,
Step INTEGER NOT NULL,
StepStatus CHAR(1) NOT NULL);

INSERT INTO TrackProject VALUES("P100",0,'C');
INSERT INTO TrackProject VALUES("P100",1,'W');
INSERT INTO TrackProject VALUES("P100",2,'W');
INSERT INTO TrackProject VALUES("P201",0,'C');
INSERT INTO TrackProject VALUES("P201",1,'C');
INSERT INTO TrackProject VALUES("P333",0,'W');
INSERT INTO TrackProject VALUES("P333",1,'W');
INSERT INTO TrackProject VALUES("P333",2,'W');
INSERT INTO TrackProject VALUES("P333",3,'W');
INSERT INTO TrackProject VALUES("P444",0,'C');
INSERT INTO TrackProject VALUES("P444",1,'W');
INSERT INTO TrackProject VALUES("P444",2,'W');
INSERT INTO TrackProject VALUES("P444",3,'W');

SELECT PID FROM TrackProject AS TP1 WHERE Step = 0 AND StepStatus = 'C' AND 'W'= ALL(SELECT StepStatus FROM TrackProject AS TP2 WHERE step <> 0 AND TP1.PID = TP2.PID);
