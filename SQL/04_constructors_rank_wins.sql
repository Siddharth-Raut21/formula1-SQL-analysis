-- Problem 04: Rank constructors by total number of wins.
/* Explnation: We use the result table to get the winning constructor.
				To find the total number of winnings for each constructor, we use the count aggregation function. 
                Apply the where clause for position = 1 for the winning.
                Use the group by clause for cunstructorId. 

*/
-- 1st approach
select 	constructorId,
		count(*) as total_wins,
        RANK() over (order by count(*) desc) as rank_position
from results
where position = 1
group by constructorId;

-- 2nd approach
select	c.name,
		count(*) as total_wins,
        rank() over (order by count(*) desc) as rank_position
from results r
join constructors c on r.constructorId = c.constructorId
where r.position=1
group by c.name;