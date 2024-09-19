/* Report for every three line segments whether they can form a triangle. */
select
x,y,z,
case when x+y > z and x+z > y and y+z > x then 'Yes' else 'No' end triangle
from  triangle
;