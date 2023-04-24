### Draw The Triangle 1

#### PROBLEM
> P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5). Write a query to print the pattern P(20).
```
* * * * * 
* * * * 
* * * 
* * 
*
```

#### CODE
* Using WITH Clause Recursion
```MySQL
WITH RECURSIVE P
AS(
    SELECT 20 AS n    -- 초기값 설정
    UNION ALL         -- 위 쿼리와 아래 쿼리를 연산
    SELECT n-1 FROM P   -- 하나씩 불러옴
    WHERE n > 0         -- 반복 종료 조건
)
SELECT REPEAT('* ', n) FROM P;
```

* Using INFORMATION_SCHEMA Tables
```MySQL
SELECT REPEAT('* ', 21 - (row_number() over())) FROM information_schema.tables limit 20
```

#### LESSON & LEARN

* `RECURSIVE`
  : A recursive common table expression (CTE) is a CTE that has a subquery which refers to the CTE name itself. The following illustrates the syntax of a recursive CTE.
     
![RECURSIVE](https://velog.velcdn.com/images%2Fcyanred9%2Fpost%2F9e362385-b421-4b65-90aa-3791fd6e50f2%2Fimage.png)

  ```MySQL
  WITH RECURSIVE cte_name AS (
    initial_query  -- anchor member
    UNION ALL
    recursive_query -- recursive member that references to the CTE name
  )
  SELECT * FROM cte_name;
  ```

* `REPEAT(string, number)`
  : The REPEAT() function repeats a string as many times as specified.

* `INFORMATION SCHEMA`
  : [link](https://rk1993.tistory.com/230)
