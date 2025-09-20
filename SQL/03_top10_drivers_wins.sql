-- Problem 03: List the top 10 drivers with the most race victories.
/* Explnation: In Formula 1 races victory means the position of driver = 1.
				So here we use the results table for position = 1. 
                To retrieve the information of drivers, we use drivers table.
                Join the both tables by driverId.
                Apply the condition for position = 1 using where clause.
                Group by using driver information  
                For top 10 drivers, order it by ascending order.
                And apply the limit = 10. 

*/
select 	
		d.driverId,
        d.forename,
        d.surname,
        count(*) as total_win
from results r
join drivers d
	on r.driverId = d.driverId
where r.position = 1
group by d.driverId, d.forename, d.surname
order by total_win asc
limit 10;