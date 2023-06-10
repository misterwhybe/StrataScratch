-- Run on https://platform.stratascratch.com/coding/10319-monthly-percentage-difference
SELECT Month,
ROUND((value - LAG(value) OVER (ORDER BY Month)) / LAG(value) OVER (ORDER BY Month) * 100,2) AS percentage
FROM
(SELECT TO_CHAR(date_trunc('Month', created_at), 'YYYY-MM') AS Month,
SUM(value) AS value
FROM sf_transactions
GROUP BY 1
ORDER BY 1) temp
