-- https://platform.stratascratch.com/coding/10300-premium-vs-freemium?code_type=1
WITH non_paying AS (select  mad.paying_customer, mdf.date, SUM(mdf.downloads) as downloads from ms_user_dimension mud
INNER JOIN ms_acc_dimension mad 
ON mad.acc_id = mud.acc_id
INNER JOIN ms_download_facts mdf
ON mud.user_id = mdf.user_id
WHERE mad.paying_customer = 'no'
GROUP BY 2, 1
ORDER BY 2),
paying as (select  mad.paying_customer, mdf.date, SUM(mdf.downloads) AS downloads from ms_user_dimension mud
INNER JOIN ms_acc_dimension mad 
ON mad.acc_id = mud.acc_id
INNER JOIN ms_download_facts mdf
ON mud.user_id = mdf.user_id
WHERE mad.paying_customer = 'yes'
GROUP BY 2, 1
ORDER BY 2)

SELECT *
FROM 
(SELECT p.date, p.downloads AS "paying downloads", np.downloads AS "non-paying downloads" from non_paying np
INNER JOIN paying p
ON np.date = p.date) temp
WHERE "non-paying downloads" > "paying downloads"
