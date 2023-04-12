/*
Harry Potter and his friends are at Ollivander's with Ron, 
finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining 
the minimum number of gold galleons needed to buy each 
non-evil wand of high power and age. Write a query to 
print the id, age, coins_needed, and power of the wands 
that Ron's interested in, sorted in order of descending power. 
If more than one wand has same power, sort the result in order of descending age.
*/

/*
Tablas
*********************
Wands
| id | code | coins_needed | power |

*********************
Wands_Property
| code | age | is_evil |
*/

/*
Sample Output

| id |age | c_n  | pw |
-----------------------
| 9  | 45 | 1647 | 10 |
| 12 | 17 | 9897 | 10 |
| 1  | 20 | 3688 | 8  |
| 15 | 40 | 6018 | 7  |
| 19 | 20 | 7651 | 6  |
| 11 | 40 | 7587 | 5  |
| 10 | 20 | 504  | 5  |
| 18 | 40 | 3312 | 3  |
| 20 | 17 | 5689 | 3  |
| 5  | 45 | 6020 | 2  |
| 14 | 40 | 5408 | 1  |
*/

-----------------------------------------------------------------------
-- Solution

-- 1) Join the tables wands_property and wands by code

/*
SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands as w
    JOIN Wands_Property as wp ON wp.code = w.code
*/

-- 2) filter the results by only non evil wands 

/*
SELECT w.id , wp.age, w.coins_needed , w.power
FROM Wands as w JOIN Wands_Property as wp
    ON w.code = wp.code
WHERE wp.is_evil = 0
ORDER BY w.power DESC, wp.age DESC, w.coins_needed;
*/

1038 496 4789 10 
1303 496 6678 10 
1130 494 9439 10 
1315 492 4126 10 
1434 494 683 9 
305 494 1050 9 
519 487 6652 9 
184 487 7228 9 
1852 496 1645 8 
982 496 5203 8 
427 496 5574 8 
246 494 828 8 
81 496 6908 7 
985 494 2401 7 
808 491 2129 7 
17 491 4231 7 
1432 492 4897 6 
321 491 1382 6 
1925 491 1724 6 
------------------------------------
1038 496 4789 10
1434 494 683 9
1852 496 1645 8 
81 496 6908 7 
1432 492 4897 6 

-- 3) Filter the Max age for each power level

SELECT MAX(wp.age), w.power
FROM Wands as w
    JOIN Wands_Property as wp
    ON w.code = wp.code
GROUP BY w.power
ORDER BY w.power DESC;