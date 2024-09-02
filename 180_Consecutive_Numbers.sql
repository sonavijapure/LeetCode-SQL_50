/* Find all numbers that appear at least three times consecutively. */
with cte as (
select id, num,
lead(num,1) over(order by id) lead_num,
lag(num,1) over(order by id) lag_num,
lead(id,1) over(order by id) lead_id,
lag(id,1) over(order by id) lag_id
from logs
order by id
)
select num ConsecutiveNums
from cte
where num = lead_num and lead_num = lag_num and lead_id - id = 1 and id - lag_id = 1;