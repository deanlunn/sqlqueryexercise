-- Comments in SQL Start with dash-dash --
SELECT * 
FROM analytics 
WHERE id = 1880;

SELECT id, app_name 
FROM analytics 
WHERE last_updated = '2018-08-01';

SELECT category, COUNT(*) 
FROM analytics 
GROUP BY category;

SELECT app_name, reviews 
FROM analytics 
ORDER BY reviews DESC LIMIT 5;

SELECT app_name, reviews 
FROM analytics 
WHERE rating >= 4.8 
ORDER BY reviews DESC LIMIT 1;

SELECT category, AVG(rating) AS avg_rating 
FROM analytics 
GROUP BY category 
ORDER BY avg_rating DESC;

SELECT app_name, price, rating 
FROM analytics 
WHERE rating < 3 
ORDER BY price DESC LIMIT 1;

SELECT * 
FROM analytics 
WHERE rating IS NOT NULL AND min_installs <= 50 ORDER BY rating DESC;

SELECT app_name
FROM analytics
WHERE rating < 3 AND reviews >= 10000;

SELECT app_name, reviews
FROM analytics
WHERE price >= 0.1 AND price <= 1
ORDER BY reviews DESC
LIMIT 10;

SELECT app_name, last_updated
FROM analytics
WHERE last_updated = (
    SELECT MIN(last_updated)
    FROM analytics
);

SELECT app_name, price
FROM analytics
WHERE price = (
    SELECT MAX(price)
    FROM analytics
);

SELECT SUM(reviews) AS total_reviews
FROM analytics;

SELECT category, COUNT(*) as app_count
FROM analytics
WHERE category IN (
    SELECT DISTINCT category
    FROM analytics
    GROUP BY category
    HAVING COUNT(*) > 300
)
GROUP BY category;

SELECT app_name, reviews, min_installs, min_installs/reviews as proportion
FROM analytics
WHERE min_installs >= 100000
ORDER BY proportion DESC
LIMIT 1;

SELECT category, app_name, rating
FROM (
    SELECT category, app_name, rating, ROW_NUMBER() OVER (PARTITION BY category ORDER BY rating DESC) as row_num
    FROM analytics
    WHERE min_installs >= 50000
) AS ranked
WHERE row_num = 1;

SELECT * 
FROM analytics
WHERE app_name LIKE '%facebook%';

SELECT *
FROM analytics
WHERE app_name LIKE '%face%' AND app_name LIKE '%book%';

SELECT *
FROM analytics
WHERE ',' = ANY (genres);

SELECT *
FROM analytics
WHERE 'Education' = ANY (genres);

