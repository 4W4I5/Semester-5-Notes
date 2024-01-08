-- ==================================== CHTSHEET ====================================  


-- CREATING AND DISPLAYING DATABASES
-- To create a database:
CREATE DATABASE Zoo;
-- To list all databases on a server:
SELECT *
FROM sys.databases;
-- To use a specified database:
USE Zoo;
-- To delete a specified database:
DROP DATABASE Zoo;
-- To create a schema:
CREATE SCHEMA AnimalSchema;


-- DISPLAYING TABLES
-- To list all tables in a database:
SELECT *
FROM sys.tables;
-- To get information about a specified table:
exec sp_help 'Animal'
-- CREATING TABLES
To create a table:
CREATE TABLE Habitat (
Id INT,
Name VARCHAR(64)
);
-- Use IDENTITY to increment the ID automatically with each new record.
CREATE TABLE Habitat (
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(64)
);
-- To create a table with a foreign key:
CREATE TABLE Animal (
Id INT PRIMARY KEY IDENTITY,
Name VARCHAR(64),
Species VARCHAR(64),
Age INT,
HabitatId INT,
FOREIGN KEY (HabitatId)
REFERENCES Habitat(Id)
);


-- MODIFYING TABLES
-- Use the ALTER TABLE or the EXEC statement to modify a table structure.
-- To change a table name:
EXEC sp_rename 'AnimalSchema.Animal', 'Pet'
-- To add a column to a table:
ALTER TABLE Animal
ADD COLUMN Name VARCHAR(64);
-- To change a column name:
EXEC sp_rename 'AnimalSchema.Animal.Id',
'Identifier', 'COLUMN';
-- To change a column data type:
ALTER TABLE Animal
ALTER COLUMN Name VARCHAR(128);
-- To delete a column:
ALTER TABLE Animal
DROP COLUMN Name;
-- To delete a table:
DROP TABLE Animal;


-- QUERYING DATA
-- To select data from a table, use the SELECT command.
-- An example of a single-table query:
SELECT Species, AVG(Age) AS AverageAge
FROM Animal
WHERE Id != 3
GROUP BY Species
HAVING AVG(Age) > 3
ORDER BY AVG(Age) DESC;
-- An example of a multiple-table query:
SELECT City.Name, Country.Name
FROM City
[INNER | LEFT | RIGHT | FULL] JOIN Country
ON City.CountryId = Country.Id;
-- AGGREGATION AND GROUPING
-- AVG(expr) − average value of expr for the group.
-- COUNT(expr) − count of expr values within the group.
-- MAX(expr) − maximum value of expr values within the
-- group.
-- MIN(expr) − minimum value of expr values within the
-- group.
-- SUM(expr) − sum of expr values within the group.

-- To count the rows in the table:
SELECT COUNT(*)
FROM Animal;

-- To count the non-NULL values in a column:
SELECT COUNT(Name)
FROM Animal;

-- To count unique values in a column:
SELECT COUNT(DISTINCT Name)
FROM Animal;
GROUP BY

-- To count the animals by species:
SELECT Species, COUNT(Id)
FROM Animal
GROUP BY Species;

-- To get the average, minimum, and maximum ages by habitat:
SELECT HabitatId, AVG(Age),
MIN(Age), MAX(Age)
FROM Animal
GROUP BY HabitatId;

-- INSERTING DATA
-- To insert data into a table, use the INSERT command:
INSERT INTO Habitat VALUES
(1, 'River'),
(2, 'Forest');
-- You may specify the columns in which the data is added. The
-- remaining columns are filled with default values or NULLs.

INSERT INTO Habitat (Name) VALUES
('Savanna');

-- UPDATING DATA
-- To update the data in a table, use the UPDATE command:
UPDATE Animal
SET
Species = 'Duck',
Name = 'Quack'
WHERE Id = 2;


-- DELETING DATA
-- To delete data from a table, use the DELETE command:
DELETE FROM Animal
WHERE Id = 1;

