-- MSSQL
SSMS --> SQL Server Management Studio
SQL -- Structure Query Language; Helps communicate with DB
DATABASE -- container which provide space to store the data

How to Create DB?

CREATE DATABASE MY_DB_ONLINE
USE MY_DB_ONLINE
GO -- EXECUTE THE BRANCH
------------------------
Click on 'View' -> 'Object Explorer' to check inside 'Database' folder if the DB exists.
Right Click on the DB to connect

--*******************
Different Types of Commands:
1) DDL Commands -- Data Defination Language
2) DQL Commands -- Data Query Language
3) DML Commands -- Data Manipulation Language
4) DCL Commands -- Data Control Language
--***********************
DDL:
a) CREATE -- Create wny new things on the DB
like TABLE --> structure to store the Data
b) ALTER -- Alter 
c) DROP

--------
Q) Create a Table like this:
EmployeeID, EmployeeName, Age
1, 'Sahli', 20
2, 'Himanshu', 25
--
CREATE TABLE EmployeeInfo(
    EmployeeID INT,
    EmployeeName VARCHAR(50),
    Age INT
)

INSERT INTO EmployeeInfo(EmployeeID, EmployeeName, Age)
VALUES
    (1, 'Sahli', 20),
    (2, 'Himanshu', 25);

SELECT * FROM EmployeeInfo
SELECT Age FROM EmployeeInfo -- for a single column 

Q)Write a query to create a table with the following structure:
StudentID 
Name
Address1
City
--
CREATE TABLE StudentInfo(
    StudentID INT,
    Name VARCHAR(50),
    Address1 VARCHAR(100),
    City VARCHAR(50)
) 
SELECT * from StudentInfo
SELECT City, Name FROM StudentInfo
--*****---
ALTER --> this command is used to modify the existing structure
Q) Write a query to add a new column RollNo in the StudentInfo Table?
--
ALTER TABLE StudentInfo ADD RollNo INT

Q) Write a query to change a Roll no DataType to VARCHAR(20)? 
--
ALTER TABLE StudentInfo ALTER COLUMN RollNo VARCHAR(20)

Q) Write a query to drop a column from Table.
--
ALTER TABLE StudentInfo DROP COLUMN RollNo

Q)To Check all the Tables from the system?
--
SELECT * FROM sys.tables -- check all tables
--***-----------------
Q)Write a query to remove StudentInfo from our DB?
--
DROP TABLE StudentInfo
--**************---------------------
DML:
a)INSERT -- used to insert data
b)UPDATE  -- used to update existing data
c)DELETE  -- used to remove the data

SELECT * FROM EmployeeInfo

INSERT INTO EmployeeInfo(EmployeeID, EmployeeName,Age)
VALUES
    (3,'AMAN',33),
    (4,'Mathur',34);
We can do this also:
INSERT INTO EmployeeInfo(EmployeeID, Age)
VALUES
    (5,40),
    (6,44);

Q)Write a query to display a data from EmployeeID 1?
--
WHERE ---> used to apply a filter 
SELECT * FROM EmployeeInfo WHERE EmployeeID=1

--***************-- 
Q)Write a query to update age with 40 VALUE?
--
UPDATE EmployeeInfo SET Age = 40 
Q) Write a query to update firstname 'Tushar', Age 50 for EmployeeID 2?
--
UPDATE EmployeeInfo SET EmployeeName = 'Tushar', AGe =50 WHERE EmployeeID=2

--************--------
Q) Write a query to remove the data for EmployeeID = 1?
--
DELETE FROM EmployeeInfo WHERE EmployeeID = 1
DELETE FROM EmployeeInfo --> this will remove all the data from the table but keeps the column name 
----***********************************------------------
DATA TYPE:
 i)NUMERIC:
    a)TINYINT ---> 0 to 255
    b)SMALLINT --> -32768 to 32767 
    c)INTEGER --> -2147483648 to 2147483648 
    d)BIGINT --> -922372036854775808 to 22372036854775808 
    e)DECIMAL --> -10^38 + 1 tp 10^38 +1
checks:
CREATE TABLE TINYINT_test(
    ID TINYINT
)
INSERT INTO TINYINT_test(ID)
VALUES  (25),
        --(256), --> error
        --(-2), --> error 
        (4);
SELECT * FROM TINYINT_test

Q)Create a new table named employee with the following columns:
emp_id -> INTEGER
emp_name -> VARCHAR(50)
department -> VARCHAR(50)
salary -> INTEGER
and insert the following records into the employee table
emp_id emp_name department salary
101 John IT 60000
102 Sara HR 45000
103 Mike Finance 70000
Then write a query to update the salary of the Employee Sara to 50000. 
Write a query to delete the employee record whose emp_id is 103. 
?
--
CREATE TABLE Employees(
emp_id INTEGER,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INTEGER
)

INSERT INTO Employees
VALUES 
    (101, 'John', 'IT', 60000),
    (102, 'Sara', 'HR', 45000),
    (103, 'Mike', 'Finance', 70000);

SELECT * FROM Employees

UPDATE Employees SET salary=50000 WHERE emp_name='Sara'

DELETE FROM Employees WHERE emp_id = 103

DECIMAL DATA TYPE:
--syntex (p,s) : p = total length; s = numbers after decimal
--say for 10.34 --> p = 4, s = 2
DECIMAL(5,2) --> p =5, s=2 ==> Before decimal = 5-2 = 3
CREATE TABLE Decimal_test (
    Price DECIMAL(5,2)
)
INSERT INTO Decimal_test VALUES (1.1)
INSERT INTO Decimal_test VALUES (-123.45)
INSERT INTO Decimal_test VALUES (.45)
INSERT INTO Decimal_test VALUES (-1234.56) --> error
INSERT INTO Decimal_test VALUES (-123.5678) --> rounding off upto s value
SELECT * FROM Decimal_test
DROP TABLE Decimal_test
----************-----------------------
ii) STRING VARIABLE:
    a) CHAR() --> Fixed length Max can be 8000
    b) VARCHAR()  --> Var length , Max = 8000  
        VARCHAR(MAX) --> for max length upto 2GB data
CREATE TABLE CHAR_test(
    FirstName CHAR(10)
)
INSERT INTO CHAR_test VALUES('Sahil') --> 5 spaces will be add to make the length ==10
INSERT INTO CHAR_test VALUES('Sahilooooo') --> upto 10 in length ; so no spaces here
INSERT INTO CHAR_test VALUES('Sahil     ') --> This is same as the first one. 
INSERT INTO CHAR_test VALUES('ABCDEFGHIJK') --> error 

SELECT * FROM CHAR_test     

VARCHAR will solve the issue of spaces 

CREATE TABLE VARCHAR_test(
    FirstName VARCHAR(10) 
)
INSERT INTO VARCHAR_test VALUES('Sahil') --> No spaces here

SELECT * FROM VARCHAR_test