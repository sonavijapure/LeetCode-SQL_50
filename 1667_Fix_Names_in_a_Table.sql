/* a solution to fix the names so that only the first character is uppercase and the rest are lowercase */
select
user_id, upper(substr(name,1,1))||lower(substr(name,2)) name
from users
order by user_id
;