-- This deletes all rows satisfying the WHERE condition.
-- To delete all data from a table, use the TRUNCATE TABLE
-- statement:
TRUNCATE TABLE Animal;
SQL SERVER CONVENTIONS

-- In SQL Server, use square brackets to handle table or column
-- names that contain spaces, special characters, or reserved
-- keywords. For example:
SELECT
[First Name],
[Age]
FROM [Customers];
-- Often, you refer to a table by its full name that consists of the
-- schema name and the table name (for example,
-- AnimalSchema.Habitat, sys.databases). For simplicity,
-- we use plain table names in this cheat sheet.


-- THE GO SEPARATOR
-- In SQL Server, GO is a batch separator used to execute multiple
-- SQL statements together. It is typically used in SQL Server
-- Management Studio and similar tools.



-- TEXT FUNCTIONS
-- Character strings are enclosed in single quotes:
SELECT 'Michael';

-- Unicode strings are enclosed in single quotes and prefixed with capital N:
SELECT N'Michél';

-- CONCATENATION
-- Use the CONCAT() function to concatenate two strings:
SELECT CONCAT(N'Hi ', N'there!');
-- result: Hi there!

-- CONCAT() treats NULL as an empty string:
SELECT CONCAT(N'Learn ', NULL, N'SQL.com');
-- result: LearnSQL.com

-- SQL Server allows specifying a separating character (separator)
-- using the CONCAT_WS() function. The separator is placed
-- between the concatenated values:
SELECT CONCAT_WS(' ', 1, N'Olivier',N'Norris');
 -- result: 1 Olivier Norris


-- FILTERING THE OUTPUT
-- To fetch the city names that are not Berlin:
SELECT Name
FROM City
WHERE Name != N'Berlin';


-- TEXT OPERATORS
-- To fetch the city names that start with a 'P' or end with an 's':
SELECT Name
FROM City
WHERE Name LIKE N'P%' OR Name LIKE N'%s';


-- To fetch the city names that start with any letter followed by
-- 'ublin' (like Dublin in Ireland or Lublin in Poland):
SELECT Name
FROM City
WHERE Name LIKE N'_ublin';


-- OTHER USEFUL TEXT FUNCTIONS
-- To get the count of characters in a string:
SELECT LEN(N'LearnSQL.com'); -- result: 12

-- To convert all letters to lowercase:
SELECT LOWER(N'LEARNSQL.COM');
-- result: learnsql.com

-- To convert all letters to uppercase:
SELECT UPPER(N'LearnSQL.com');
-- result: LEARNSQL.COM

-- To get just a part of a string:
SELECT SUBSTRING(N'LearnSQL.com', 1, 5);
-- result: Learn

-- To replace a part of a string:
SELECT REPLACE(N'LearnSQL.com', 'SQL','Python');
-- result: LearnPython.com

-- NUMERIC FUNCTIONS
-- Use +, -, *, / to do some basic math.
-- To get the number of seconds in a week:
SELECT 60 * 60 * 24 * 7; -- result: 604800

-- In SQL Server, the division operator / performs an integer division
-- on integer arguments. For example:
SELECT 25 / 4; -- result 6

-- To avoid the integer division, make sure at least one of the
-- arguments is not an integer:
SELECT CAST(25 AS DECIMAL) / 4;

-- result 6.25
SELECT 25.0 / 4;

-- result 6.25
-- To get the remainder of a division:
SELECT MOD(13, 2); -- result: 1

-- To round a number to three decimal places:
SELECT ROUND(1234.56789, 3);
-- result: 1234.568

-- To round a number up:
SELECT CEILING(13.1), CEILING(-13.9);
-- result: 14, -13

-- To round a number down:
SELECT FLOOR(13.8), FLOOR(-13.2);
-- result: 13, -14

-- USEFUL NULL FUNCTIONS
-- To fetch the names of the cities whose rating values are not missing:
SELECT Name
FROM City
WHERE Rating IS NOT NULL;

