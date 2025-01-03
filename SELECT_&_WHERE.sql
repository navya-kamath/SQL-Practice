/*For the dataset Employees(employee_id, first_name, last_name, salary, department, hire_date) */

/* 1. Retrieve the names of employees who were hired in the year 2023 */
SELECTCONCAT(first_name, last_name) AS full_name
FROM employees
WHERE hire_date BETWEEN '01-01-2023' AND '31-12-2023'; 

/* 2. Find employees with a salary between 40,000 and 60,000 */
SELECT CONCAT(first_name, last_name) AS full_name
FROM employees
WHERE salary > 40000 AND salary < 60000; 

/* 3. List employees whose names contain the letter "e" */
SELECT CONCAT(first_name, last_name) AS full_name
FROM employees
WHERE first_name LIKE '%e%' OR last_name LIKE '%e%'; 
/* OR */
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE CONCAT(first_name, ' ', last_name) LIKE '%e%';

/* 4. Retrieve the EmployeeID and Name of employees not working in the "HR" department */
SELECT employee_id, CONCAT(first_name, ' ', last_name) AS name
FROM employees
WHERE department NOT LIKE 'Human Resources%'; 

/* 5. Find employees hired before 2024 with salaries greater than 70,000 */ 
SELECT CONCAT(first_name, ' ', last_name) AS name
FROM employees 
WHERE hire_date < '01-01-2024' AND salary > 70000; 

/* 6. List the first 10 employees alphabetically by their Name */
SELECT CONCAT(first_name, ' ', last_name) AS name
FROM employees
ORDER BY first_name ASC
LIMIT 10; */

/* 7. Retrieve employees who have "Manager" in their Department */
SELECT CONCAT(first_name, ' ', last_name) AS name, department
FROM employees
WHERE department ILIKE '%Manager%'; 

/* 8. Find employees with a first name longer than 10 characters */
SELECT first_name
FROM employees
WHERE LENGTH(first_name) > 10; 

/* 9. Use a CASE statement to classify employees as "High Earners" or "Low Earners" based on a salary threshold of 60,000 */
SELECT CONCAT(first_name, ' ', last_name) AS name,
CASE WHEN salary > 60000 THEN 'High Earners'
ELSE 'Low Earners'
END AS earnings
FROM employees; 

/* 10. Retrieve employees whose hire dates fall on a weekend */
SELECT CONCAT(first_name, ' ', last_name) AS name, 
       hire_date, 
       TO_CHAR(hire_date, 'DAY') AS hire_day
FROM employees
WHERE TO_CHAR(hire_date, 'DY') IN ('SAT', 'SUN');

/* For the dataset world(name, continent, area, population, gdp, capital) */

/* 11. Show the population of 'Germany' */
SELECT population 
FROM world
WHERE name = 'Germany';

/* 12. Show the name and the population for 'Sweden', 'Norway' and 'Denmark' */
SELECT name, population FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');

/* 13. Show the country and the area for countries with an area between 200,000 and 250,000 */
SELECT name, area FROM world
WHERE area BETWEEN 200000 AND 250000;

/* 14. Show the name, continent and population of all countries */
SELECT name, continent, population
FROM world;

/* 15. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are 
eight zeros */
SELECT name 
FROM world
WHERE population >= 200000000;

/* 16. Give the name and the per capita GDP for those countries with a population of at least 200 million */
SELECT name, gdp/population
FROM world
WHERE population >= 200000000;

/* 17. Show the name and population in millions for the countries of the continent 'South America'. Divide the population 
by 1000000 to get population in millions */
SELECT name, population/1000000
FROM world
WHERE continent ='South America';

/* 18. Show the name and population for France, Germany, Italy */
SELECT name, population 
FROM world
WHERE name IN ('France','Germany','Italy');

/* 19. Show the countries which have a name that includes the word 'United' */
SELECT name
FROM world
WHERE name LIKE '%United%';

/* 20. Show the countries that are big by area or big by population. Show name, population and area.
Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million */
SELECT name, population, area
FROM world
WHERE area > 3000000 OR population > 250000000;

