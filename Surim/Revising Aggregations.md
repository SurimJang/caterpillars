### 23. Revising Aggregations 

**The Count Function**

> Query a count of the number of cities in CITY having a Population larger than 100,000.

```MySQL
SELECT COUNT(*) 
FROM CITY
WHERE POPULATION > 100000 ;
```

**The Sum Function**

> Query the total population of all cities in CITY where District is California.

```MySQL
SELECT SUM(POPULATION)
FROM CITY
WHERE DISTRICT = 'California' ;
```

**Averages**

> Query the average population of all cities in CITY where District is California.

```MySQL
SELECT AVG(POPULATION)
FROM CITY
WHERE DISTRICT = 'California' ;
```

**Average Population**

> Query the average population for all cities in CITY, rounded down to the nearest integer.


```MySQL
SELECT FLOOR(AVG(POPULATION))
FROM CITY ;
```

**Japan Population**

> Query the sum of the populations for all Japanese cities in CITY. The COUNTRYCODE for Japan is JPN.

```MySQL
SELECT SUM(POPULATION)
FROM CITY
WHERE COUNTRYCODE = 'JPN'
```

**Population Density Difference**

> Query the difference between the maximum and minimum populations in CITY.

```
SELECT MAX(POPULATION) - MIN(POPULATION)
FROM CITY ;
```

**The Blunder**

> Samantha was tasked with calculating the average monthly salaries for all employees in the EMPLOYEES table, but did not realize her keyboard's  key was broken until after completing the calculation. She wants your help finding the difference between her miscalculation (using salaries with any zeros removed), and the actual average salary.

Write a query calculating the amount of error (i.e.: Actual - Miscalculated, average monthly salaries), and round it up to the next integer.

```MySQL
SELECT CEIL(AVG(Salary) - AVG(REPLACE(Salary, '0', '')))
FROM EMPLOYEES ;
```

**Top Earners**

> We define an employee's total earnings to be their monthly 'SALARY * MONTH' worked, and the maximum total earnings to be the maximum total earnings for any employee in the Employee table. Write a query to find the maximum total earnings for all employees as well as the total number of employees who have maximum total earnings. Then print these values as  space-separated integers.

```MySQL
SELECT salary * months AS tot_earning, COUNT(*)
FROM Employee 
GROUP BY tot_earning
ORDER BY tot_earning DESC
LIMIT 1 ;
```