-- COALESCE(x, y, ...)
-- To replace NULL in a query with something meaningful:
SELECT Domain,
COALESCE(Domain, 'domain missing')
FROM Contacts;

-- The COALESCE() function takes any number of arguments and
-- returns the value of the first argument that is not NULL.
NULLIF(x, y)

-- To save yourself from division-by-0 errors:
SELECT LastMonth, ThisMonth,
ThisMonth * 100.0 / NULLIF(LastMonth, 0)
AS BetterByPercent
FROM VideoViews;

-- The NULLIF(x, y) function returns NULL if x equals y, else it
-- returns the value of x value.
-- DATE AND TIME
-- There are 6 main time-related types in MySQL:
-- DATE – stores the year, month, and day in the YYYY-MM-DD
-- format.
The supported range is '0001-01-01' to '9999-12-31'.
TIME – stores the hours, minutes, seconds, and nanoseconds in
the HH:MM:SS[.nnnnnnn] format.
The supported range is '00:00:00.0000000' to
'23:59:59.9999999'.
SMALLDATETIME – stores the date and time in the YYYY-MMDD HH:MM:SS format.
The supported range is '1900-01-01' to '2079-06-06'.
DATETIME – stores the date and time in the YYYY-MM-DD
HH:MM:SS[.nnn] format.
The supported range is '1753-01-01' to '9999-12-31'.
DATETIME2 – stores the date and time in the YYYY-MM-DD
HH:MM:SS[.nnnnnnn] format.
The supported range is '0001-01-01 00:00:00.0000000'
to '9999-12-31 23:59:59.9999999'.
DATETIMEOFFSET – stores the date and time in the YYYY-MMDD HH:MM:SS[.nnnnnnn][+|-]hh:mm format.
The supported range is '0001-01-01 00:00:00.0000000'
to '9999-12-31 23:59:59.9999999' in UTC.
WHAT TIME IS IT?
To get the current datetime without the time-zone offset:
SELECT GETDATE(); -- result: 2023-07-27
07:21:13.937
To get the current datetime without the time-zone offset in
DATETIME2 data type (higher fractional seconds precision):
SELECT SYSDATETIME(); -- result: 2023-07-27
07:21:13.9398213
To get the current datetime in UTC:
SELECT GETUTCDATE(); -- result: 2023-07-27
07:21:13.937
or in datetime2 data type (higher fractional seconds precision):
SELECT SYSUTCDATETIME(); -- result: 2023-07-
27 07:21:13.9398213
To get the current datetime with the time-zone offset:
SELECT SYSDATETIMEOFFSET();
-- result: 2023-07-27 07:21:13.9398213 +00:00


-- CREATING VALUES
-- To create a date, time, or datetime, write the value as a string and
-- cast it to the proper type.
SELECT CAST('2021-12-31' AS date),
CAST('2021-12-31 23:59:29' AS DATETIME2);

-- DATE ARITHMETICS
-- To add or subtract from a DATE, use the DATEADD() function:
DATEADD(day, -3, '2014-04-05');
-- result: '2014-04-02'

-- To find the difference between two dates, use the DATEDIFF()
-- function:
SELECT DATEDIFF(year, '2019-05-15',
'2017-05-15');
-- result: -2
SELECT DATEDIFF(month, '2019-06-15',
'2023-12-15');
-- result: 54

-- The supported date parts are: year, quarter, month,
-- dayofyear, day, week, hour, minute, second,
-- millisecond, microsecond, nanosecond.
-- EXTRACTING PARTS OF DATES
-- To extract a part of a date, use the functions YEAR(), MONTH(),
-- or DAY():
SELECT YEAR(CAST('2021-12-31' AS date));
-- result: 2021
SELECT MONTH(CAST('2021-12-31' AS date));
-- result: 12
SELECT DAY(CAST('2021-12-31' AS date));
-- result: 31

