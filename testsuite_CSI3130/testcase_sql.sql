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
ON t1.id = t2.id;

SELECT table1.id, table1.name, table2.id, table2.name
FROM table1 
JOIN table2 
ON t1.name = t2.name;


