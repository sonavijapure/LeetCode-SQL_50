/*  a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places. If a product does not have any sold units, its average selling price is assumed to be 0. */
with cte as (
select p.product_id, round(sum(p.price*u.units)/sum(u.units),2) average_price  from  prices p join unitssold u
on p.product_id = u.product_id where u.purchase_date between p.start_date and p.end_date group by p.product_id )
select distinct p.product_id, coalesce(c.average_price,0) average_price
from prices p left join cte c on p.product_id = c.product_id
;