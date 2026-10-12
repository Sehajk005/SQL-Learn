/*
Partition By
*/

--SELECT FirstName, LastName, Gender, Salary, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
--FROM EmployeeDemographics AS dem
--JOIN EmployeeSalary AS sal
--	ON dem.EmployeeID = sal.EmployeeID

/*
CTE's
*/

--WITH CTE_Employee AS
--(SELECT FirstName, LastName, Gender, Salary
--, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
--, AVG(Salary) OVER (PARTITION BY Gender) AS AvgSalary
--FROM EmployeeDemographics AS dem
--JOIN EmployeeSalary AS sal
--	ON dem.EmployeeID = sal.EmployeeID
--WHERE Salary > 70000
--)
--SELECT *
--FROM CTE_Employee

/*
Temp Tables
*/

--CREATE TABLE #temp_Employees(
--EmployeeId int,
--JobTitle varchar(100),
--Salary int)

--SELECT *
--FROM #temp_Employees

--INSERT INTO #temp_Employees
--SELECT *
--FROM EmployeeSalary


---- DELETE THE TABLE IF EXISTE 
--DROP TABLE IF EXISTS #Temp_Employees2
--CREATE TABLE #Temp_Employees2(
--JobTitle varchar(100),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int)

--INSERT INTO #Temp_Employees2
--SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
--FROM EmployeeDemographics AS dem
--JOIN EmployeeSalary AS sal
--	ON dem.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT * 
--FROM #Temp_Employees2

/*
String Functions - TRIM, LTRIM, RTRIM, Replace, Substring, UPPER, LOWER
*/
--CREATE TABLE EmployeeErrors(
--EmployeeId varchar(50),
--FirstName varchar(50),
--LastName varchar(50))

--INSERT INTO EmployeeErrors VALUES 
--('1001  ', 'Jimbo', 'Halbert'),
--('  1002', 'Pamela', 'Beasely'),
--('1003', 'TOby', 'Flendreson - Fired')


--SELECT *
--FROM EmployeeErrors

-- TRIM, LTRIM, RTRIM

--SELECT EmployeeId, TRIM(EmployeeId) AS TrimId
--FROM EmployeeErrors

--SELECT EmployeeId, LTRIM(EmployeeId) AS TrimId
--FROM EmployeeErrors

--SELECT EmployeeId, RTRIM(EmployeeId) AS TrimId
--FROM EmployeeErrors

-- replace
--SELECT LastName, REPLACE(LastName, ' - Fired', '') AS LastNameFixed
--FROM EmployeeErrors

-- Substrings
--SELECT LastName, SUBSTRING(LastName,1,3) as sub
--FROM EmployeeErrors

-- UPPER/LOWER

--SELECT FirstName, LOWER(firstName) As LowerFirstName
--FROM EmployeeErrors

--SELECT FirstName, UPPER(firstName) As UpperFirstName
--FROM EmployeeErrors


/*
Stored Procedure
*/
--GO
--CREATE PROCEDURE TEST
--AS 
--SELECT *
--FROM EmployeeDemographics

--EXEC TEST

--CREATE PROCEDURE Temp_Employees
--AS
--DROP TABLE IF EXISTS #Temp_Employees
--CREATE TABLE #Temp_Employees(
--JobTitle varchar(100),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int)

--INSERT INTO #Temp_Employees
--SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
--FROM EmployeeDemographics AS dem
--JOIN EmployeeSalary AS sal
--	ON dem.EmployeeID = sal.EmployeeID
--GROUP BY JobTitle

--SELECT *
--FROM #Temp_Employees

/*
Subqueries (in SELECT, FROM and WHERE Starements)
*/

-- Subquerie in SELECT

--SELECT JobTitle, Salary, (SELECT AVG(Salary) FROM EmployeeSalary) AS AllAvgSalary
--FROM EmployeeSalary

-- How to do it with partiation by
--SELECT JobTitle, Salary, AVG(Salary) OVER () AS AllAvgSalary
--FROM EmployeeSalary

-- Subquerie in FROM

--SELECT *
--FROM (SELECT JobTitle, Salary, AVG(Salary) OVER () AS AllAvgSalary
--	  FROM EmployeeSalary) A

-- Subquerie in WHERE

--SELECT EmployeeID, JobTitle, Salary
--FROM EmployeeSalary
--WHERE EmployeeID IN(
--		SELECT EmployeeID
--		FROM EmployeeDemographics
--		WHERE AGE > 26)