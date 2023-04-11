-- 12. Weather Observation Station 7

/*
Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. 
Your result cannot contain duplicates.
*/

SELECT DISTINCT CITY
FROM STATION
WHERE CITY REGEXP '[aeiou]$' ;