/* 21. Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. 
Show name, population and area */
SELECT name, population, area
FROM world
WHERE (population> 250000000 OR area>3000000) AND NOT (population> 250000000 AND area>3000000);

/* 22. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. 
Use the ROUND function to show the values to two decimal places */
SELECT name, ROUND(population/1000000,2), ROUND(gdp/1000000000,2)
FROM world
WHERE continent = 'South America';

/* 23. Show the name and capital where the name and the capital have the same number of characters. */
SELECT name, capital
FROM world
WHERE LENGTH(name) = LENGTH(capital);

/* 24. Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital 
are the same word */
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital,1) AND (name <> capital);

/* 25. Find the country that has all the vowels and no spaces in its name */
SELECT name
FROM world
WHERE name LIKE '%a%' 
AND name LIKE '%e%' 
AND name LIKE '%i%' 
AND name LIKE '%o%' 
AND name LIKE '%u%'
AND name NOT LIKE '% %';

/* 26. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros).
Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.*/
SELECT name, ROUND(gdp/population,-3)
FROM world
WHERE gdp >= 1000000000000;

/* For the dataset nobel(yr, subject, winner) */

/* 27. Change the query shown so that it displays Nobel prizes for 1950 */
SELECT yr, subject, winner
FROM nobel
WHERE yr = 1950;

/* 28. Show who won the 1962 prize for literature */
SELECT winner
FROM nobel
WHERE yr = 1962
AND subject = 'literature';

/* 29. Show the year and subject that won 'Albert Einstein' his prize */
SELECT yr, subject
FROM nobel
WHERE winner = 'Albert Einstein';

/* 30. Give the name of the 'peace' winners since the year 2000, including 2000 */
SELECT winner
FROM nobel
WHERE yr >= 2000 AND subject = 'peace';

/* 31. Show all details (yr, subject, winner) of the literature prize winners for 1980 to 1989 inclusive */
SELECT yr, subject, winner
FROM nobel
WHERE yr BETWEEN 1980 AND 1989 AND ( subject = 'literature');

/* 32. Show all details of the presidential winners:
Theodore Roosevelt
Thomas Woodrow Wilson
Jimmy Carter
Barack Obama */
SELECT *
FROM nobel
WHERE winner IN ('Theodore Roosevelt',
'Thomas Woodrow Wilson',
'Jimmy Carter',
'Barack Obama');

/* 33. Show the winners with first name John */
SELECT winner
FROM nobel
WHERE winner LIKE 'John%';

/* 34. Show the year, subject, and name of physics winners for 1980 together with the chemistry winners for 1984 */
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'physics' AND yr =1980) OR (subject ='chemistry' AND yr = 1984);

/* 35. Show the year, subject, and name of winners for 1980 excluding chemistry and medicine */
SELECT yr, subject, winner
FROM nobel
WHERE yr =1980 AND subject NOT IN ('chemistry','medicine');

/* 36. Show year, subject, and name of people who won a 'Medicine' prize in an early year (before 1910, not including 1910) 
together with winners of a 'Literature' prize in a later year (after 2004, including 2004) */
SELECT yr, subject, winner
FROM nobel
WHERE (subject = 'medicine' AND yr < 1910) OR (subject ='literature' AND yr >= 2004);

/* 37. Find all details of the prize won by PETER GRÜNBERG */
SELECT *
FROM nobel
WHERE winner = 'PETER GRÜNBERG';

/* 38. Find all details of the prize won by EUGENE O'NEILL */
SELECT *
FROM nobel
WHERE winner = 'EUGENE O''NEILL';

/* 39. List the winners, year and subject where the winner starts with Sir. Show the the most recent first, then by name order */
SELECT winner, yr, subject
FROM nobel
WHERE winner LIKE 'Sir%'
ORDER BY yr DESC, winner ASC;

/* 40. The expression subject IN ('chemistry','physics') can be used as a value - it will be 0 or 1.
Show the 1984 winners and subject ordered by subject and winner name; but list chemistry and physics last */
SELECT winner, subject
FROM nobel
WHERE yr=1984
ORDER BY subject IN ('chemistry','physics'),subject ,winner;
