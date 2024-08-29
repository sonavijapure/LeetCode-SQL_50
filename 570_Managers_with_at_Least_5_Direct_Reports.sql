/* A solution to find managers with at least five direct reports */
select name from employee E join (select managerid from employee group by managerid having count(managerid) >= 5) M
on E.id = M.managerid;