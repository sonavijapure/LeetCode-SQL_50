/* a solution to calculate the number of unique subjects each teacher teaches in the university */
select
teacher_id, count(distinct subject_id) cnt 
from teacher
group by teacher_id
;