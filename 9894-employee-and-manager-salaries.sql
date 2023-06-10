SELECT first_name, salary
FROM 
(select e.*, e2.salary AS salary_manager from employee e
JOIN employee e2
ON e.manager_id = e2.id) temp
WHERE salary > salary_manager
