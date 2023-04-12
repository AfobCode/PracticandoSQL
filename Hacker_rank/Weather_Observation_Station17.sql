
/*
Query the Western Longitude (LONG_W)where the smallest Northern Latitude (LAT_N) 
in STATION is greater than 38.7780. Round your answer to  decimal places.

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

/*
Table 

Station
| id | city | state | lat_n | long_w |
*/

SELECT round(long_w, 4)
FROM station
WHERE lat_n = (SELECT MIN(lat_n) FROM station WHERE lat_n > 38.7780)

