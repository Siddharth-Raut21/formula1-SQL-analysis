-- Problem 02: Find how many unique circuits have hosted Formula 1 races.
/* Explanation: For "how many unique circuits" we use the count aggregation function and the distinct keyword. 
				And use the reces table. 
*/
select 	count(distinct r.circuitId) as unique_circuits
from races r;