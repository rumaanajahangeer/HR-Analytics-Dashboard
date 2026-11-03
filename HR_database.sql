CREATE DATABASE hr_analytics;
USE hr_analytics;

CREATE TABLE employees (
    Employee_ID VARCHAR(10) PRIMARY KEY,
    Age INT,
    Gender VARCHAR(10),
    Department VARCHAR(50),
    Job_Role VARCHAR(100),
    Education VARCHAR(50),
    Monthly_Income INT,
    Years_at_Company INT,
    Job_Satisfaction INT,
    Attrition VARCHAR(10)
);
SELECT * FROM employees;
SELECT * FROM employees
LIMIT 5;

SELECT COUNT(Employee_ID) AS TOTAL_EMPLOYEES
FROM employees;

SELECT ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 
        / COUNT(*), 2
    ) AS Attrition_Rate
FROM employees;


SELECT ROUND(AVG(Monthly_Income),2) AS Average_Salary
FROM employees;

SELECT Department, COUNT(*) AS Total_Employees,
       SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
       ROUND(SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0
       / COUNT(*), 2
       ) AS Attrition_Rate
FROM employees
GROUP BY Department
ORDER BY Attrition_Rate DESC;       

SELECT Gender, COUNT(*) AS Employee_Count
FROM employees
GROUP BY Gender;

SELECT Department, ROUND(AVG(Years_at_Company), 2) AS Avg_Years
FROM employees
GROUP BY Department
ORDER BY Avg_Years DESC;