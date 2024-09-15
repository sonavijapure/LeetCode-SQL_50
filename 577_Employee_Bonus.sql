/* a solution to report the name and bonus amount of each employee with a bonus less than 1000. */
select 
name, bonus
from employee e left join bonus b
on e.empid = b.empid
where e.empid not in (select e.empid
from employee e join bonus b
on e.empid = b.empid
where b.bonus >= 1000)
;