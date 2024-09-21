/*  a solution to get the names of products that have at least 100 units ordered in February 2020 and their amount. */
select
distinct p.product_name, sum(o.unit) unit
from products p join orders o on p.product_id = o.product_id
where extract(month from o.order_Date) = 2 and extract (year from o.order_Date) = 2020
group by p.product_name
having sum(o.unit) >= 100
;