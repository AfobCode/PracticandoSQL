/*
Julia just finished conducting a coding contest, 
and she needs your help assembling the leaderboard! 
Write a query to print the respective hacker_id 
and name of hackers who achieved full scores 
for more than one challenge. Order your output in 
descending order by the total number of challenges 
in which the hacker earned a full score. If more 
than one hacker received full scores in same number of challenges, 
then sort them by ascending hacker_id.
*/

/*
Tablas:
*********************
Hackers:
| Hacker_id | name |
*********************

Difficulty:
| difficulty_level | score |

*********************
Challenges:
| challange_id | Hacker_id | difficulty_level |

*********************
Submissions:
| submissions_id | Hacker_id | challange_id | score |
*/

-----------------------------------------------------------------------
-- Solution

-- 1) Join submissions with Challenges by challenge_id, join submission and Difficulty by difficulty_level
/*
SELECT subs.hacker_id, hck.name, ch.challenge_id, dft.score ,subs.score
FROM Submissions as subs
    JOIN Hackers as hck ON subs.hacker_id = hck.hacker_id
    JOIN Challenges as ch ON subs.challenge_id = ch.challenge_id
    JOIN Difficulty as dft ON ch.difficulty_level = dft.difficulty_level;
*/


-- 2) Filter the table by Fullscore, 
--      submissions score equal to difficulty score
/*
SELECT subs.hacker_id, hck.name, ch.challenge_id, dft.score ,subs.score
FROM Submissions as subs
    JOIN Hackers as hck ON subs.hacker_id = hck.hacker_id
    JOIN Challenges as ch ON subs.challenge_id = ch.challenge_id
    JOIN Difficulty as dft ON ch.difficulty_level = dft.difficulty_level
WHERE subs.score = dft.score
ORDER BY subs.hacker_id;
*/


-- 3) Group by hacker_id and count how many hackers had fullscore in more than one challenge
/*
SELECT subs.hacker_id, COUNT(subs.hacker_id) as fullscore
FROM Submissions as subs
    JOIN Challenges as ch ON subs.challenge_id = ch.challenge_id
    JOIN Difficulty as dft ON ch.difficulty_level = dft.difficulty_level
WHERE subs.score = dft.score
GROUP BY subs.hacker_id
HAVING COUNT(subs.hacker_id) > 1
ORDER BY fullscore DESC, subs.hacker_id;
*/

-- Final) use the previous query as a table to Join the Hackers table and filter it by the number of 
--      challenges that reached a fullscore, then order it by hacker_id

SELECT flt.hacker_id, hck.name
FROM (SELECT subs.hacker_id as hacker_id, COUNT(subs.hacker_id) as fullscore
    FROM Submissions as subs
        JOIN Challenges as ch ON subs.challenge_id = ch.challenge_id
        JOIN Difficulty as dft ON ch.difficulty_level = dft.difficulty_level
    WHERE subs.score = dft.score
    GROUP BY subs.hacker_id
    HAVING COUNT(subs.hacker_id) > 1) as flt
    JOIN Hackers as hck ON flt.hacker_id = hck.hacker_id
ORDER BY flt.fullscore DESC, flt.hacker_id;