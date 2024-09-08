/* 
Compute the moving average of how much the customer paid in a seven days window (i.e., current day + 6 days before). average_amount should be rounded to two decimal places. 
*/

with agg_data as 
(
select visited_on,
sum(amount) sum_amt,
rank() over (order by visited_on) rnk
from customer group by visited_on
)
, avg_amt as(
select
visited_on,
sum(sum_amt) over (order by visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) amount,
round(avg(sum_amt) over (order by visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) average_amount
from agg_data 
)
select to_char(visited_on,'YYYY-MM-DD') visited_on, amount  ,average_amount
from avg_amt
where visited_on in (select visited_on+6 from avg_amt)
;