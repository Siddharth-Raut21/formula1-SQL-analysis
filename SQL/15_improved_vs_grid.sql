-- Problem 15: Show which drivers most often finished higher than their starting grid position.
/* Explanation: For drivers, I will use the "drivers table to take their driverId, forename, and surname".
				The drivers won the races at a winning position which is less than their starting grid position.
                "most often," I think it means that we need to count "how many times the drivers won races i.e., 
                winning position < starting grid position."
                
                So, we need two tables: drivers and results. 
                We need to join them by driverId. Use the count(). Apply condition as: where res.position < res.grid.

*/
select 	d.driverId,
		d.forename,
        d.surname,
        res.grid,
        res.position,
        count(res.position) as times_improved
from results res
join drivers d 
	on res.driverId = d.driverId
where res.position < res.grid
and   res.position > 0
group by d.driverId, d.forename, d.surname, res.grid, res.position
order by times_improved desc;