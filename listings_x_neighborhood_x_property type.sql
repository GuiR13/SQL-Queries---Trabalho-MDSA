SELECT neighbourhood, property_type, COUNT(DISTINCT(listing_id)), SUM(price) as revenue,
SUM(price)/COUNT(DISTINCT(listing_id)) as avg_revenue, AVG(price)
FROM elementos_principais_boston_airbnb
WHERE property_type IS NOT NULL
AND bedrooms <= 4
AND property_type = 'House'
GROUP BY neighbourhood
ORDER BY COUNT(DISTINCT(listing_id)) DESC