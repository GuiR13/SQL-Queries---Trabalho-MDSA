SELECT lis.neighbourhood, COUNT(DISTINCT(lis.id)) as num_propertie,
SUM(cal.price) AS revenue,
AVG(cal.price) AS avg_price,
(COUNT(cal.available)/COUNT(DISTINCT(cal.listing_id))/365)*100 as occupancy_rate
FROM calendar as cal
JOIN listings as lis
ON cal.listing_id=lis.id
WHERE lis.neighbourhood IS NOT NULL
AND cal.price IS NOT NULL
AND lis.room_type = 'Entire home/apt'
GROUP BY lis.neighbourhood
ORDER BY revenue DESC
LIMIT 2000