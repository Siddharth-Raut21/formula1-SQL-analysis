# Schema & SQL style guide

- Use clear aliases: r for races, res for results, d for drivers.
- Write a brief comment header for each SQL file (Problem statement, Explanation).
- Use `CONCAT(forename, ' ', surname)` for driver display in MySQL.
- Prefer explicit GROUP BY columns rather than SELECTing non-aggregated columns.
