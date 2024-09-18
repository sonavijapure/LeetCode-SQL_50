/*  a solution to find each query_name, the quality and poor_query_percentage */

select 
query_name, round(avg(rating/position),2) quality,  round(COUNT(CASE WHEN rating < 3 THEN 1 END) * 100.0 / COUNT(rating),2) poor_query_percentage 
from queries
where query_name is not null
group by query_name
;