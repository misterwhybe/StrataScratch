-- Oracle is comparing the monthly wages of their employees in each department to those of their managers and co-workers.


-- You have been tasked with creating a table that compares an employee's salary to that of their manager and to the average salary of their department.


-- It is expected that the department manager's salary and the average salary of employee's from that department are in their own separate column.

-- Get the average salary without the managers
WITH temp AS (SELECT department, ROUND(AVG(salary), 0) AS new_salary from employee_o
WHERE employee_title != 'Manager'
GROUP BY department),

-- Get the salary of manager per department
managers AS (SELECT department, salary FROM employee_o
WHERE employee_title = 'Manager'
GROUP BY department, salary)

SELECT id, 
employee_title,
T1.department,
T1.salary,
new_salary AS "Average salary",
m.salary AS "Manager salary"
FROM employee_o T1
LEFT JOIN temp T2
ON T1.department = T2.department
LEFT JOIN managers m
ON T1.department = m.department
ORDER BY department, T1.salary DESC

-- https://platform.stratascratch.com/coding/2146-department-manager-and-employee-salary-comparison
