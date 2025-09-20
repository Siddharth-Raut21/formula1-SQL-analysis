-- Problem 10: Find seasons where the championship-winning driver was not from the championship-winning constructor.
/* Explanation: The driver champion is the driver in driver_standings with position = 1 at the final race of the season.
				The constructor champion is the constructor in constructor_standings with position = 1 at the final race of the season.
				So, For each season:
				- Find the driver champion → his/her constructorId.
				- Find the constructor champion.
                So, for this we use CTE
                
                At first, we oconstructorStandingsIdnly fond the final races
                Then we find the championship-winning driver using races, results, drivers, driver_standings tables.
                Apply the condition as position = 1.
                
                After this, we find the championship-winning constructor using races, constructors, constructor_standings tables.
                Apply the condition as position = 1.
                
                At last compare the both campions (driver & constructor champion) using the following condition:
                where d.driver_constructorId <> cc.constructorId
*/
with final_races as (
    -- Find the last race (highest round) for each year
    select year, max(round) as final_round
    from races
    group by year
),

driver_champ as (
    -- Get the driver champion from the final race standings
    select 
        r.year,
        d.driverId,
        d.forename,
        d.surname,
        res.constructorId as driver_constructorId
    from driver_standings ds
    join races r on ds.raceId = r.raceId
    join drivers d on ds.driverId = d.driverId
    join results res on res.raceId = r.raceId and res.driverId = d.driverId
    join final_races fr on r.year = fr.year and r.round = fr.final_round
    where ds.position = 1
),

constructor_champ as (
    -- Get the constructor champion from the final race standings
    select 
        r.year,
        c.constructorId,
        c.name as constructor_name
    from constructor_standings cs
    join races r on cs.raceId = r.raceId
    join constructors c on cs.constructorId = c.constructorId
    join final_races fr on r.year = fr.year and r.round = fr.final_round
    where cs.position = 1
)

-- Compare them
select 
    d.year,
    d.forename || ' ' || d.surname as driver_champion,
    d.driver_constructorId as driver_teamId,
    cc.constructor_name as constructor_champion
from driver_champ d
join constructor_champ cc on d.year = cc.year
where d.driver_constructorId <> cc.constructorId
order by d.year;