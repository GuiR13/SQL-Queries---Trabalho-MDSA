SELECT neighbourhood, COUNT(DISTINCT(listing_id)) as num_properties,
SUM(price) as revenue, AVG(price) as avg_price_pe_night
FROM elementos_principais_boston_airbnb
GROUP BY neighbourhood
ORDER BY revenue DESC