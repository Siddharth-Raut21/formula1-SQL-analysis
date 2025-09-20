-- Problem 11: For each season, determine which team had the quickest average pit stop.
/* Explanation: Here "team" means constructor.
				Pit stops are made for drivers, but the credit belongs to the constructor/team.
                
                Tables do we need are:
                - pit_stops → has raceId, driverId, duration (the actual pit stop time).
                - results → links each driverId + raceId to their constructorId.
                - races → gives us the year for each race.
                - constructors → gives us the team name.
                
                For each season (year) and team (constructor):
                Compute AVG(pit_stops.duration).
                Then for each season, find the team with the minimum average duration.
                
				For this problem also we use CTE.
                Here we use window function row number() to pick the fastest per year.
                
*/
with team_pit_avg as (

select 	
		r.year,
        c.name as constructor_name,
		avg(ps.duration) as avg_pit_duration
from pit_stops ps
join results res on ps.raceId = res.raceId and ps.driverId = res.driverId
join races r on ps.raceId = r.raceId
join constructors c on res.constructorId = c.constructorId
group by r.year, c.name
),

ranked as (

select 	*,
		row_number () over (partition by year order by avg_pit_duration asc) as rn
        from team_pit_avg
)

select year, constructor_name, avg_pit_duration
from ranked
where rn = 1
order by year;