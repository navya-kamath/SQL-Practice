/*SELECT & WHERE */

/* 1. Retrieve the names of employees who were hired in the year 2023. */
SELECTCONCAT(first_name, last_name) AS full_name
FROM employees
WHERE hire_date BETWEEN '01-01-2023' AND '31-12-2023'; 

/* 2. Find employees with a salary between 40,000 and 60,000. */
SELECT CONCAT(first_name, last_name) AS full_name
FROM employees
WHERE salary > 40000 AND salary < 60000; 

/* 3. List employees whose names contain the letter "e." */
SELECT CONCAT(first_name, last_name) AS full_name
FROM employees
WHERE first_name LIKE '%e%' OR last_name LIKE '%e%'; 
/* OR */
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE CONCAT(first_name, ' ', last_name) LIKE '%e%';

/* 4. Retrieve the EmployeeID and Name of employees not 
working in the "HR" department. */
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS name
FROM employees
WHERE department NOT LIKE 'Human Resources%'; 

/* 5. Find employees hired before 2024 with salaries greater than 70,000.*/ 
SELECT CONCAT(first_name, ' ', last_name) AS name
FROM employees 
WHERE hire_date < '01-01-2024' AND salary > 70000; 

/* 6. List the first 10 employees alphabetically by their Name. */
SELECT CONCAT(first_name, ' ', last_name) AS name
FROM employees
ORDER BY first_name ASC
LIMIT 10; */

/* 7. Retrieve employees who have "Manager" in their Department. */
SELECT CONCAT(first_name, ' ', last_name) AS name, department
FROM employees
WHERE department ILIKE '%Manager%'; 

/* 8. Find employees with a first name longer than 10 characters. */
SELECT first_name
FROM employees
WHERE LENGTH(first_name) > 10; 

/* 9. Use a CASE statement to classify employees as "High Earners" or 
"Low Earners" based on a salary threshold of 60,000. */
SELECT CONCAT(first_name, ' ', last_name) AS name,
CASE WHEN salary > 60000 THEN 'High Earners'
ELSE 'Low Earners'
END AS earnings
FROM employees; 

/* 10. Retrieve employees whose hire dates fall on a weekend. */
SELECT CONCAT(first_name, ' ', last_name) AS name, 
       hire_date, 
       TO_CHAR(hire_date, 'DAY') AS hire_day
FROM employees
WHERE TO_CHAR(hire_date, 'DY') IN ('SAT', 'SUN');