-- You may also use the DATEPART() function:
SELECT DATEPART(year, '2013-09-15');
-- result: 2013
-- Supported date parts are: year, quarter, month,
-- dayofyear, day, week, weekday, hour, minute, second,
-- millisecond, microsecond, nanosecond, tzoffset,
-- iso_week.
-- CHANGING THE TIME ZONE
-- Use AT TIME ZONE to convert a date and time value into a
-- target time zone. You may use meaningful time zone names such
-- as 'Pacific Standard Time'. SQL Server uses the names
-- stored in the Windows Registry.
-- To add the target time-zone offset to a datetime value without
-- offset information:
SELECT start_time AT TIME ZONE 'UTC';


-- To convert values between different time zones:
SELECT '2023-07-20 12:30:00'
AT TIME ZONE 'UTC'
AT TIME ZONE 'Eastern Standard Time';
-- result: 2023-07-20 08:30:00

-- Specify the known time-zone offset first (here, UTC) and then the
-- time zone to which you want to convert.




-- ==================================== Task 3 ====================================  
CREATE DATABASE testdb1;
use testdb1;

CREATE TABLE EMP
(
	EMPNO NUMERIC(4) NOT NULL,
	ENAME VARCHAR(10),
	JOB VARCHAR(9),
	MGR NUMERIC(4),
	HIREDATE DATE,
	SAL NUMERIC(7,2),
	COMM NUMERIC(7,2),
	DEPTNO NUMERIC(2)
);

INSERT INTO EMP
VALUES
	(1001, 'Awais', 'Manager', NULL, '2023-09-13', 5000.00, NULL, 10);

INSERT INTO EMP
VALUES
	(1002, 'Laiba', 'Analyst', 1001, '2023-09-14', 3500.50, NULL, 20);

INSERT INTO EMP
VALUES
	(1003, 'Abdullah', 'Clerk', 1002, '2023-09-15', 2200.75, NULL, 20);

INSERT INTO EMP
VALUES
	(1004, 'Qasim', 'Analyst', 1001, '2023-09-16', 3600.25, 250.00, 30);

INSERT INTO EMP
VALUES
	(1005, 'Nawfal', 'Salesman', 1004, '2023-09-17', 3000.00, 100.00, 30);

INSERT INTO EMP
VALUES
	(1006, 'RandomPerson', 'Clerk', 1002, '2023-09-18', 2300.50, NULL, 10);


-- DB CREATED, Command displays the entire table
SELECT *
FROM EMP

-- Task1: list all empName, jobs and salaries then increment by 300
SELECT ENAME, SAL + 300 AS "New Salary"
FROM EMP;

-- Task2: List all emp who have not been given any commision
SELECT ENAME, JOB, SAL
FROM EMP
WHERE COMM IS NULL;

-- Task3: List all the job titles one time
SELECT DISTINCT JOB
FROM EMP;

-- Task4: List all the employee identity numbers, names, jobs, and salaries are greater than 1500, and job title has MAN keywords.
SELECT EMPNO, ENAME, JOB, SAL
FROM EMP
WHERE SAL > 1500 AND JOB LIKE '%MAN%';


-- Task5: List all the employee names and jobs who are not CLERK, ANALYST, and SALESMAN.
SELECT ENAME, JOB
FROM EMP
WHERE JOB NOT IN ('CLERK', 'ANALYST', 'SALESMAN');


-- Task6: List all the employee’s information by their hiring dates.
SELECT *
FROM EMP
ORDER BY HIREDATE;

-- ==================================== Task 4 ====================================  

CREATE DATABASE task4;
USE task4;

CREATE TABLE Distributor (
    DISTRIBUTOR_ID INT PRIMARY KEY NOT NULL IDENTITY(1,1),
    DISTRIBUTOR_NAME VARCHAR(255) NOT NULL,
    DISTRIBUTOR_ADDRESS VARCHAR(255) NOT NULL,
    DISTRIBUTOR_PHONENUMBER VARCHAR(20) NOT NULL
);
select * from Distributor;
CREATE TABLE Store (
    STORE_ID INT PRIMARY KEY IDENTITY(1,1),
    DISTRIBUTOR_ID INT,
    STORE_NAME VARCHAR(255) NOT NULL,
    STORE_ADDRESS VARCHAR(255) NOT NULL,
    STORE_PHONENUMBER VARCHAR(20) NOT NULL,
    FOREIGN KEY (DISTRIBUTOR_ID) REFERENCES Distributor(DISTRIBUTOR_ID)
);

