/* 
A solution to find the second highest distinct salary from the Employee table. If there is no second highest salary, return null
 */
WITH emp_sal AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM employee
)
SELECT 
    MAX(CASE WHEN rnk = 2 THEN salary ELSE NULL END) AS SecondHighestSalary
FROM emp_sal;