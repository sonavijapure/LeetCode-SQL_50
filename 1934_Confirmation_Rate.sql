/* A solution to find the confirmation rate of each user */

select distinct user_id ,round(first_value(cnf_rate) over(partition by user_id order by cnf_rate desc),2) confirmation_rate from(
SELECT B.user_id, A.action,
CASE WHEN A.action = 'confirmed' THEN cnt /(SELECT COUNT(user_id) FROM confirmations WHERE user_id = B.user_id GROUP BY user_id) ELSE 0 END AS cnf_rate
FROM (SELECT user_id, action,  COUNT(action) AS cnt  FROM confirmations GROUP BY user_id, action) A RIGHT JOIN signups B ON A.user_id = B.user_id);
