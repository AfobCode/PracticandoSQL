/*
Consider P1(a,c) and P2(b,d) to be two points on a 2D plane where (a,b) 
are the respective minimum and maximum values of Northern Latitude (LAT_N) 
and (c,d) are the respective minimum and maximum values of Western Longitude 
(LONG_W) in STATION.

Query the Euclidean Distance between points P1 and P2 
and format your answer to display  decimal digits.

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

/*
Table 

Station
| id | city | state | lat_n | long_w |
*/

------------------------------------------------
-- Solution
SELECT ROUND(SQRT(POW(MAX(lat_n)-MIN(lat_n),2)+POW(MAX(long_w)-MIN(long_w),2)),4)
FROM station;