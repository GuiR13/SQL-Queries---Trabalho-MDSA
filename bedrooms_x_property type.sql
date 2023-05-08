SELECT neighbourhood, bedrooms, property_type, COUNT(DISTINCT(listing_id)), 
SUM(price) as revenue,
SUM(price)/COUNT(DISTINCT(listing_id)) as avg_revenue_per_propertie,
AVG(price) as avg_price_per_night
FROM elementos_principais_boston_airbnb
WHERE property_type IS NOT NULL
AND bedrooms IS NOT NULL
AND bedrooms <= 4
AND property_type = 'House'
GROUP BY bedrooms, neighbourhood
ORDER BY revenue DESC