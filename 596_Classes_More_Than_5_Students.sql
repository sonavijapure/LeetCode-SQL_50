/*  a solution to find all the classes that have at least five students. */
select 
class
from courses
having count(class) >= 5
group by class
;