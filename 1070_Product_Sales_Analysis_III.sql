/* A solution to select the product id, year, quantity, and price for the first year of every product sold */
with first_year as (
select product_id, 
first_value(year) over (partition by product_id order by year) first_year
from sales)
select distinct s.product_id, f.first_year, s.quantity, s.price
from sales s
join product p on s.product_id = p.product_id 
join first_year f on s.product_id = f.product_id and p.product_id = f.product_id and s.year = f.first_year;