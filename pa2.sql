-- All of the questions in this quiz refer to the open source Chinook Database. 

-- 1) Find all the tracks that have a length of 5,000,000 milliseconds or more.

SELECT COUNT(TrackId)
FROM Tracks
WHERE Milliseconds >= 5000000;

-- 2) Find all the invoices whose total is between $5 and $15 dollars.

SELECT InvoiceId
	,Total
FROM Invoices
WHERE Total BETWEEN 5
		AND 15;

-- 3) Find all the customers from the following States: RJ, DF, AB, BC, CA, WA, NY.

SELECT FirstName
	,LastName
	,Company
FROM Customers
WHERE STATE IN (
		'RJ'
		,'DF'
		,'AB'
		,'BC'
		,'CA'
		,'WA'
		,'NY'
		)
	AND FirstName = 'Jack'
	AND LastName = 'Smith';


-- 4) Find all the invoices for customer 56 and 58 where the total was between $1.00 and $5.00.

SELECT InvoiceDate
	,CustomerId
	,Total
	,InvoiceId
FROM Invoices
WHERE (
		CustomerId = 56
		OR 58
		)
	AND (
		Total BETWEEN 1
			AND 5
		)
	AND (InvoiceId = 315);

-- 5) Find all the tracks whose name starts with 'All'.

SELECT TrackId
	,Name
FROM Tracks
WHERE Name LIKE 'All%';

-- 6) Find all the customer emails that start with "J" and are from gmail.com.

SELECT Email
FROM Customers
WHERE Email LIKE 'J%gmail.com';

-- 7) Find all the invoices from the billing city Brasilia, Edmonton, and Vancouver 
-- and sort in descending order by invoice ID.

SELECT InvoiceId
	,BillingCity
	,Total
FROM Invoices
WHERE BillingCity IN (
		'Brasilia'
		,'Edmonton'
		,'Vancouver'
		)
ORDER BY InvoiceId;

-- 8) Show the number of orders placed by each customer 
-- and sort the result by the number of orders in descending order.

SELECT CustomerId
	,COUNT(InvoiceId) AS OrderCount
FROM Invoices
GROUP BY CustomerId
ORDER BY OrderCount;

-- 9) Find the albums with 12 or more tracks.
-- how many total records there are

SELECT AlbumId
	,COUNT(*) AS TrackCount
FROM Tracks
GROUP BY AlbumId
HAVING TrackCount >= 12;







