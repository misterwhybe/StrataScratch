-- https://platform.stratascratch.com/coding/10046-top-5-states-with-5-star-businesses?code_type=1
SELECT state, n_businesses
FROM
(select  state, COUNT(stars) AS n_businesses,
RANK() OVER(ORDER BY 
        SUM(CASE WHEN stars = 5 THEN 1 ELSE 0 END) DESC)
from yelp_business
WHERE stars = 5
GROUP BY 1
ORDER BY 2 desc) temp
WHERE rank <= 5
;
