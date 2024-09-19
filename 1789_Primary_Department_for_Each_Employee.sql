/* a solution to report all the employees with their primary department. For employees who belong to one department, report their only department. */
select
employee_id ,department_id
from employee
where primary_flag = 'Y'
or employee_id in (select employee_id from employee group by employee_id having count(department_id) = 1)
;