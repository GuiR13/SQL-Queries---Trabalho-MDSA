SELECT lis.neighbourhood,COUNT(DISTINCT(lis.id)) AS number_properties,
SUM(cal.price) AS revenue, SUM(cal.price)/COUNT(DISTINCT(lis.id)) as avg_revenue_propertie,
AVG(cal.price) AS avg_price
FROM listings lis
JOIN calendar cal
ON lis.id=cal.listing_id
WHERE lis.neighbourhood IS NOT NULL
AND cal.price IS NOT NULL
AND lis.room_type = 'Entire home/apt'
GROUP BY lis.neighbourhood
ORDER BY revenue DESC
