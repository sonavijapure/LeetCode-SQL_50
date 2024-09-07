/* Find the name of the user who has rated the greatest number of movies. In case of a tie, return the lexicographically smaller user name.

Find the movie name with the highest average rating in February 2020. In case of a tie, return the lexicographically smaller movie name
*/

select results from (
with max_count as (select mr.user_id,us.name,
count(movie_id) over(partition by mr.user_id order by mr.user_id) cnt
from movierating mr join users us on mr.user_id = us.user_id)
select name results,ROW_NUMBER() OVER (order by name asc) rn from max_count
where cnt = (select max(cnt) from max_count))where rn = 1
union all
select results from (
with movie_rate as (select mr.movie_id,mv.title ,
avg(mr.rating) over(partition by mr.movie_id order by mr.movie_id) avg_rate
from movierating mr  join movies mv on mr.movie_id = mv.movie_id
where extract(month from mr.created_at) = 2)
select title results,ROW_NUMBER() OVER (order by title asc) rn from movie_rate
where avg_rate = (select max(avg_rate) from movie_rate))where rn = 1
;