-- 10. Weather Observation Station 5

/*
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.
The STATION table is described as follows: (Omitted)

-- Sample Input
For example, CITY has four entries: DEF, ABC, PQRS and WXY.

-- Sample Output
ABC 3
PQRS 4

-- Explanation
When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with lengths  and . The longest name is PQRS, but there are  options for shortest named city. Choose ABC, because it comes first alphabetically.

-- Note
You can write two separate queries to get the desired output. It need not be a single query.
*/

SELECT CITY, LENGTH(CITY) 
FROM STATION 
WHERE CITY = (SELECT CITY 
              FROM STATION 
              ORDER BY LENGTH(CITY) ASC, CITY ASC 
              LIMIT 1) 
              OR CITY = (SELECT CITY 
                         FROM STATION 
                         ORDER BY LENGTH(CITY) DESC, CITY ASC 
                         LIMIT 1) 
ORDER BY CITY ASC

/*
SELECT 컬럼1, 컬럼2 FROM 테이블 LIMIT 10;
-- 행 데이터 10개만 조회하기

SELECT 컬럼1, 컬럼2 FROM 테이블 LIMIT 10, 10;
-- 11번째 ~ 20번째 행 데이터 조회

Offset 옵션을 이용하면, 가져오고자 하는 행 데이터의 시작 지점을 지정할 수 있음.
Offset 값은 0부터 시작하므로 첫 번째 행 데이터를 가리키는 값은 0
*/