CREATE TABLE Employee (
    EMPLOYEE_ID INT PRIMARY KEY IDENTITY(1,1),
    STORE_ID INT,
    EMPLOYEE_NAME VARCHAR(255) NOT NULL,
    SUPERVISOR_ID INT,
    EMPLOYEE_ADDRESS VARCHAR(255) NOT NULL,
    EMPLOYEE_PHONENUMBER VARCHAR(20),
    EMPLOYE_SIN VARCHAR(15) NOT NULL,
    EMPLOYEE_HIREDATE DATE,
    FOREIGN KEY (STORE_ID) REFERENCES Store(STORE_ID),
	FOREIGN KEY (SUPERVISOR_ID) REFERENCES Employee(EMPLOYEE_ID)
);

CREATE TABLE Customer (
    CUSTOMER_ID INT PRIMARY KEY IDENTITY(1,1),
    CUSTOMER_NAME VARCHAR(255) NOT NULL,
    CUSTOMER_ADDRESS VARCHAR(255) NOT NULL,
    CUSTOMER_PHONENUMBER VARCHAR(20)
);

CREATE TABLE Movie (
    MOVIE_ID INT PRIMARY KEY IDENTITY(1,1),
    MOVIE_TITLE VARCHAR(255) NOT NULL,
    MOVIE_GENRE VARCHAR(255),
    MOVIE_RELEASEYEAR DATE,
    MOVIE_COPIESAVAILABLE INT,
    RENTAL_FEE DECIMAL(8, 2),
    RENTAL_TYPE VARCHAR(10) CHECK (RENTAL_TYPE IN ('Cash', 'Card'))
);

