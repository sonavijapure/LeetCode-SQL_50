/*  a solution to delete all duplicate emails, keeping only one unique email with the smallest id.*/
delete from person where not id in (
select distinct
first_value(id) over (partition by email order by id) id
from person);