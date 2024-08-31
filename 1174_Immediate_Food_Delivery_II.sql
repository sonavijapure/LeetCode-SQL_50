/* A solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places. */
select 
round(unique_distinct.imm_order_customer_id/total_distinct.dist_customer_cnt*100,2) immediate_percentage from
(select count(distinct customer_id) dist_customer_cnt from DELIVERY) total_distinct,
(select count(A.CUSTOMER_ID) imm_order_customer_id from DELIVERY A,
(select customer_id, ORDER_DATE,FIRST_VALUE(order_date) OVER (PARTITION by CUSTOMER_ID order by ORDER_DATE asc) first_order_Date
from DELIVERY) B where A.CUSTOMER_PREF_DELIVERY_DATE = B.first_order_Date and A.customer_id = B.customer_id and a.ORDER_DATE = b.order_Date) unique_distinct
;
