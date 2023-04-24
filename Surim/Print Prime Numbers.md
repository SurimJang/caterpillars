### Print Prime Numbers

#### PROBLEM
> Write a query to print all prime numbers less than or equal to 1000. 
> Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).
> For example, the output for all prime numbers <=10 would be:
```
2&3&5&7
```
#### CODE
```MySQL
/* Code by Useranme chrisrichardmil1 */

WITH RECURSIVE t AS (   
    SELECT 2 AS nums    -- 초기값 설정 (2부터)
    UNION
    SELECT nums + 1
    FROM t
    WHERE nums < 1000   -- 종료값 설정 (1000까지)
)
SELECT GROUP_CONCAT(nums SEPARATOR '&')   -- &로 문자열 묶기
FROM t
WHERE nums NOT IN (         -- 소수가 아닌 모든 숫자
    SELECT DISTINCT a.nums  --
    FROM t a
    JOIN t b
    ON b.nums <= FLOOR(SQRT(a.nums)) -- 필요한 인수의 수를 제한하여 쿼리를 최적화
        AND a.nums % b.nums = 0      -- 각 숫자의 약수를 찾는 % 연산자를 사용하여 합성수 목록을 생성
)
/*
WHERE 절은 "t" 테이블에서 nums 필드가 하위 쿼리에서 반환된 숫자 목록에 포함되지 않는 숫자만 선택.
하위 쿼리는 결합된 "t" 테이블에서 각 숫자 a의 약수인 b를 찾아낸 다음, a가 b로 나누어 떨어지는지 확인하여 합성수 목록을 생성. 
이 목록에서 DISTINCT를 사용하여 중복된 값이 제거.

예를 들어, 하위 쿼리에서 "t" 테이블에서 a = 10의 약수를 찾을 때, b는 1, 2, 5, 10 중 하나가 될 수 있음. 
그러나 FLOOR(SQRT(10))은 3이므로, b는 3 이하인 숫자만 탐색. 따라서 b = 1, 2가 선택되고, 이 중에서 10 % 2 = 0 이므로, 10은 합성수.

최종적으로, WHERE 절은 이러한 합성수 목록에서 nums 필드에 해당하는 숫자를 제외하고, 
GROUP_CONCAT 함수를 사용하여 소수를 구분자 "&"로 구분하여 연결.
*/
```

#### LESSON & LEARN

* `GROUP_CONCAT(필드명)`
  :  returns a string with concatenated non-NULL value from a group.   
  
  ![GROUP_CONCAT](https://www.mysqltutorial.org/wp-content/uploads/2013/05/MSQL-group_concat.png)
  
  * 기본형 : GROUP_CONCAT(필드명)
  * 구분자 변경 : GROUP_CONCAT(필드명 SEPARATOR '구분자')
  * 중복 제거 : GROUP_CONCAT(DISTINCT 필드명)
  * 문자열 정렬 : GROUP_CONCAT(필드명 ORDER BY 필드명)
