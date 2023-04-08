### 01. Revising the Select Query I
[바로가기](https://www.hackerrank.com/challenges/revising-the-select-query/problem)
```MySQL
/* CITY 테이블에서 인구(POPULATION)가 100,000명 이상이고 COUNTRYCODE가 USA인 모든 데이터를 출력하시오.*/

SELECT *
FROM CITY
WHERE POPULATION > 100000
AND COUNTRYCODE = 'USA'
```
