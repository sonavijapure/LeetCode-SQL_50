/* 
A solution to find the employees who are high earners in each of the departments.
*/

with cte as (
select 
e.id, e.name, e.salary, e.departmentId,d.name dept_name,
dense_rank() over (partition by e.departmentId order by e.salary desc ) rnk
from employee e join department d
on e.departmentId = d.id
)
select dept_name department,name employee,salary salary
from cte
where rnk <= 3;