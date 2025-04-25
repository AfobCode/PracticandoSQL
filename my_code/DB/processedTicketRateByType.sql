-- Find the processed rate of tickets for each type. 
-- The processed rate is defined as the number of processed tickets divided by the total number of tickets for that type. Round this result to two decimal places.

With process_sum AS (
    SELECT type, SUM(processed) times, COUNT(*) total
    FROM facebook_complaints
    GROUP BY type)
SELECT type, ROUND((times/total),2) as processed_rate
FROM process_sum