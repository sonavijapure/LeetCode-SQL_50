/*  a solution to find the number of times each student attended each exam. */
with cte as (
select 
s.student_id, s.student_name, b.subject_name
from students s cross join subjects b 
)
select c.student_id, c.student_name, c.subject_name, coalesce(count(e.subject_name),0) attended_exams
from cte c left join examinations e on c.student_id = e.student_id and c.subject_name = e.subject_name
group by  c.subject_name,c.student_id, c.student_name
order by c.student_id, c.student_name
;