CREATE TABLE Rental (
    RENTAL_ID INT PRIMARY KEY IDENTITY(1,1),
    EMPLOYEE_ID INT,
    CUSTOMER_ID INT,
    MOVIE_ID INT,
    PAYMENT_AMOUNT DECIMAL(8, 2) NOT NULL,
    PAYMENT_TYPE VARCHAR(255) NOT NULL,
    RENTAL_DATE DATE NOT NULL,
    FOREIGN KEY (EMPLOYEE_ID) REFERENCES Employee(EMPLOYEE_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES Customer(CUSTOMER_ID),
    FOREIGN KEY (MOVIE_ID) REFERENCES Movie(MOVIE_ID)
);

INSERT INTO Distributor (DISTRIBUTOR_NAME, DISTRIBUTOR_ADDRESS, DISTRIBUTOR_PHONENUMBER) 
VALUES 
    ('ABC Distributors', '123 Main Street, City', '123-456-7890'),
    ('XYZ Suppliers', '456 Elm Street, City', '987-654-3210'),
    ('Quick Distributors', '789 Oak Street, City', '555-123-4567');

INSERT INTO Store (DISTRIBUTOR_ID, STORE_NAME, STORE_ADDRESS, STORE_PHONENUMBER) 
VALUES 
    (1, 'Store A', '456 First Avenue, City', '111-222-3333'),
    (2, 'Store B', '789 Second Street, City', '444-555-6666'),
    (3, 'Store C', '123 Third Road, City', '777-888-9999');

INSERT INTO Employee (STORE_ID, EMPLOYEE_NAME, SUPERVISOR_ID, EMPLOYEE_ADDRESS, EMPLOYEE_PHONENUMBER, EMPLOYE_SIN, EMPLOYEE_HIREDATE) 
VALUES 
    (1, 'John Doe', NULL, '789 Elm Avenue, City', '555-111-2222', '123456789', '2022-01-15'),
    (2, 'Jane Smith', 1, '456 Oak Street, City', '555-222-3333', '987654321', '2022-03-10'),
    (3, 'Bob Johnson', 1, '123 Maple Road, City', '555-333-4444', '654321987', '2022-02-20');

INSERT INTO Customer (CUSTOMER_NAME, CUSTOMER_ADDRESS, CUSTOMER_PHONENUMBER) 
VALUES 
    ('Alice Brown', '789 Pine Lane, City', '111-555-7777'),
    ('Bob Green', '456 Cedar Street, City', '222-666-8888'),
    ('Charlie Davis', '123 Red Road, City', '333-777-9999');

INSERT INTO Movie (MOVIE_TITLE, MOVIE_GENRE, MOVIE_RELEASEYEAR, MOVIE_COPIESAVAILABLE, RENTAL_FEE, RENTAL_TYPE) 
VALUES 
    ('Movie A', 'Action', '2020-01-01', 10, 5.99, 'Cash'),
    ('Movie B', 'Comedy', '2019-05-15', 8, 4.99, 'Card'),
    ('Movie C', 'Drama', '2021-11-30', 12, 6.99, 'Cash');

INSERT INTO Rental (PAYMENT_AMOUNT, PAYMENT_TYPE, RENTAL_DATE) 
VALUES 
    ( 10.99, 'Credit Card', '2023-09-20'),
    ( 8.99, 'Cash', '2023-09-21'),
    ( 12.49, 'Debit Card', '2023-09-22');
SELECT * FROM Distributor;
SELECT * FROM Store;
SELECT * FROM Employee;
SELECT * FROM Customer;
SELECT * FROM Movie;
SELECT * FROM Rental;

drop database task4

-- ==================================== Task 6 ====================================  


CREATE DATABASE testdb1;
use testdb1;

CREATE TABLE DEPT
(
	DEPTNO NUMERIC(2) NOT NULL PRIMARY KEY IDENTITY(0,10),
	DNAME VARCHAR(50),
	LOC VARCHAR(50)
);
CREATE TABLE EMP
(
	EMPNO NUMERIC(4) NOT NULL PRIMARY KEY IDENTITY(10,1),
	ENAME VARCHAR(10),
	JOB VARCHAR(25),
	MGR NUMERIC(4),
	HIREDATE DATE,
	SAL NUMERIC(7,2),
	COMM NUMERIC(7,2),
	FK_DEPTID NUMERIC(2) FOREIGN KEY (FK_DEPTID) REFERENCES DEPT(DEPTNO)

);



INSERT INTO DEPT
VALUES
	('Accounting Dept', 'A Block'),
	('Electrical Dept','B Block'),
	('Computing Dept','C Block'),
	('Research Dept','D Block')

INSERT INTO EMP
VALUES
	('Awais', 'Security', NULL, '2023-09-13', 5000, NULL, 30),
	('Laiba', 'Electrician', 1001, '2023-09-14', 1800, NULL, 10),
	('Abdullah', 'Clerk', 1002, '2023-09-15', 2200, NULL, 0),
	('Qasim', 'Analyst', 1001, '2023-09-16', 3600, 250.00, 00),
	('Nawfal', 'Manager', 1004, '2023-09-17', 1500, 100.00, 0),
	('Random', 'Manager', 1002, '2023-09-18', 1300, NULL, 20)

SELECT * FROM DEPT;
SELECT * FROM EMP;


-- Query to fetch records
SELECT LOWER(ENAME) AS ENAME
FROM EMP
WHERE SAL > 2000
AND FK_DEPTID = (SELECT DEPTNO FROM DEPT WHERE DNAME = 'Research Dept');


-- Creating a view with ENAME in lowercase
CREATE VIEW EmployeeView AS
SELECT LOWER(ENAME) AS ENAMElower, EMP.*
FROM EMP
INNER JOIN DEPT ON EMP.FK_DEPTID = DEPT.DeptNo
WHERE SAL > 2000 AND DEPT.DNAME = 'Research Dept';

select * from EmployeeView;

SELECT TOP 1 *
FROM EMP WHERE FK_DEPTID = 0
ORDER BY SAL DESC;

SELECT TOP 1 *
FROM EMP WHERE FK_DEPTID = 0
ORDER BY SAL ASC;



SELECT E.ENAME, E.SAL
FROM EMP AS E
WHERE E.SAL = (
    SELECT MAX(SAL)
    FROM EMP
    WHERE SAL < (
        SELECT MAX(SAL)
        FROM EMP
    )
);


 select concat(e.ENAME, ' is ' , e.JOB) AS INTRO
 FROM EMP e;

--


-- DELETE EVERYTHING
DROP TABLE EMP;
DROP TABLE DEPT;


-- ==================================== Task 8 ====================================  

CREATE DATABASE FACEBOOK;

USE FACEBOOK;

CREATE TABLE
	FB_USER (
		USER_UID NUMERIC(2) NOT NULL PRIMARY KEY IDENTITY (0, 1),
		USER_UNAME VARCHAR(255),
		USER_USERNAME NCHAR(255) NOT NULL,
		USER_DOB DATE,
	);

CREATE TABLE
	FB_POST (
		POST_ID NUMERIC(2) NOT NULL PRIMARY KEY IDENTITY (0, 1),
		POST_DESCRIPTION VARCHAR(255) NOT NULL,
		POST_DATE DATE,
		POST_USERID_FK NUMERIC(2) FOREIGN KEY (POST_USERID_FK) REFERENCES FB_USER (USER_UID),
	);

CREATE TABLE
	FB_COMMENT (
		COMMENT_ID NUMERIC(2) NOT NULL PRIMARY KEY IDENTITY (0, 1),
		COMMENT_DESCRIPTION VARCHAR(255) NOT NULL,
		COMMENT_DATE DATE,
		COMMENT_USERID_FK NUMERIC(2) FOREIGN KEY (COMMENT_USERID_FK) REFERENCES FB_USER (USER_UID),
		COMMENT_POSTID_FK NUMERIC(2) FOREIGN KEY (COMMENT_POSTID_FK) REFERENCES FB_POST (POST_ID),
	);

-- Insert queries for FB_USER table
INSERT INTO
	FB_USER (USER_UNAME, USER_USERNAME, USER_DOB)
VALUES
	('Awais Shahid', 'awaisshahid1', '1995-05-15'),
	('Laiba Shahid', 'laibslaib', '1990-08-21'),
	('Muhammad Qasim', 'paxcan', '1987-12-10'),
	('Abdullah Abudullah','abdullahbaker','2000-04-30'),
	('Maheen Mansha', 'snekysneks', '1992-07-03'),
	('Arsh Malik', 'arshbash', '1998-11-25');

-- Insert queries for FB_POST table
INSERT INTO
	FB_POST (POST_DESCRIPTION, POST_DATE, POST_USERID_FK)
VALUES
	('Post 1', '2023-10-16', 1),
	('Post 2', '2023-10-17', 2),
	('Post 3', '2023-10-17', 1),
	('Post 4', '2023-10-18', 3),
	('Post 5', '2023-10-18', 4),
	('Post 6', '2023-10-19', 5);

-- Insert queries for FB_COMMENT table
INSERT INTO
	FB_COMMENT (
		COMMENT_DESCRIPTION,
		COMMENT_DATE,
		COMMENT_USERID_FK,
		COMMENT_POSTID_FK
	)
VALUES
	('Nice post!', '2023-10-16', 2, 1),
	('Great content!', '2023-10-17', 1, 2),
	('Interesting.', '2023-10-17', 3, 1),
	('Well said!', '2023-10-18', 4, 3),
	('I agree!', '2023-10-18', 5, 2),
	('Nice one.', '2023-10-19', 3, 4);

SELECT 	* FROM FB_USER;
SELECT 	* FROM FB_POST;
SELECT	* FROM FB_COMMENT;

-- DELETE EVERYTHING
DROP TABLE FB_COMMENT;

DROP TABLE FB_POST;

DROP TABLE FB_USER;