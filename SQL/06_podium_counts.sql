-- Problem 06: Show how often each driver appeared in the top 3.
/* Explanation: To show the driver, we used the forename and surname from the driver's table. 
				We need to use the count aggregation function from the "results table".
                Then we need to check the position for the distinct driverId in the range [1, 2, 3]
                So use the where clause using the between keyword.
                Group by the results by using the driver driverId, forename, & surname.
                Order by the count using descending order.
				

*/
select 	d.driverId,
		d.forename,
		d.surname,
		count(*) as podiums
from results r
join drivers d on r.driverId = d.driverId
where r.position between 1 and 3
group by d.driverId, d.forename, d.surname
order by podiums desc;