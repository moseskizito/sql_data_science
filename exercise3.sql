-- All of the questions in this quiz pull from the open source Chinook Database. 


-- 1) How many albums does the artist Led Zeppelin have?

SELECT COUNT(AlbumId)
FROM Albums
INNER JOIN Artists ON Albums.ArtistId = Artists.ArtistId
WHERE Name = 'Led Zeppelin';

-- 2) Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT Title
	,UnitPrice
FROM Tracks
INNER JOIN (
	SELECT Title
		,AlbumId AS Id
	FROM Albums
	INNER JOIN Artists ON Albums.ArtistId = Artists.ArtistId
	WHERE Name = "Audioslave"
	) ON Tracks.AlbumId = Id;

-- 3) Find the first and last name of any customer who does not have an invoice. 

SELECT FirstName
	,LastName
	,COUNT(InvoiceId) AS c
FROM Customers c
LEFT JOIN Invoices i ON c.CustomerId = i.CustomerId
GROUP BY FirstName
	,LastName
HAVING c = 0;

-- 4) What is the total price for the album “Big Ones”?

SELECT UnitPrice
FROM Albums a
INNER JOIN Tracks t ON a.AlbumId = t.AlbumId
WHERE Title = 'Big Ones';

