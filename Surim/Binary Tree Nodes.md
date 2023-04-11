### Binary Tree Nodes

#### **문제**
> You are given a table, BST, containing two columns: N and P, where N represents the value of a node in Binary Tree, and P is the parent of N.
Write a query to find the node type of Binary Tree ordered by the value of the node.

#### **코드**
```MySQL
SELECT N,
    (CASE 
        WHEN P IS NULL THEN "Root"
        WHEN N NOT IN (SELECT DISTINCT P 
                       FROM BST 
                       WHERE P IS NOT NULL) THEN "Leaf"
        ELSE "Inner"
    END) AS NODE
FROM BST 
ORDER BY N ;
```

#### **레슨런**
* `END AS` : AS를 사용해 새로운 컬럼명을 지정하지 않으면 오류가 발생함을 잊지 말자!