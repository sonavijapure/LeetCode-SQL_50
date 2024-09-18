/* a solution that will, for each user, return the number of followers. */
select
user_id, count(follower_id) followers_count
from followers
group by user_id
order by user_id
;