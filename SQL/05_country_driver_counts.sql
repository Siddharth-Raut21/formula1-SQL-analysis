-- Problem 05: Which countries have produced the most drivers who raced at least once?
/* Explanation: Start from drivers table because that has the driver nationality.
				Join with results to make sure you only count drivers who actually raced.
                Group by nationality to see contributions per country.
                Count distinct driver IDs (so each driver is counted once even if they raced many times).

*/
select 	d.nationality as country,
		count(distinct d.driverId) as total_drivers
from drivers d
join results r
	on d.driverId = r.driverId
where d.nationality is not null
group by d.nationality
order by total_drivers desc;