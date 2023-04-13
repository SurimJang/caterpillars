### **Contest Leaderboard**

#### **PROBLEM**
> You did such a great job helping Julia with her last coding contest challenge that she wants you to work on this one, too!
The total score of a hacker is the sum of their maximum scores for all of the challenges. Write a query to print the hacker_id, name, and total score of the hackers ordered by the descending score. If more than one hacker achieved the same total score, then sort the result by ascending hacker_id. Exclude all hackers with a total score of  from your result.

#### **CODE**
```MySQL
SELECT hacker_id, name, SUM(max_score) AS tot_score
FROM (
    SELECT H.hacker_id, H.name, MAX(S.score) AS max_score
    FROM Submissions S
        INNER JOIN Hackers AS H
                ON S.hacker_id = H.hacker_id
    GROUP BY S.challenge_id, H.name, H.hacker_id
) AS AGG
WHERE max_score > 0
GROUP BY name, hacker_id
ORDER BY tot_score DESC, hacker_id
```

#### **FAILURE CASE**
```MySQL
--왜 아래 WITH 구문이 오류가 나는지 알 수가 없다!
WITH AGG AS (
    SELECT hacker_id, challenge_id, MAX(score) AS max_score
    FROM Submissions
    GROUP BY hacker_id, challenge_id
)

SELECT H.hacker_id, H.name, SUM(AGG.max_score) AS tot_score
FROM Hackers AS H
    INNER JOIN AGG ON H.hacker_id = AGG.hacker_id
WHERE SUM(AGG.max_score) > 0 
GROUP BY H.hacker_id, H.name
ORDER BY H.hacker_id;
```

#### **LESSON & LEARN**
* PARTITION을 사용하면 GROUP BY의 제약에서 벗어나 같은 효과를 낼 수 있음. #TODO: 유사점과 차이점 비교
* 집계 함수를 OVER과 함께 윈도우 함수로 사용하면 기존 데이터를 그대로 유지한 채 새로운 집계 값 생성 가능.
