/* A solution to find the person_name of the last person that can fit on the bus without exceeding the weight limit. The test cases are generated such that the first person does not exceed the weight limit. */
select person_name from(
with cte as (SELECT person_name,weight,turn,SUM(weight) over (order by turn) as total from Queue)
SELECT person_name
FROM cte
where total <= 1000
order by total DESC )
where rownum = 1
;