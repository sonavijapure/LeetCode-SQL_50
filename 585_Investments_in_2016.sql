/*  A solution to report the sum of all total investment values in 2016 tiv_2016, for all policyholders who:

have the same tiv_2015 value as one or more other policyholders, and
are not located in the same city as any other policyholder (i.e., the (lat, lon) attribute pairs must be unique). 

*/

with tiv15 as (
select tiv_2015 from insurance
group by tiv_2015
having count(*) > 1
)
, lat_lon as (
select lat ||' - '||lon l_key from insurance
group by lat ||' - '||lon
having count(*) = 1
)
select round(sum(tiv_2016),2) tiv_2016
from tiv15 a join insurance b on a.tiv_2015 = b.tiv_2015
join lat_lon c on b.lat ||' - '||b.lon = c.l_key
;