-- Problem 14: For each season, list the top 3 drivers with the most points.
/* Explanation: To select each season means year, I have used the "races table".
				To retrieve the driver's information. I have also used the "drivers table".
                To calculate points , I have use the "results table".
				
                So, for top 3 drivers for each season, we need to:
                - Sum points per driver per season.
                - Rank them within each season.
                - Keep only top 3 for each season.
                
                So, we use CTE.
                - at first, retrive only driver info. with their points.
                - rank them by using the calculated points.
                
                For top 3 drier apply the filter using where clause.
*/
with season_points as (

select 	r.year,
		d.driverId,
		d.forename,
        d.surname,
        sum(res.points) as total_points
from results res
join races r on res.raceId = r.raceId
join drivers d on res.driverId = d.driverId
group by r.year, d.driverId, d.forename, d.surname
),

ranked as (

select 	*,
		row_number() over (partition by year order by total_points desc) as rn
from season_points
)

select year, driverId, forename, surname, total_points
from ranked 
where rn <=3
order by year, total_points desc;