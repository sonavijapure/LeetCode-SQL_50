/*  
A solution to swap the seat id of every two consecutive students. If the number of students is odd, the id of the last student is not swapped. Return the result table ordered by id in ascending order. 
*/

with cte as (
select id, student,row_number() over(order by id) rn , lead(student) over(order by id) lead_student, lag(student) over(order by id) lag_student,
first_value(id) over(order by id desc) max_id
from seat
)
,swap_students as(
select id,case when (mod(rn,2)=1) then lead_student else lag_student end student 
from cte
)
, last_student as(
select id,case when (mod(rn,2)=1) then lead_student else lag_student end student from cte
union 
select id ,student from (select id,student from cte where ROWNUM = 1 order by max_id desc)
)
select distinct last_student.id,case when mod(max_id,2) = 1 then last_student.student 
when  mod(max_id,2) = 0 then swap_students.student 
else '0' end student
from last_student join cte
on last_student.id = cte.id
join swap_students 
on swap_students.id = cte.id
where last_student.student is not null
group by last_student.id,cte.max_id,last_student.student,cte.student,swap_students.student 
order by last_student.id
;