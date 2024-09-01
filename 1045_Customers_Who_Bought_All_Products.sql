/* A solution to report the customer ids from the Customer table that bought all the products in the Product table. */
select distinct c.customer_id
from(
select customer_id, product_key,
count(product_key)  over (partition by customer_id order by customer_id) prod_cnt
from(
select distinct customer_id, product_key
from customer)order by 1,2 ) c
join product p on c.product_key = p.product_key
where c.prod_cnt = (select count(distinct product_key) from product)
order by 1
;
