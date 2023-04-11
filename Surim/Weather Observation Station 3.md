### 08. Weather Observation Station 3

#### PROBLEM
> Query a list of CITY names from STATION for cities that have an even ID number. Print the results in any order, but exclude duplicates from the answer.
The STATION table is described as follows:

| Field       |   Type     |
| -- | -- |
| ID          | INTEGER    |
| CITY        | VARCHAR(21)|
| STATE       | VARCHAR(2) |
| LAT_N       | NUMERIC    |
| LONG_W      | NUMERIC    |

#### CODE
```MySQL
SELECT DISTINCT CITY
FROM STATION
WHERE MOD(ID, 2) = 0
ORDER BY CITY;
```

#### LESSON & LEARN

* `SELECT DISTINCT`   
    : Select the unique values. equal to `unique()` in python.
    
* `SELECT DISTINCT <COL> FROM <TABLE> WHERE <COND>`   
    : Select the unique values with condition.
    
* `SELECT COUNT(DISTINCT <COL>) FROM <TABLE>`   
    : Count the unique values. equal to `value_counts()` in python.
    
* `MOD(X, Y)`   
    : Return the value of (X % Y).
