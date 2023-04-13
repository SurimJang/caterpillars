### **Ollivander's Inventory**

#### **PROBLEM**
> Harry Potter and his friends are at Ollivander's with Ron, finally replacing Charlie's old broken wand.
Hermione decides the best way to choose is by determining the minimum number of gold galleons needed to buy each non-evil wand of high power and age. Write a query to print the id, age, coins_needed, and power of the wands that Ron's interested in, sorted in order of descending power. If more than one wand has same power, sort the result in order of descending age.
#### **CODE**
```MySQL
SELECT W.id, WP.age, M.coins_needed, W.power 
FROM (SELECT code
            ,min(coins_needed) AS coins_needed
            ,power 
      FROM wands 
      GROUP BY code, power
     ) AS M
    INNER JOIN Wands AS W 
            ON W.code = M.code 
            AND W.power = M.power 
            AND W.coins_needed = M.coins_needed 
    INNER JOIN Wands_Property AS WP 
            ON WP.code = W.code 
WHERE WP.is_evil = 0 
ORDER BY W.power DESC, WP.age DESC ;
```

#### **LESSON & LEARN**

* Failure Case1 : Missing an alias
    * `min(coins_needed) AS coins_needed`  --Always assign an alias!!
* Failure Case2 : GROUP BY requires all SELECT elements
    ```MySQL
    SELECT W.id, WP.age, MIN(W.coins_needed), W.power 
    FROM ...
    WHERE ...
    GROUP BY WP.age, W.power   --Required W.id
    ORDER BY ...
    /*
    >>> ERROR 1055 (42000) at line 1: Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'run_mzgsuvebnwq.W.id' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by
    */
    ```