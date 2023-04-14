/*
A median is defined as a number separating the higher half 
of a data set from the lower half. 
Query the median of the Northern Latitudes (LAT_N)
from STATION and round your answer to  decimal places.

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/

/*
Table 

Station
| id | city | state | lat_n | long_w |
*/

------------------------------------------------
-- Solution

-- 1) Count how many row has the dataset

SELECT COUNT(lat_n)
FROM station;

-- => 499 rows
-- row 249: 83.4995
-- row 250: 83.8913
-- row 251: 83.9212

-- 2) Order the latitudes 

SELECT lat_n
FROM station
ORDER BY lat_n;


SELECT lat_n
FROM station
ORDER BY lat_n
OFFSET 10 ROWS
FETCH NEXT 2 ROWS ONLY;