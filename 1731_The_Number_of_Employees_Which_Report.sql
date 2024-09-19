/*  solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer. */
select
c.employee_id, c.name, count(e.name) reports_count, round(avg(e.age)) average_age
from employees c join employees e
on c.employee_id = e.reports_To
group by c.employee_id, c.name
order by c.employee_id
;
