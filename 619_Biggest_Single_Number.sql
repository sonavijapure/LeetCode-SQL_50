/* the largest single number. If there is no single number, report null. */
with cte as (select
a.num
from mynumbers a
group by a.num
having count(a.num) = 1)
select 
max(num) num
from cte
;