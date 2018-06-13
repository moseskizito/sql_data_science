-- All of the questions in this quiz refer to the open source Chinook Database.

-- 1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name
FROM Tracks t
WHERE t.AlbumId IN (
		SELECT AlbumId
		FROM Albums a
		WHERE a.title = "Californication"
		);

-- 2) Find the total number of invoices for each customer 
-- along with the customer's full name, city and email.
-- what is the email address of the 5th person, František Wichterlová? 

SELECT FirstName
	,LastName
	,City
	,Email
	,COUNT(InvoiceId)
FROM Customers c
INNER JOIN Invoices i ON c.CustomerId = i.CustomerId
WHERE FirstName = 'František'
	AND LastName = 'Wichterlová'
GROUP BY FirstName
	,LastName
	,City
	,Email;

-- 3) Retrieve the track name, album, artist, and trackID for all the albums.

SELECT t.Name
	,Title
	,artist
	,TrackId
FROM Tracks t
INNER JOIN (
	SELECT Title
		,ar.Name AS artist
		,al.AlbumId AS Id
	FROM Albums al
	INNER JOIN Artists ar ON al.ArtistId = ar.ArtistId
	) ON t.AlbumId = Id

-- 4) Retrieve a list with the managers last name, 
-- and the last name of the employees who report to him or her.

SELECT e.LastName
FROM Employees m
INNER JOIN Employees e ON m.EmployeeId = e.ReportsTo
WHERE m.LastName = 'Mitchell';

-- 5) Find the name and ID of the artists who do not have albums.

SELECT ar.ArtistId
	,ar.Name
FROM Artists ar
LEFT JOIN Albums al ON ar.ArtistId = al.ArtistId
WHERE al.ArtistID IS NULL
GROUP BY ar.ArtistId
	,ar.Name;


-- 6) Use a UNION to create a list of all the employee's and customer's first names 
-- and last names ordered by the last name in descending order.

SELECT FirstName
	,LastName
FROM Employees

UNION

SELECT FirstName
	,LastName
FROM Customers
ORDER BY LastName DESC;

-- 7) See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT c.FirstName
	,c.LastName
	,City
	,BillingCity
FROM Customers c
INNER JOIN Invoices i ON c.CustomerID = i.CustomerId
WHERE City = BillingCity;








