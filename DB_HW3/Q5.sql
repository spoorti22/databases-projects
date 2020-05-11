#Using Mac 
#Please run CREATE EXTENSION postgis; 

CREATE TABLE usclocations(
    ID varchar(20) PRIMARY KEY,
    POINTS geometry
);

insert into usclocations VALUES ('Leavey',ST_GeomFromText('POINT(-118.282948 34.021864)'));
insert into usclocations VALUES ('VKC',ST_GeomFromText('POINT(-118.284024 34.021427)'));
insert into usclocations VALUES ('Doheny',ST_GeomFromText('POINT(-118.283755 34.020225)'));
insert into usclocations VALUES ('ScienceAndEngg',ST_GeomFromText('POINT(-118.288798 34.019843)'));
insert into usclocations VALUES ('Hoose',ST_GeomFromText('POINT(-118.286616 34.018940)'));

insert into usclocations VALUES ('TutorHall',ST_GeomFromText('POINT(-118.289994 34.020064)'));
insert into usclocations VALUES ('Starbucks',ST_GeomFromText('POINT(-118.282182 34.021697)'));
insert into usclocations VALUES ('CoffeeBean',ST_GeomFromText('POINT(-118.286299 34.020208)'));
insert into usclocations VALUES ('Lemonade',ST_GeomFromText('POINT(-118.286133 34.020615)'));
insert into usclocations VALUES ('LittleGalen',ST_GeomFromText('POINT(-118.287092 34.022892)'));

insert into usclocations VALUES ('HancockFnd',ST_GeomFromText('POINT(-118.284978 34.019731)'));
insert into usclocations VALUES ('MichelsonHall',ST_GeomFromText('POINT(-118.289284 34.021957)'));
insert into usclocations VALUES ('WallisAnnenberg',ST_GeomFromText('POINT(-118.287112 34.020903)'));
insert into usclocations VALUES ('MuddHall',ST_GeomFromText('POINT(-118.286869 34.018799)'));
insert into usclocations VALUES ('ViterbiSchool',ST_GeomFromText('POINT(-118.289326 34.020595)'));

#1. Finds the convex hull
select st_astext(st_convexhull(ST_Collect(points::geometry))) As polygon
from usclocations;

#2. Finds 4 nearest neighbors to MichelsonHall
SELECT id, st_astext(points)
FROM usclocations
WHERE id<>'MichelsonHall'
ORDER BY st_distance(points,'POINT(-118.289284 34.021957)'::geometry)
LIMIT 4;