### **Challenges**

#### **PROBLEM**
> Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student. Sort your results by the total number of challenges in descending order. If more than one student created the same number of challenges, then sort the result by hacker_id. If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

#### **CODE**
```MySQL
WITH AGG AS (
    SELECT hacker_id, COUNT(challenge_id) AS tot_challenges
    FROM Challenges
    GROUP BY hacker_id
)
SELECT DISTINCT H.hacker_id, H.name, AGG.tot_challenges
FROM Hackers AS H
    LEFT JOIN AGG
           ON H.hacker_id = AGG.hacker_id
-- 조건: 최대값인 경우만
WHERE AGG.tot_challenges = (SELECT MAX(tot_challenges)
                            FROM AGG
                           )
    -- 조건: 최대값이 아니라면, 중복값이 아닌 경우도
    OR AGG.tot_challenges IN (SELECT tot_challenges
                          FROM AGG
                          GROUP BY tot_challenges
                          HAVING COUNT(*) = 1
                         )
ORDER BY AGG.tot_challenges DESC, H.hacker_id
```

#### **LESSON & LEARN**

* WITH clause
    * [MySQL 8.0 Reference Manual/WITH](https://dev.mysql.com/doc/refman/8.0/en/with.html)
    * format
    ```MySQL
    WITH
        cte1 AS (SELECT a, b FROM table1),
        cte2 AS (SELECT c, d FROM table2)
    SELECT b, d FROM cte1 JOIN cte2
    WHERE cte1.a = cte2.c;
    ```