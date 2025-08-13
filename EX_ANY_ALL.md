- Вывести имена артистов у которых в альбоме есть слово 'Rock'

SELECT   
    Name  
FROM Artist a  
WHERE EXISTS (  
    SELECT 1  
    FROM Album al  
    WHERE al.ArtistId = a.ArtistId  
    AND al.Title LIKE "%Rock%"  
);  

- Задача: Найти треки, цена которых выше хотя бы одной цены треков из альбома "Let There Be Rock".  

SELECT Name, UnitPrice  
FROM Track  
WHERE UnitPrice > ANY (  
    SELECT UnitPrice  
    FROM Track  
    JOIN Album ON Track.AlbumId = Album.AlbumId  
    WHERE Album.Title = 'Let There Be Rock'  
)  
ORDER BY UnitPrice DESC;  

- Задача: Найти треки, цена которых выше всех цен треков из альбома "Let There Be Rock".  

SELECT Name, UnitPrice  
FROM Track  
WHERE UnitPrice > ALL (  
    SELECT UnitPrice  
    FROM Track  
    JOIN Album ON Track.AlbumId = Album.AlbumId  
    WHERE Album.Title = 'Let There Be Rock'  
)  
ORDER BY UnitPrice DESC;  
