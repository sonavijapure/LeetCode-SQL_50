/* a solution to find the percentage of the users registered in each contest rounded to two decimals.*/
select 
r.contest_id, round((count(r.user_id)/(select count(user_id) from users))*100,2) percentage 
from users u join register r
on u.user_id = r.user_id
group by r.contest_id
order by 2 desc, 1 asc
;