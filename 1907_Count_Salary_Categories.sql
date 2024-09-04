/*
a solution to calculate the number of bank accounts for each salary category. The salary categories are:'Average Salary','High Salary','Low Salary'
*/
with cte as (
select 
case when INCOME < '20000' then 'Low Salary'
    when INCOME between '20000' and '50000' then 'Average Salary'
    when INCOME > '50000' then 'High Salary'
    else '0' end as category
from ACCOUNTS)
    select category,
    decode (category, 'High Salary', count(category),
                        'Average Salary',count(category),
                        'Low Salary',count(category),
                        0) accounts_count
    from cte
    group by category
union 
select 'High Salary' category,0 accounts_count from cte where not EXISTS (select category from cte where category = 'High Salary')
union
select 'Average Salary' category,0 accounts_count from cte where not EXISTS (select category from cte where category = 'Average Salary')
union
select 'Low Salary' category,0 accounts_count from cte where not EXISTS (select category from cte where category = 'Low Salary');