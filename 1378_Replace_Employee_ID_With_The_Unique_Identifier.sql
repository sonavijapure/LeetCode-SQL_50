/* a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null */
select 
b.unique_id, a.name
from employees a left join employeeuni b
on a.id = b.id
;