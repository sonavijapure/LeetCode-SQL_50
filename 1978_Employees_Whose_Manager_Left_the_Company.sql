/* Find the IDs of the employees whose salary is strictly less than $30000 and whose manager left the company */
select 
employee_id
from employees
where manager_id not in (select employee_id from employees) and salary < 30000
order by employee_id
;