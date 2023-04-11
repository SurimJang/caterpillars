-- 11. Weather Observation Station 6

/*
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. 
Your result cannot contain duplicates.

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
WHERE CITY REGEXP '^[aeiou]' ;


/*
-- 틀린 구문: WHERE LIKE '[aeiou]%' 
LIKE를 사용해 복수 문자열을 검색하고 싶다면 다음과 같이 OR를 활용해야한다.

SELECT CITY
FROM STATION
WHERE CITY LIKE 'A%' 
OR CITY LIKE 'E%' 
OR CITY LIKE 'I%' 
OR CITY LIKE 'O%' 
OR CITY LIKE 'U%'; 

-- 틀린 구문: WHERE CITY REGEXP '^[aeiou]%' ;
LIKE와 정규표현식 패턴검색을 헷갈리지 말자.
*/