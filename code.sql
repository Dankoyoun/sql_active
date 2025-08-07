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
