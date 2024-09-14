/*  a solution to report the product_name, year, and price for each sale_id in the Sales table. */
select 
p.product_name, s.year, s.price
from sales s join product p
on s.product_id = p.product_id
;