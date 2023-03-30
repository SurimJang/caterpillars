### **Weather Observation Station 5**

#### **문제**
> Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

#### **코드**
```MySQL
(SELECT CITY, CHAR_LENGTH(CITY)
FROM STATION
ORDER BY 2, 1
LIMIT 1
)
UNION ALL    -- 정렬하지 않고 합친 뒤 반환
(SELECT CITY, CHAR_LENGTH(CITY)
FROM STATION
ORDER BY 2 DESC, 1
LIMIT 1
)
```

#### **과거 풀이**
```MySQL
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
```

#### **참고**

* 글자수 세기
    * `LENGTH` : Byte 단위의 길이 반환
    * `CHAR_LENGTH` : 글자 단위의 길이 반환
* 집합 연산자
    * `UNION` : 두 개의 SELECT문 결과값을 합친 값 반환 
        - 중복 제거
        - 자동 정렬
    * `UNION ALL` : 두 개의 SELECT문 결과값을 합친 값 반환 
        - 중복 허용
        - 정렬 안함 : 마지막 SELECT문에만 정렬 가능

* LIMIT, OFFSET
    * `LIMIT 10` : 행 데이터 10개만 조회하기
    * `LIMIT 10, OFFSET 10` : 11번째 ~ 20번째 행 데이터 조회
    * `LIMIT 10, 10` : 11번째 ~ 20번째 행 데이터 조회 (생략)   
    -- OFFSET: 가져오고자 하는 행 데이터의 시작 지점을 지정하는 옵션으로 0부터 시작