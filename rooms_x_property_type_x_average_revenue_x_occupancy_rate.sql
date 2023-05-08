SELECT lis.neighbourhood, COUNT(DISTINCT(lis.id)) as num_propertie, lis.bedrooms,
AVG(cal.price) as avg_price, SUM(cal.price)/COUNT(DISTINCT(lis.id)) as avg_reveneue,
(COUNT(cal.available)/COUNT(DISTINCT(cal.listing_id))/365)*100 as occupancy_rate
FROM calendar as cal
JOIN listings as lis
ON cal.listing_id=lis.id
WHERE lis.neighbourhood IS NOT NULL
AND cal.price IS NOT NULL
AND lis.room_type = 'Entire home/apt'
AND lis.property_type = 'Condominium'
AND lis.neighbourhood = 'South Boston'
GROUP BY lis.neighbourhood, lis.bedrooms
ORDER BY occupancy_rate DESC
LIMIT 2000