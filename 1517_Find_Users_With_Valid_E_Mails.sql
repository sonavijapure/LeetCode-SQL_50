/* Write a solution to find the users who have valid emails. */
SELECT *
FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9\_\.\-]*@leetcode.com$')
and mail like '%@leetcode.com'
;