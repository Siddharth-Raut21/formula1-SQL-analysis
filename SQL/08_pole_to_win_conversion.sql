-- Problem 08: Show how often drivers who started in grid position 1 went on to win.
/* Explanation: We need to calculate how many times each driver started in grid position 1 and won that race also.
				So for that, we use a driverId from the drivers table. Also, their forename and surname.
				After that, we also retrieved the grid and position from the result table 
                by applying the condition where grid = 1 and position = 1.
                ordered results descending to get the top performers.
                
                
*/
select 	d.driverId,
		d.forename,
		d.surname,
        count(*) as total_winning_number
from results res
join drivers d
 on res.driverId = d.driverId
where res.grid = 1 and res.position = 1
group by d.driverId, d.forename, d.surname
order by total_winning_number desc;