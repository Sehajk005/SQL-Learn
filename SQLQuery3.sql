-- Update column name
--EXEC sp_rename 'EmployeeDemographics.Genger', 'Gender', 'COLUMN';

--INSERT INTO EmployeeDemographics(EmployeeID, FirstName, LastName, Age, Gender) VALUES
--(1010, 'Arjun', NULL, 30, 'Male'),
--(1011, NULL, 'Kaur', NULL, 'Female'),
--(1012, 'Rina', 'Singh', NULL, NULL),
--(Null, 'Sam', Null, 20, 'Male');
--(1013, 'Dikshant', NULL, 22, 'Male'),
--(1014, 'somen', 'hund', 28, 'Male')

--INSERT INTO EmployeeSalary(EmployeeID, JobTitle, Salary) VALUES
--(1010, NULL,      72000),
--(1011, 'Intern',  NULL),
--(1012, NULL,      NULL),
--(NULL, 'Hr', 100000);
--(1015, 'Salseman', 45000)

/*
SELECT Statement
*, Top, Distinct, Count, As, Max, Min, Avg
*/

--SELECT *
--FROM EmployeeDemographics

--SELECT Top 5 *
--FROM EmployeeDemographics

--SELECT Distinct(Gender)
--FROM EmployeeDemographics

--SELECT Count(LastName) AS LastNameCount
--FROM EmployeeDemographics

--SELECT Max(Salary)
--FROM EmployeeSalary

--SELECT Min(Salary)
--FROM EmployeeSalary

--SELECT Avg(Salary)
--FROM EmployeeSalary

/*
WHERE Statement
=, <>, <, >, And, Or, Like, Null, Not Null, In
*/

/*
GROUP BY, ORDER BY
*/

--SELECT Age, Gender
--FROM EmployeeDemographics
--WHERE Age > 26
--GROUP BY Gender

/*
Inner Join , Full/Left/Right, Outer Join
*/

--SELECT JobTitle, Avg(Salary)
--FROM EmployeeDemographics
--INNER JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle = 'Product Manager'
--GROUP BY JobTitle

/*
UNION UNION ALL
*/

--SELECT *
--FROM EmployeeDemographics
--UNION
--SELECT *
--FROM EmployeeSalary

/* 
CASE Statements
*/

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Product Manager' THEN Salary + (Salary *.10)
--	WHEN JobTitle = 'Project Manager' THEN Salary + (Salary *0.05)
--	WHEN JobTitle = 'Software Engineer' THEN Salary + (Salary *0.07)
--	ELSE Salary + (Salary *0.03)
--END AS New_Salary
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--WHERE JobTitle IS NOT NULL AND Salary IS NOT NULL

/*
Having Clause
*/

--SELECT JobTitle, COUNT(JobTitle)
--FROM EmployeeDemographics
--JOIN EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT(JobTitle) >= 1

/*
Updating/Deleting Data
*/

--SELECT *
--FROM EmployeeDemographics

--UPDATE EmployeeDemographics
--SET EmployeeID = 1015, LastName = 'Choudhary'
--WHERE FirstName = 'Sam'

--DELETE 
--FROM EmployeeDemographics
--WHERE EmployeeID = 1014

--UPDATE EmployeeSalary
--SET Salary = 30000
--WHERE EmployeeID = 1011