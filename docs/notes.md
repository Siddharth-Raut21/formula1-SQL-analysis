# Schema & modelling notes

- Following are the primary keys: 
1) driverId
2) raceId
3) constructorId
4) circuitId
5) statusId
6) year
7) constructorStandingsId
8) driverStandingsId
9) resultId
10) constructorResultsId
11) qualifyId

- Junction tables: races, results, lap_times, pit_stops, sprint_results act as many-to-many linkers.