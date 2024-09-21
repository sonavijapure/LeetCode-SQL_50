/* Write a solution to find for each date the number of different products sold and their names.
The sold products names for each date should be sorted lexicographically */

WITH distinct_products AS (
    SELECT DISTINCT sell_date, product
    FROM activities
)
SELECT
    to_char(sell_date,'yyyy-mm-dd') sell_Date,
    COUNT(product) AS num_sold,
    LISTAGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM distinct_products
GROUP BY sell_date
ORDER BY sell_date;