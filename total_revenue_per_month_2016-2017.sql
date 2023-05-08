SELECT month, SUM(price) as revenue
FROM elementos_principais_boston_airbnb
GROUP BY month
ORDER BY month