/*
Query the smallest Northern Latitude (LAT_N) from STATION that is greater than 38.7780. 
Round your answer to  decimal places.

The STATION table is described as follows:
where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

/*
Table 

Station
| id | city | state | lat_n | long_w |
*/

-- 1) Build a query to retrieve stations where the Lat_n is greater than 38.7780
SELECT id, city, state, lat_n, long_n
FROM station
WHERE lat_n > 38.7780;


-- 2) retrieve the minumum value for lat_n and round it to 4 decimals.

SELECT ROUND(MIN(lat_n),4)
FROM station
WHERE lat_n > 38.7780;
