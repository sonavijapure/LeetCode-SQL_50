/* SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount*/
select 
extract(year from trans_date) ||'-'||
trim(to_char(EXTRACT(month FROM trans_date),'00')) month,
country,
count(trans_date) trans_count,
sum(case when state = 'approved' then 1 else 0 end)approved_count,
sum(amount) trans_total_amount,
sum(case when state = 'approved' then amount else 0 end) approved_total_amount
from TRANSACTIONS
group by extract(year from trans_date) ||'-'||
trim(to_char(EXTRACT(month FROM trans_date),'00')) ,
country;