-- Find the highest salary among salaries that appears only once.

SELECT salary FROM employee
WHERE employee_title != 'Manager'
GROUP BY salary
HAVING COUNT(salary) = 1
ORDER BY 1 DESC
LIMIT 1

-- https://platform.stratascratch.com/coding/9919-unique-highest-salary
