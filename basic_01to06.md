### 01. Revising the Select Query I
[바로가기](https://www.hackerrank.com/challenges/revising-the-select-query/problem)
```MySQL
/* CITY 테이블에서 인구(POPULATION)가 100,000명 이상이고 COUNTRYCODE가 USA인 모든 데이터를 출력하시오.*/

SELECT *
FROM CITY
WHERE POPULATION > 100000
AND COUNTRYCODE = 'USA'
```

### 02. Revising the Select Query II
[바로가기](https://www.hackerrank.com/challenges/revising-the-select-query-2/problem)
```MySQL
/* CITY 테이블에서 인구(POPULATION)가 120,000명 이상이고 COUNTRYCODE가 USA인 모든 도시명(NAME)을 출력하시오.*/

SELECT NAME
FROM CITY
WHERE POPULATION > 120000
AND COUNTRYCODE = 'USA'
```

### 03. Select All
[바로가기](https://www.hackerrank.com/challenges/select-all-sql/problem)
```MySQL
/* CITY 테이블의 모든 데이터를 출력하시오. */

SELECT *
FROM CITY
```

### 04. Select By ID
[바로가기](https://www.hackerrank.com/challenges/select-by-id/problem)
```MySQL
/* CITY 테이블에서 ID가 1661인 모든 컬럼을 출력하시오. */

SELECT *
FROM CITY
WHERE ID = 1661  -- 정수형
```

### 05. Japanese Cities' Attributes
[바로가기](https://www.hackerrank.com/challenges/japanese-cities-attributes/problem)
```MySQL
/* CITY 테이블에서 COUNTRYCODE가 JPN인 모든 컬럼을 출력하시오. */

SELECT *
FROM CITY
WHERE COUNTRYCODE = 'JPN'
```

### 06. Japanese Cities' Names
[바로가기](https://www.hackerrank.com/challenges/japanese-cities-name/problem)
```MySQL
/* CITY 테이블에서 COUNTRYCODE가 JPN인 모든 도시명(NAME)을 출력하시오. */

SELECT NAME
FROM CITY
WHERE COUNTRYCODE = 'JPN'
```
