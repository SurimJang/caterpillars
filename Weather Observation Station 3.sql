-- 08. Weather Observation Station 3

/*
Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
The STATION table is described as follows:

+-------------+------------+
| Field       |   Type     |
+-------------+------------+
| ID          | INTEGER    |
| CITY        | VARCHAR(21)|
| STATE       | VARCHAR(2) |
| LAT_N       | NUMERIC    |
| LONG_W      | NUMERIC    |
+-------------+------------+

*/

SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0
ORDER BY CITY;

/*
SELECT DISTINCT
  -- Select the unique values. equal to `value_counts()` in python.

SELECT DISTINCT 컬럼 FROM 테이블 WHERE 조건식;
  -- Select the unique values with condition.

SELECT COUNT(DISTINCT 컬럼) FROM 테이블
  -- Count the unique values.

MOD(X, Y)
  -- Return the value of (X % Y).
*/