-- To prepare for the graded coding quiz, you will be asked to execute a query, 
-- read the results, and select the correct answer you found in the results. 

-- 1) Retrieve all the data from the tracks table. Who is the composer for track 18?

SELECT Composer
FROM Tracks
WHERE TrackID = 18;

-- 2) Retrieve all data from the artists table. Look at the list of artists?

SELECT DISTINCT Name
From Artists

-- 3) Retrieve all data from the invoices table. 
-- What is the billing address for customer 31 and how much do they owe?

SELECT BillingAddress
	,SUM(Total)
FROM Invoices
WHERE CustomerId = 31;

-- 4) Return the playlist id, and name from the playlists table. 
-- How many playlists are there? Which is your favorite?

SELECT SUM(PlaylistId)
FROM Playlists

SELECT PlaylistId
FROM Playlists
WHERE Name = 'Movies';

-- 5)  Return the Customer Id, Invoice Date, and Billing City from the Invoices table. 
-- What city is associated with Customer ID number 42? 
-- What was the invoice date for the customer in Santiago?

SELECT CustomerId
	,InvoiceDate
	,BillingCity
FROM Invoices
WHERE BillingCity = 'Santiago'
	OR CustomerId = 42;

-- 6) Return the First Name, Last Name, Email, and Phone, from the Customers table. 
-- What is the telephone number for Jennifer Peterson?

SELECT FirstName
	,LastName
	,Email
	,Phone
FROM Customers
WHERE FirstName = 'Jennifer'
	AND LastName = 'Peterson';

-- 7) Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. 
-- How much do all of these tracks cost?

SELECT TrackIf
	,GenreId
	,Composer
	,UnitPrice
FROM Tracks

SELECT SUM(UnitPrice)
From Tracks

-- 8) Select all the columns from the Playlist Track table and limit the results to 10 records. 

SELECT *
FROM Playlist_track LIMIT 10;

-- 9) Select all the columns from the Media Types table and limit the results to 50 records. 

Select *
From Media_types LIMIT 50;

-- 10) What is the name of the 9th album in this list?

SELECT Title
FROM Albums
WHERE AlbumId = 9;


















