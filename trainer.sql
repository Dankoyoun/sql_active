
SELECT *
FROM Track t 

SELECT *
FROM Album a 


SELECT 
	Trackid
	, t.name
	, t.Milliseconds/1000/60 AS Min
	, t.Milliseconds/1000 % 60 AS Sek
	, t.Milliseconds % 1000 AS Mil
FROM Track t

SELECT 
	a.title
	, t.Name 
FROM Album a 
LEFT JOIN Track t ON a.AlbumId = t.AlbumId
WHERE t.albumid = 5


--Найти 10 самых длинных треков (по длительности).

SELECT 
	Trackid
	, t.Name 
	, max(t.Milliseconds)/1000/60 AS max_time_min
	, t.Milliseconds/ 1000 % 60 AS max_time_sek
	, t.Milliseconds % 1000  AS max_time_mil
FROM Track t  
GROUP BY 1,2
ORDER BY 3 dESC
LIMIT 10 

--Посчитать, сколько альбомов у каждого исполнителя.
SELECT
	ArtistId
	, Title 
	, COUNT(AlbumId) AS count_alb 
FROM Album
GROUP BY 1
ORDER BY 3 DESC

  --Найти альбомы, в названии которых встречается слово "Live".

SELECT
	albumid
	, title
FROM Album a 
WHERE title like "%Live%"

--Посчитать общее количество треков для каждого исполнителя.

SELECT 
	a.ArtistId 
	, a.name
	, COUNT(tr.TrackId) AS total_tracks
FROM Artist a
LEFT JOIN Album al ON al.ArtistId  = a.ArtistId 
LEFT JOIN Track tr ON al.AlbumId = tr.AlbumId
GROUP BY 1,2
ORDER BY 3 DESC







SELECT 
    ar.artistid,
    ar.name AS artist_name,
    COUNT(t.trackid) AS total_tracks
FROM artist ar
JOIN album al ON ar.artistid = al.artistid
JOIN track t ON al.albumid = t.albumid
GROUP BY ar.artistid, ar.name
ORDER BY total_tracks DESC;


--Вывести среднюю длительность треков в каждом альбоме.

SELECT 
	al.AlbumId 
	, al.Title 
	, ROUND(AVG(t.Milliseconds), 0) AS AVG_TIME
FROM Track t  
JOIN album al ON al.AlbumId  = t.AlbumId 
GROUP BY 1,2
ORDER  BY AVG_TIME DESC

--Показать треки с длительностью более 4 минут.

SELECT 
	Name
	, Composer 
	, Milliseconds/1000 /60 as TIME_MIN
	, ROW_NUMBER() OVER(PARTITION BY Milliseconds/1000 /60  ORDER BY Composer  ) AS RANK_NUMBER
	, RANK() OVER(PARTITION BY Milliseconds/1000 /60 ORDER BY Composer  ) AS RANK
	, DENSE_RANK() OVER(PARTITION BY Milliseconds/1000 /60 ORDER BY Composer )  AS DENSE_RANK
FROM TRACK
WHERE Composer IS NOT NULL
AND Milliseconds/1000 /60 > 0

--Найти исполнителя с максимальным количеством альбомов.

SELECT al.AlbumId
	,a.Name
	, Count(al.AlbumId)
FROM Artist a 
LEFT JOIN Album al ON al.ArtistId = a.ArtistId
GROUP BY 2
ORDER BY 3 DESC

--Вывести список исполнителей и количество треков, отсортировать по количеству треков по убыванию.

SELECT 
	a.Name 
	, COUNT(t.trackid) AS COUNT_TRACK
FROM Artist a 
LEFT JOIN Album al ON a.ArtistId = al.ArtistId
LEFT JOIN Track t  ON t.AlbumId = al.AlbumId 
GROUP BY 1
ORDER BY 2 DESC
	
