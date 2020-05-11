#Database used: MySQL5.6 with SQL Fiddle.

CREATE TABLE InstructorAssignment(Instructor VARCHAR(15) NOT NULL,
Subject VARCHAR(10) NOT NULL                                  
);

INSERT INTO InstructorAssignment VALUES("Aleph","Scratch");
INSERT INTO InstructorAssignment VALUES("Aleph","Java");
INSERT INTO InstructorAssignment VALUES("Aleph","Processing");
INSERT INTO InstructorAssignment VALUES("Bit","Python");
INSERT INTO InstructorAssignment VALUES("Bit","JavaScript");
INSERT INTO InstructorAssignment VALUES("Bit","Java");
INSERT INTO InstructorAssignment VALUES("CRC","Python");
INSERT INTO InstructorAssignment VALUES("CRC","JavaScript");
INSERT INTO InstructorAssignment VALUES("Dat","Scratch");
INSERT INTO InstructorAssignment VALUES("Dat","Python");
INSERT INTO InstructorAssignment VALUES("Dat","JavaScript");
INSERT INTO InstructorAssignment VALUES("Emscr","Scratch");
INSERT INTO InstructorAssignment VALUES("Emscr","Processing");
INSERT INTO InstructorAssignment VALUES("Emscr","JavaScript");
INSERT INTO InstructorAssignment VALUES("Emscr","Python");
INSERT INTO InstructorAssignment VALUES("Frank","Python");
INSERT INTO InstructorAssignment VALUES("Frank","JavaScript");
INSERT INTO InstructorAssignment VALUES("Frank","Scratch");
INSERT INTO InstructorAssignment VALUES("Frank","Java");

CREATE TABLE COURSE(
Subject VARCHAR(10) NOT NULL);

INSERT INTO COURSE VALUES("JavaScript");
INSERT INTO COURSE VALUES("Scratch");
INSERT INTO COURSE VALUES("Python");

SELECT Instructor FROM InstructorAssignment WHERE Subject IN (SELECT Subject from COURSE) GROUP BY Instructor HAVING COUNT(*)=(SELECT COUNT(*) FROM COURSE);

/*
We are required to find all those professors who can teach all courses listed in the Course table. 
In order to do that, first we group the InstructorAssignment table based on Instructor in order to get all those rows that each professor teaches and get a count of the rows
to know the number of courses taught by the instructor. We then match it to the count of the rows present in Course table to because only if that condition is met we can be sure that
a particular intstructor can teach all the necessary subjects.  We filter all those records later based on the condition that the subject taught by an instructor is present
in the Course table because we only want to find all those professors who can teach the subjects listed in Course table not all which is represented by the IN operator 
present in the beginnning of the query.
*/
