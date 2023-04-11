### 02. Revising the Select Query II
[바로가기](https://www.hackerrank.com/challenges/revising-the-select-query-2/problem)
```MySQL
/* CITY 테이블에서 인구(POPULATION)가 120,000명 이상이고 COUNTRYCODE가 USA인 모든 도시명(NAME)을 출력하시오.*/

SELECT NAME
FROM CITY
WHERE POPULATION > 120000
AND COUNTRYCODE = 'USA'
```
