/* a solution to report the movies with an odd-numbered ID and a description that is not "boring".*/
select
id, movie, description, rating
from cinema
where mod(id,2) <> 0 and description <> 'boring'
order by rating desc
;