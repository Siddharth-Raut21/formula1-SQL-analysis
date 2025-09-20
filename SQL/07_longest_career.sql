-- Problem 07: Find the driver with the longest career span (first to last race).
/* Explnation: We need to find the one driver who has his longest career span. 
				It means that we need the biggest difference between his first race and last race.
                For each driver, calculate the gap between their first race year and their last race year.
                Career span = MAX(year) - MIN(year).
                So we need three tables. 
                - drivers for their info.
                - results (to know which drivers raced)
                - races (to get the year of those races)
                And join both of them using the receId.
                For each driver, compute MIN(races.year) and MAX(races.year).
                Then calculate the difference.
                Order by the difference descending.
                Pick the top 1.

*/
select 	d.driverId,
		d.forename,
		d.surname,
        min(r.year) as first_race,
        max(r.year) as last_race,
        (max(r.year) - min(r.year)) as career_span_years
from results res
join races r on res.raceId = r.raceId
join drivers d on res.driverId = d.driverId
group by d.driverId, d.forename, d.surname
order by career_span_years desc
limit 1;

select 
    d.driverId,
    d.forename,
    d.surname,
    min(r.year) as first_year,
    max(r.year) as last_year,
    (max(r.year) - min(r.year)) as career_span_years
from results res
join races r on res.raceId = r.raceId
join drivers d on res.driverId = d.driverId
group by d.driverId, d.forename, d.surname
order by career_span_years desc
limit 10;