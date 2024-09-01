/* A solution to report the fraction of players that logged in again on the day after the day they first logged
 in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for 
 at least two consecutive days starting from their first login date, then divide that number by the 
 total number of players.*/

select round(B.cont_player_cnt/A.dist_player_cnt,2) fraction from 
(select count(distinct player_id) dist_player_cnt from activity) A,
(select count(player_id) cont_player_cnt from(
select player_id, event_date,lead(event_date) OVER (partition by player_id ORDER BY event_date asc) lead_event_date,
first_value(event_Date) over(partition by player_id order by event_date) player_first_Date
from activity) where lead_event_date - event_date = 1 and event_date = player_first_Date) B
;