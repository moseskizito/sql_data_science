-- For all of the questions in this quiz, we are using the Chinook database. 

-- 1) What is Robert King's mailing address? 

SELECT Address
FROM Employees
WHERE LastName = 'King'
	AND FirstName = 'Robert';

-- 2) Which of the employees has a birthdate of 3-3-1965?

SELECT FirstName
FROM Employees
WHERE Birthdate LIKE '1965-03-03%';

-- 3) What is the runtime in milliseconds for the 5th track, entitled "Princess of the Dawn?" 

SELECT Milliseconds
FROM Tracks
WHERE TrackID = 5
	AND Name = 'Princess of the Dawn';