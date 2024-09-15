/* a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits */
select 
v.customer_id, count(v.visit_id) count_no_trans
from visits v where v.visit_id not in (select distinct visit_id from transactions)
group by v.customer_id
;