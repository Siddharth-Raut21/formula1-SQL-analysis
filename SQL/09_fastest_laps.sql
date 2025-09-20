-- Problem 09: Identify drivers who recorded the fastest lap most frequently.
/* Explanation: For the fastest lap, we choose the "results table", which stores fastest lap info.
				joined with drivers table to show names instead of IDs.
                results.rank = 1 indicates the fastest lap in that race.
                Use the rank window finction to indicate the rank of a driver’s fastest lap within a race.
                order the results by fastest lap in descending order.
*/
select 	d.driverId,
		d.forename,
		d.surname,
        count(res.fastestLap) as total_fastest_lap
from results res
join drivers d
 on res.driverId = d.driverId
where res.rank = 1
group by d.driverId, d.forename, d.surname
order by total_fastest_lap desc;