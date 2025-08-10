 -- Найди 5 самых длинных треков (по длительности в миллисекундах).
SELECT 
	t.TrackId 
	, t.Name 
	, t.Milliseconds
	, (t.Milliseconds / 1000) / 3600 AS HoursDecimal
	,printf(
	'%02d:%02d:%02d'
	, t.Milliseconds / 1000 /3600
	, (t.Milliseconds / 1000 % 3600) / 60
	, (t.Milliseconds / 1000 % 60) 
	)
	AS FormattedTime
FROM track t
GROUP BY 1,2
ORDER BY t.Milliseconds DESC
LIMIT 5;



-- Вивести рейтинг «ТОП-25 запитів своєї області» за останній тиждень з таблиці international_top_terms.

SELECT term
      , MAX(refresh_date) 
FROM `bigquery-public-data.google_trends.international_top_terms` 
WHERE country_name = "Ukraine"
AND region_name = "Poltavs'ka oblast"
AND refresh_date >= DATE_SUB(CURRENT_DATE(), INTERVAL 7 DAY)
group by 1
LIMIT 25

-- //////////////////////////////////////////////////////////////////////////////////////////////////////
SELECT 
	total AS Count
	, COUNT(*) AS count_total
	, 'Invoice total' AS total
FROM Invoice i 
GROUP BY 1
	
UNION

SELECT 
	unitprice AS Count
	, COUNT(*) AS count_prise
	, 'Track unitprice' AS unitprice
FROM Track t  
GROUP BY 1
