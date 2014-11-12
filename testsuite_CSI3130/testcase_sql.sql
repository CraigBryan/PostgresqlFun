CREATE DATABASE testJoinDB;

CREATE TABLE table1 
(
	id int,
	name varchar(255)
);

CREATE TABLE table2
(
	id int,
	name varchar(255)
);

INSERT INTO table1 VALUES (1, 'Kat');
INSERT INTO table1 VALUES (2, 'Craig');
INSERT INTO table1 VALUES (3, 'Bryan');
INSERT INTO table1 VALUES (4, 'Crawford');
INSERT INTO table1 VALUES (5, 'Julie');
INSERT INTO table1 VALUES (6, 'Marc');
INSERT INTO table1 VALUES (7, 'Selena');
INSERT INTO table1 VALUES (8, 'Tom');
INSERT INTO table1 VALUES (9, 'Ben');
INSERT INTO table1 VALUES (10, 'Tom');

INSERT INTO table2 VALUES (1, 'Kat');
INSERT INTO table2 VALUES (2, 'Craig');
INSERT INTO table2 VALUES (3, 'Bryan');
INSERT INTO table2 VALUES (4, 'Crawford');
INSERT INTO table2 VALUES (5, 'Julie');
INSERT INTO table2 VALUES (6, 'Marc');
INSERT INTO table2 VALUES (7, 'Marc');
INSERT INTO table2 VALUES (8, 'Tom');
INSERT INTO table2 VALUES (9, 'Ben');
INSERT INTO table2 VALUES (10, 'Tom');

CREATE TABLE results1 AS
SELECT table1.id, table1.name
FROM table1 
INNER JOIN table2 
ON table1.id = table2.id;

CREATE TABLE results2 AS
SELECT table1.id, table1.name
FROM table1 
INNER JOIN table2 
ON table1.name = table2.name;

CREATE TABLE table3
(
	id int, 
	name varchar(255), 
	startDate date, 
	dateOfBirth date, 
	country varchar(255)
);

CREATE TABLE table4
(
	id int, 
	name varchar(255), 
	country varchar(255)
);

CREATE TABLE table5
(
	id int,
	endDate date,
	dateOfBirth date
);

INSERT INTO table3 VALUES (1, 'Kat','2014-09-09', '1992-02-28', 'Canada');
INSERT INTO table3 VALUES (2, 'John','2014-09-21', '1932-08-01', 'Canada');
INSERT INTO table3 VALUES (3, 'Craig','2014-01-20', '1952-03-21', 'USA');
INSERT INTO table3 VALUES (4, 'Bryan','2014-03-01', '1922-06-31', 'India');
INSERT INTO table3 VALUES (5, 'Crawford','2012-06-19', '1912-08-02', 'Canada');
INSERT INTO table3 VALUES (6, 'Kat','2014-09-19', '1996-07-03', 'Canada');
INSERT INTO table3 VALUES (7, 'Craig','2014-02-21', '2000-02-06', 'USA');
INSERT INTO table3 VALUES (8, 'Bryan','2014-05-30', '1992-02-03', 'USA');
INSERT INTO table3 VALUES (9, 'Crawford','2012-09-12', '1982-08-08', 'France');
INSERT INTO table3 VALUES (10, 'Crawford','2004-09-01', '1932-08-18', 'India');

INSERT INTO table4 VALUES (1, 'Kat', 'Canada');
INSERT INTO table4 VALUES (2, 'John','Canada');
INSERT INTO table4 VALUES (3, 'Craig', 'USA');
INSERT INTO table4 VALUES (4, 'Bryan','India');
INSERT INTO table4 VALUES (5, 'Crawford','Canada');
INSERT INTO table4 VALUES (6, 'Kat', 'Canada');
INSERT INTO table4 VALUES (7, 'Craig','USA');
INSERT INTO table4 VALUES (8, 'Bryan','USA');
INSERT INTO table4 VALUES (9, 'Crawford', 'France');
INSERT INTO table4 VALUES (10, 'Crawford', 'India');

INSERT INTO table5 VALUES (1,'2014-09-09', '1992-11-28');
INSERT INTO table5 VALUES (2, '2014-09-21', '1932-09-01');
INSERT INTO table5 VALUES (3, '2014-01-20', '1952-09-21');
INSERT INTO table5 VALUES (4, '2014-03-01', '1922-04-31');
INSERT INTO table5 VALUES (5, '2012-06-19', '1912-02-02');
INSERT INTO table5 VALUES (6, '2014-09-19', '1996-05-03');
INSERT INTO table5 VALUES (7, '2014-02-21', '2000-01-06');
INSERT INTO table5 VALUES (8, '2014-05-30', '1992-02-03');
INSERT INTO table5 VALUES (9, '2012-09-12', '1982-06-08');
INSERT INTO table5 VALUES (10, '2004-09-01', '1932-12-18');

CREATE TABLE results3 AS 
SELECT table3.id, table3.name, table3.startDate, table3.dateOfBirth, table3.country
FROM table3
INNER JOIN table4 
ON table3.id = table4.id AND table3.country = table4.country;

CREATE TABLE results4 AS 
SELECT table3.id, table3.name, table3.startDate, table3.dateOfBirth, table3.country
FROM table3
INNER JOIN table4 
ON table3.country = table4.country;

CREATE TABLE results5 AS 
SELECT table3.id, table3.startDate, table3.dateOfBirth, table5.endDate
FROM table3
INNER JOIN table5
ON table3.id = table5.id AND table3.dateOfBirth = table3.dateOfBirth AND table3.startDate = table5.endDate;

CREATE TABLE results6 AS 
SELECT table3.id, table3.startDate, table3.dateOfBirth, table5.endDate
FROM table3
INNER JOIN table5
ON table3.dateOfBirth = table3.dateOfBirth OR table3.startDate = table5.endDate;

CREATE TABLE results7 AS 
SELECT table3.id, table3.startDate, table3.dateOfBirth, table3.country, table5.endDate
FROM table3
INNER JOIN table5
ON table3.dateOfBirth > table5.dateOfBirth AND table3.startDate < table5.endDate;