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


-- З співбесіди !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
SELECT *
FROM `ua-trends-468520.kaggle_data.Cats` 
LIMIT 1000

SELECT userid
      , version
      , COUNT(distinct version)
FROM `ua-trends-468520.kaggle_data.Cats`
GROUP BY 1,2 
LIMIT 1000

SELECT Distinct *
FROM `ua-trends-468520.kaggle_data.Cats`
LIMIT 1000

userid

SELECT userid 
    , COUNT(*)
FROM `ua-trends-468520.kaggle_data.Cats`
GROUP BY userid, version, sum_gamerounds, retention_1, retention_7
HAVING COUNT(*) >1
LIMIT 1000

SELECT userid
      , retention_1
      , retention_7
      , CASE
       WHEN CAST(retention_1 AS INT64) = 1 AND CAST(retention_7  AS INT64) = 1 THEN 'true'  
       WHEN CAST(retention_1 AS INT64) = 0 AND CAST(retention_7  AS INT64) = 0 THEN 'false'
       ELSE 'other'
       end AS full_retention
FROM `ua-trends-468520.kaggle_data.Cats`



SELECT 
  ROUND(SUM(CAST(retention_1 AS INT64))/1000, 2) AS total_retention_1, -- кол-во вернувшихся на 1 день
  ROUND(SUM(CAST(retention_7 AS INT64))/1000, 2) AS total_retention_7, -- кол-во вернувшихся на 7 день
  COUNT(*)/1000 AS total_users
FROM `ua-trends-468520.kaggle_data.Cats`;

-- Перероблено з CAST

WITH retention AS (
  SELECT 
    version,
    CAST(retention_1 AS INT64) AS ret_1,
    CAST(retention_7 AS INT64) AS ret_7
FROM `ua-trends-468520.kaggle_data.Cats`
)
SELECT 
  version,
  ROUND(SUM(ret_1) / COUNT(*) * 100, 2) AS retention_1,
  ROUND(SUM(ret_7) / COUNT(*) * 100, 2) AS retention_7
FROM retention
GROUP BY version;

-- Дівчина 


WITH retention AS (
  SELECT 
    version,
    IF(retention_1 = TRUE, 1, 0) AS ret_1,
    IF(retention_7 = TRUE, 1, 0) AS ret_7
FROM `ua-trends-468520.kaggle_data.Cats`
)
SELECT 
  version,
  ROUND(SUM(ret_1) / COUNT(ret_1) * 100, 2) AS retention_1,
  ROUND(SUM(ret_7) / COUNT(ret_7) * 100, 2) AS retention_7
FROM retention
GROUP BY version;

