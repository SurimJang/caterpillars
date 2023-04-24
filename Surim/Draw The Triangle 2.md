### Draw The Triangle 2

#### PROBLEM
> P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5). Write a query to print the pattern P(20).
```
* 
* * 
* * * 
* * * * 
* * * * *
```
#### CODE

* Using WITH Clause Recursion
```MySQL
WITH RECURSIVE P
AS(
    SELECT 20 AS n    -- 초기값 설정
    UNION ALL         -- 위 쿼리와 아래 쿼리를 연산
    SELECT n + 1 FROM P   -- 하나씩 불러옴
    WHERE n < 20         -- 반복 종료 조건
)
SELECT REPEAT('* ', n) FROM P;
```
