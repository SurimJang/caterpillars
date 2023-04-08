### 07. Weather Observation Station 1

#### PROBLEM
> Query a list of CITY and STATE from the STATION table.
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
SELECT CITY, STATE
FROM STATION
ORDER BY CITY, STATE;
```
