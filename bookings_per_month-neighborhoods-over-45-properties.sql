SELECT MONTH(date), COUNT(available)
FROM calendar210225123220_211118_224337
WHERE available = 't'
IN
(SELECT rec.neighbourhood, COUNT(DISTINCT(cal.listing_id)) as num_propertie
FROM receita_bairro_tudo rec
JOIN calendar210225123220_211118_224337 cal
ON rec.id = cal.listing_id)
GROUP BY  MONTH(date)
HAVING COUNT(DISTINCT(listing_id)) >= 45
ORDER BY MONTH(date)