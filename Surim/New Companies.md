### New Companies

#### **문제**
> Amber's conglomerate corporation just acquired some new companies. Given the table schemas below, write a query to print the company_code, founder name, total number of lead managers, total number of senior managers, total number of managers, and total number of employees. Order your output by ascending company_code.

#### **코드**
```MySQL
SELECT
    C.COMPANY_CODE
,   C.FOUNDER
,   COUNT(DISTINCT(E.LEAD_MANAGER_CODE))
,   COUNT(DISTINCT(E.SENIOR_MANAGER_CODE))
,   COUNT(DISTINCT(E.MANAGER_CODE))
,   COUNT(DISTINCT(E.EMPLOYEE_CODE))
FROM
    COMPANY AS C
,   EMPLOYEE AS E
WHERE
    C.COMPANY_CODE = E.COMPANY_CODE
GROUP BY
    C.COMPANY_CODE
,   C.FOUNDER
ORDER BY
    C.COMPANY_CODE ;
```

#### **레슨런**
* 코드 컨벤션
    * 콤마를 각 라인마다 `,   (CODE)` 스타일로 적을 경우 쿼리를 수정할 때 주석처리를 하기 훨씬 용이하다!
    * `Alias`는 최소한의 의미를 보존하는 문자를 사용한다. (예: CITY as a보다 CITY as C가 더 간명함)