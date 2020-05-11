-- Database used: SQLite(WebSQL) with SQL Fiddle.

SELECT DISTINCT Instructor FROM InstructorAssignment
WHERE Instructor NOT IN (  
    SELECT C.Instructor                        
    FROM (                            
        SELECT Course.Subject, R2.Instructor          
        FROM Course                  
        CROSS JOIN (               
            SELECT DISTINCT Instructor FROM InstructorAssignment 
        ) AS R2       
    ) AS C                               
    WHERE NOT EXISTS (                   
        SELECT *                           
        FROM InstructorAssignment                               
        WHERE InstructorAssignment.Subject = C.Subject AND InstructorAssignment.Instructor = C.Instructor      
    )
)

/*
We have two tables given to us:
R(a,b) - InstructorAssignment(Instructor,Subject)
S(b) - Course(Subject)

R(a,b) divide S(b) involves the below steps:
1. T1 ← π(a)R 
We get a new  table by projecting the coloumn Instructor on the relation R. 

2. T2 ← π(a)((S x T1) - R)  
We calculate all possible combinations of S(b) with R(a) by computing the R(a) X S(b). We then subtract this with the original relation R. The a coloumn values
in this relation are actually those that are not associated to every value in S(b). Hence in the query written we use CROSS JOIN between instructors in InstructorAssignment
with all values in Course and then use the NOT EXISTS operator to get all those instructors not associated to every value of Course table.

3. T ← T1 - T2  
In this step, we subtract the answers we got in the first step and second step in order to derive all those a coloumn values that are associated with every value of b in S.
Here we choose only those instructors that are associated with every value of subject in Course by using the NOT IN operator present in teh beginning of the query.
*/





