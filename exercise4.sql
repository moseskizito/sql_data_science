-- All of the questions in this quiz refer to the open source Chinook Database. 

-- 1) Pull a list of customer ids with the customer’s full name, and address, 
-- along with combining their city and country together. 
-- Be sure to make a space in between these two and make it UPPER CASE.
-- What is the city and country result for CustomerID 16?

SELECT CustomerId
	,FirstName
	,LastName
	,Address
	,UPPER(City || ' ' || Country)
FROM Customers
WHERE CustomerId = 16;

-- 2) Create a new employee user id by combining the first 4 letter of 
-- the employee’s first name with the first 2 letters of the employee’s last name. 
-- Make the new field lower case and pull each individual step to show your work.
-- What is the final result for Robert King?

SELECT LOWER(SUBSTR(FirstName, 1, 4) || SUBSTR(LastName, 1, 2)) AS NewId
FROM employees
WHERE FirstName = 'Robert'
	AND LastName = 'King';


-- 3) Show a list of employees who have worked for the company for 15 or more years 
-- using the current date function. Sort by lastname ascending.

SELECT FirstName || ' ' || LastName AS Name
	,DATE ('now') - DATE (HireDate) AS Year
FROM employees
WHERE Year >= 15
ORDER BY LastName;

-- 4) Are there any columns with null values?

SELECT *
FROM Customers 
WHERE [some_column] is NULL;

-- 5) Find the cities with the most customers and rank in descending order.
-- Which cities indicate having 2 customers?

SELECT City
	,COUNT(*) AS C
FROM Customers
GROUP BY City
HAVING C = 2
ORDER BY City DESC;

-- 6) Create a new customer invoice id by combining a customer’s invoice id with 
-- their first and last name while ordering your query in the following order: 
-- firstname, lastname, and invoiceID. 
-- Select all of the correct "AstridGruber" entries that are returned in your results below. 

SELECT InvoiceId || FirstName || LastName AS NewId
FROM Invoices i
INNER JOIN Customers c ON i.CustomerId = c.CustomerId
WHERE FirstName = 'Astrid'
	AND LastName = 'Gruber'
ORDER BY FirstName
	,LastName
	,InvoiceId;
















