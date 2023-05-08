SELECT lis.neighbourhood, COUNT(DISTINCT(lis.id)) as num_propertie,
COUNT(cal.available) as num_of_occupancy,
COUNT(cal.available)/COUNT(DISTINCT(cal.listing_id)) as avg_occupation_propertie,
(COUNT(cal.available)/COUNT(DISTINCT(cal.listing_id))/365)*100 as occupancy_rate
FROM calendar as cal
JOIN listings as lis
ON cal.listing_id=lis.id
WHERE lis.neighbourhood IS NOT NULL
AND cal.price IS NOT NULL
AND lis.room_type = 'Entire home/apt'
GROUP BY lis.neighbourhood
ORDER BY occupancy_rate DESC
LIMIT 2000