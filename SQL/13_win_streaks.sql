-- Problem 13: Find drivers who managed to win at least 3 races in a row.
/* Explanation: 3 won races in a row means, back-to-back 3 wins not laps.
				So, we use the results table & use the condition as "where position = 1" for winning.
                
				So, we use the CTE.
                
                At first, retrive the driver data who won the races using the drivers, races, and results table.
                
				Then calculate the streaks as winning races in a row.

*/
with driver_wins as (
    select 
        d.driverId,
        d.forename,
        d.surname,
        r.year,
        r.round,
        r.date,
        res.raceId
    from results res
    join races r on res.raceId = r.raceId
    join drivers d on res.driverId = d.driverId
    where res.position = 1
),
streaks as (
    select *,
           (cast(row_number() over (partition by driverId order by year, round) as signed) - round) as streak_group
    from driver_wins
)
select driverId, forename, surname, count(*) as streak_length
from streaks
group by driverId, forename, surname, streak_group
having count(*) < 4
order by streak_length desc;