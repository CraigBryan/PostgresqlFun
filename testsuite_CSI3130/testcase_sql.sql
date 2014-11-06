CREATE DATABASE testJoinDB;

CREATE TABLE table1 
(
id int,
name varchar(255),
);

CREATE TABLE table2
(
id int,
name varchar(255),
);

SELECT table1.id, table1.name, table2.id, table2.name
FROM table1 
JOIN table2 
ON table1.id = table2.id;

SELECT table1.id, table1.name, table2.id, table2.name
FROM table1 
JOIN table2 
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
startDate date, 
dateOfBirth date, 
country varchar(255)
);

SELECT table3.id, table3.name, table3.startDate, table3.dateOfBirth, table3.country
FROM table3
JOIN table4 
ON t1.name = t2.name;
