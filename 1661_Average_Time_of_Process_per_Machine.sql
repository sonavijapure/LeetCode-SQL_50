/* There is a factory website that has several machines each running the same number of processes. Write a solution to find the average time each machine takes to complete a process. */
select distinct a.machine_id, round((end_t - start_t)/a.cnt,3) processing_time from (
select 
MACHINE_ID,
sum(timestamp) over (partition by machine_id order by machine_id) end_t,
count(process_id) over( partition by machine_id order by machine_id) cnt
from activity where activity_type = 'end'
) a
join
(
select 
MACHINE_ID,
sum(timestamp) over (partition by machine_id order by machine_id) start_t,
count(process_id) over( partition by machine_id order by machine_id) cnt
from activity where activity_type = 'start'
) b
on a.machine_id = b.machine_id 
;