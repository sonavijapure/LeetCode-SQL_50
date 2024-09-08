/* 
A solution to find the people who have the most friends and the most friends number.
 */

with unq_id as (
select distinct 
a.requester_id id
from requestaccepted a join RequestAccepted b on a.requester_id = b.requester_id or a.accepter_id = b.accepter_id
union
select distinct
a.accepter_id id
from requestaccepted a join RequestAccepted b on a.requester_id = b.requester_id or a.accepter_id = b.accepter_id
)
, req_id_cnt as (
select u.id, count(r.requester_id) req_cnt
from unq_id u
left join requestaccepted r on u.id = r.requester_id
where u.id in (select distinct requester_id from requestaccepted)
group by u.id
)
, acc_id_cnt as (
select u.id, count(r.accepter_id) acc_cnt
from unq_id u
left join requestaccepted r on u.id = r.accepter_id
where u.id in (select distinct accepter_id from requestaccepted)
group by u.id
)
, all_id_cnt as (select u.id, coalesce(r.req_cnt,0) + coalesce(a.acc_cnt,0) cnt
from unq_id u
left join req_id_cnt r
on u.id = r.id
left join acc_id_cnt a
on u.id = a.id
)
select id, cnt num
from all_id_cnt
where cnt = (select max(cnt) from all_id_cnt)
;
