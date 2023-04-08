### **Weather Observation Station 5**

#### **PROBLEM**
> Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

#### **CODE**
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

#### **PREVIOUS CODE**
```MySQL
/*
In this code, I use an obscure subquery. 
HackerRank system doesn't understand 2 or more separated queries unless UNION them.
I found out about it late and solved it with a subquery.
*/
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

#### **LESSON & LEARN**

* LENGTH
    * `LENGTH`      -- Return the length in byte unit.
    * `CHAR_LENGTH` -- Return the length in letter unit. equal to `len()` in python.

* SET OPERATORS
    * `UNION`     -- Returns the sum of the results of two SELECT statements.
                  -- Note: Sorted with no duplicates
    * `UNION ALL` -- Returns the sum of the results of two SELECT statements.
                  -- Note: Not sorting (Apply only sorting in the last SELECT statement)

* LIMIT
    * `LIMIT 10`  -- Retrieving only 10 rows of data.

* OFFSET : An option to specify the starting point of the row.
    * `LIMIT 10, OFFSET 10`   -- Retrieving 11th ~ 20th rows of data.
    * `LIMIT 10, 10`          -- (Same, But simple) 
