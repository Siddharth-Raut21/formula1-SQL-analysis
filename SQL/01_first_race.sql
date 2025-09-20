-- Problem 01: Identify the very first race in the dataset, including its location and date.
/* Explanation: For the first race, we take date, year, and time columns from the races table.
				After that, we take the location and country of the first race from the circuits table.
                Then join both of them using circuitId key.
                To find the first race, we order by ascending order.
                And use limit = 1 to find the only first race. 
*/
select 
    r.date as race_date,
    r.year as season_year,
    r.time as race_time,
    c.name as circuit_name, 
    c.location as city, 
    c.country as host_country
from races r
join circuits c 
	on c.circuitId = r.circuitId
order by r.date asc, r.time asc
limit 1;