/* a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday). */

SELECT DISTINCT a.Id
FROM weather a,weather b
WHERE a.Temperature > b.Temperature
AND a.recorddate-b.recorddate = 1;