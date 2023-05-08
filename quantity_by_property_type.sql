SELECT neighbourhood, COUNT(DISTINCT(id))
FROM receita_bairro_tudo
GROUP BY neighbourhood
ORDER BY COUNT(DISTINCT(id)) DESC