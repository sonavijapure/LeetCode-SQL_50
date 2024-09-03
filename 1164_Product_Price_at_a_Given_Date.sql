/* A solution to find the prices of all products on 2019-08-16. Assume the price of all products before any change is 10 */
with cte as (select product_id,new_price,first_value(change_date) over (partition by product_id order by change_date desc)change_Date,row_number() over (partition by product_id order by change_date desc) rn
from  products
where change_date <= '2019-08-16')
select product_id, new_price price from cte
where rn = 1
union
select product_id, 10 from products where product_id not in (select product_id from cte)
;