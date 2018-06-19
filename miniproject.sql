By: Weiwei Zheng
Date: June-13th-2018

-- Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

-- This is a 2-part assignment. In the first part, you are asked a series of questions that 
-- will help you profile and understand the data just like a data scientist would. For this 
-- first part of the assignment, you will be assessed both on the correctness of your 
-- findings, as well as the code you used to arrive at your answer. You will be graded on 
-- how easy your code is to read, so remember to use proper formatting and comments where 
-- necessary.

-- In the second part of the assignment, you are asked to come up with your own inferences 
-- and analysis of the data for a particular research question you want to answer. You will be 
-- required to prepare the dataset for the analysis you choose to do. As with the first part, 
-- you will be graded, in part, on how easy your code is to read, so use proper formatting 
-- and comments to illustrate and communicate your intent as required.

-- For both parts of this assignment, use this "worksheet." It provides all the questions 
-- you are being asked, and your job will be to transfer your answers and SQL coding where
-- indicated into this worksheet so that your peers can review your work. You should be able 
-- to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) 
-- to copy and paste your answers. If you are going to use Word or some other page layout
-- application, just be careful to make sure your answers and code are lined appropriately.
-- In this case, you may want to save as a PDF to ensure your formatting remains intact
-- for you reviewer.



-- Part 1: Yelp Dataset Profiling and Understanding

-- 1. Profile the data by finding the total number of records for each of the tables below:
		
	SELECT COUNT(*)
	FROM user;	
	
	-- i. 		Attribute table = 1310575
	-- ii. 	Business table = 174567
	-- iii. 	Category table = 667527
	-- iv. 	Checkin table = 3911218
	-- v. 		elite_years table = 187125
	-- vi. 	friend table = 49626957 
	-- vii. 	hours table = 824595
	-- viii. 	photo table = 206949
	-- ix. 	review table = 5261669
	-- x. 		tip table = 1098325
	-- xi. 	user table = 1326101
	


-- 2. Find the total number of distinct records for each of the keys listed below:

	SELECT COUNT(DISTINCT col)
	FROM business;

	-- i. 		Business = id: 174567
	-- ii. 	Hours = business_id: 129260
	-- iii. 	Category = business_id: 174067
	-- iv. 	Attribute = business_id:  152041
	-- v. 		Review = id:5261669, business_id: 174567, user_id: 1326101
	-- vi. 	Checkin = business_id: 146350
	-- vii. 	Photo = id: 206949, business_id: 29097 
	-- viii. 	Tip = user_id: 271680, business_id: 112366 
	-- ix. 	User = id: 1326101
	-- x. 		Friend = user_id: 760008
	-- xi. 	Elite_years = user_id: 60818
	


-- 3. Are there any columns with null values in the Users table? Indicate "yes," or "no."

-- 	Answer: "no"

	SELECT COUNT(*)
	FROM user
	WHERE id IS NULL
		OR name IS NULL
		OR review_count IS NULL
		OR yelping_since IS NULL
		OR useful IS NULL
		OR funny IS NULL
		OR cool IS NULL
		OR fans IS NULL
		OR average_stars IS NULL
		OR compliment_hot IS NULL
		OR compliment_more IS NULL
		OR compliment_profile IS NULL
		OR compliment_cute IS NULL
		OR compliment_list IS NULL
		OR compliment_note IS NULL
		OR compliment_plain IS NULL
		OR compliment_cool IS NULL
		OR compliment_funny IS NULL
		OR compliment_writer IS NULL
		OR compliment_photos IS NULL;
		
	
	

	
-- 4. Find the minimum, maximum, and average value for the following fields:

	SELECT MIN(field)
		,MAX(field)
		,AVG(field)
	FROM TABLE;
	

-- 	i. Table: Review, Column: Stars
	
-- 		min: 1		max: 5		avg: 3.7277
		
	
-- 	ii. Table: Business, Column: Stars
	
-- 		min: 1 		max: 5		avg: 3.6321956612647295
		
	
-- 	iii. Table: Tip, Column: Likes
	
-- 		min: 0		max: 15		avg: 0.0166
		
	
-- 	iv. Table: Checkin, Column: Count
	
-- 		min: 1		max: 1478		avg: 4.2566
		
	
-- 	v. Table: User, Column: Review_count
	
-- 		min: 0		max: 11954		avg: 23.1172
		


-- 5. List the cities with the most reviews in descending order:

	SELECT city
		,SUM(review_count) AS r_count
	FROM business b
	INNER JOIN review r ON b.id = r.business_id
	GROUP BY city
	ORDER BY count DESC LIMIT 100;

-- answer: Las Vegas

	
-- 6. Find the distribution of star ratings to the business in the following cities:

	SELECT stars
		,COUNT(stars) AS star_c
	FROM business
	WHERE city = 'Beachwood'
	GROUP BY stars
	ORDER BY stars ASC;	

	-- i. Avon	
		
	-- 	Copy and Paste the Resulting Table Below (2 columns - star rating and count):
	
	-- 		+-------+--------+
	-- 		| stars | star_c |
	-- 		+-------+--------+
	-- 		|     1 |      3 |
	-- 		|   1.5 |      4 |
	-- 		|     2 |     10 |
	-- 		|   2.5 |     15 |
	-- 		|     3 |     33 |
	-- 		|   3.5 |     40 |
	-- 		|     4 |     34 |
	-- 		|   4.5 |     30 |
	-- 		|     5 |     31 |
	-- 		+-------+--------+
				
	
	-- ii. Beachwood
		
	-- 	Copy and Paste the Resulting Table Below (2 columns - star rating and count):
		
	-- 		+-------+--------+
	-- 		| stars | star_c |
	-- 		+-------+--------+
	-- 		|     1 |      7 |
	-- 		|   1.5 |      6 |
	-- 		|     2 |     24 |
	-- 		|   2.5 |     28 |
	-- 		|     3 |     39 |
	-- 		|   3.5 |     57 |
	-- 		|     4 |     36 |
	-- 		|   4.5 |     24 |
	-- 		|     5 |     44 |
	-- 		+-------+--------+
		

-- 7. Find the top 3 users based on their total number of reviews:
		
	SELECT name
		,review_count
	FROM user
	ORDER BY review_count DESC LIMIT 3;
	
	
	-- +--------+--------------+
	-- | name   | review_count |
	-- +--------+--------------+
	-- | Victor |        11954 |
	-- | Shila  |        11323 |
	-- | Kim    |         9788 |
	-- +--------+--------------+


-- 8. Does posing more reviews correlate with more fans? 

-- 	Please explain your findings and interpretation of the results:

	SELECT review_count
		,fans
	FROM user
	ORDER BY review_count DESC LIMIT 30;
	
	-- Through eyeballing the tables, there might be some positive correlation 
	-- between these two variables it is not obvious to tell.
		
	-- 		+--------------+------+
	-- 		| review_count | fans |
	-- 		+--------------+------+
	-- 		|        11954 |  943 |
	-- 		|        11323 |  214 |
	-- 		|         9788 |  680 |
	-- 		|         8353 |  417 |
	-- 		|         7764 |  272 |
	-- 		|         6653 |  237 |
	-- 		|         6314 |  607 |
	-- 		|         5868 |  610 |
	-- 		|         5344 |  397 |
	-- 		|         4634 |  401 |
	-- 		|         4559 |  180 |
	-- 		|         4537 |  871 |
	-- 		|         4338 |  349 |
	-- 		|         4063 |  746 |
	-- 		|         4051 |  680 |
	-- 		|         4023 | 1232 |
	-- 		|         4019 |  343 |
	-- 		|         3957 |  439 |
	-- 		|         3952 |  477 |
	-- 		|         3906 |  155 |
	-- 		|         3903 |  340 |
	-- 		|         3855 | 1572 |
	-- 		|         3734 |  493 |
	-- 		|         3711 |  209 |
	-- 		|         3644 |  151 |
	-- 		|         3528 |  493 |
	-- 		|         3477 |  258 |
	-- 		|         3468 |  215 |
	-- 		|         3275 |  313 |
	-- 		|         3268 |  352 |
	-- 		+--------------+------+
	

	
-- 9. Are there more reviews with the word "love" or with the word "hate" in them?

-- 	Answer: love has 957428, while hate only has 131187  

	SELECT COUNT(*)
	FROM review
	WHERE text LIKE '%love%';	

	SELECT COUNT(*)
	FROM review
	WHERE text LIKE '%hate%';

	
-- 10. Find the top 10 users with the most fans:

	SELECT id
		,name
		,fans
	FROM user
	ORDER BY fans DESC LIMIT 10;
		
	
	-- Copy and Paste the Result Below:

	-- 	+------------------------+-----------+------+
	-- 	| id                     | name      | fans |
	-- 	+------------------------+-----------+------+
	-- 	| 37cpUoM8hlkSQfReIEBd-Q | Mike      | 7009 |
	-- 	| hizGc5W1tBHPghM5YKCAtg | Katie     | 2499 |
	-- 	| iLjMdZi0Tm7DQxX1C1_2dg | Ruggy     | 2135 |
	-- 	| eKUGKQRE-Ywi5dY55_zChg | Cherylynn | 1962 |
	-- 	| UsXqCXRZwSCSw0AT7y1uBg | Candice   | 1872 |
	-- 	| nkN_do3fJ9xekchVC-v68A | Jeremy    | 1820 |
	-- 	| ITa3vh5ERI90G_WP4SmGUQ | Peter     | 1803 |
	-- 	| VHdY6oG2JPVNjihWhOooAQ | Jessica   | 1791 |
	-- 	| peuxbSQwXed-81cSqL7Ykw | Brittany  | 1707 |
	-- 	| j14WgRoU_-2ZE1aw1dXrJg | Daniel    | 1631 |
	-- 	+------------------------+-----------+------+
	
	
-- 11. Is there a strong correlation between having a high number of fans and being listed 
-- 	as "useful" or "funny?" 
	
	SELECT fans, useful, funny
	FROM user
	ORDER BY fans DESC, useful DESC, funny DESC
	LIMIT 30;
	
	
	-- Copy and Paste the Result Below:

	-- 		+------+--------+--------+
	-- 		| fans | useful | funny  |
	-- 		+------+--------+--------+
	-- 		| 7009 |   1603 |    337 |
	-- 		| 2499 |  13279 |   1317 |
	-- 		| 2135 |  72300 |  12859 |
	-- 		| 1962 |  51220 |  50066 |
	-- 		| 1872 |  29004 |  28722 |
	-- 		| 1820 |  31788 |   3714 |
	-- 		| 1803 |  49476 |  17885 |
	-- 		| 1791 |  38872 |   1566 |
	-- 		| 1707 |  10355 |   9787 |
	-- 		| 1631 |   1023 |   1018 |
	-- 		| 1572 |    116 |     55 |
	-- 		| 1533 |  21626 |   9984 |
	-- 		| 1439 |  47827 |  32780 |
	-- 		| 1343 |  57551 |   9643 |
	-- 		| 1335 |  51946 |   7202 |
	-- 		| 1279 |  67187 |  12372 |
	-- 		| 1266 |  48621 |  29166 |
	-- 		| 1263 |  18672 |   5855 |
	-- 		| 1252 |  24252 |   9468 |
	-- 		| 1232 |  15707 |   3716 |
	-- 		| 1222 |  49143 |  13232 |
	-- 		| 1118 |  22779 |   1969 |
	-- 		| 1084 |  21751 |   4695 |
	-- 		| 1074 |  37479 |  29371 |
	-- 		| 1036 |   2476 |    731 |
	-- 		| 1021 |   3884 |    426 |
	-- 		|  995 |  22002 |  20679 |
	-- 		|  991 |  19441 |   7947 |
	-- 		|  977 | 224710 | 212761 |
	-- 		|  969 |  50402 |  43054 |
	-- 		+------+--------+--------+
				
	
	-- Please explain your findings and interpretation of the results:
		
	-- 	Not really, some users with relatively low number of fans also got many 'userful's
	-- 	and 'funny's. But since only top thirty entries with most number of fans are returned,
	-- 	it is hard to tell whether they are correlated. 
	
	

-- Part 2: Inferences and Analysis

-- 1. 	Pick one city and category of your choice and group the businesses in that city
-- 	and category by their overall star rating. Compare the businesses with 2-3 stars to 
-- 	the businesses with 4-5 stars and answer the following questions. Include your code.

-- 	I only look at Restaurants in Toronto.

	SELECT city
		,category
		,COUNT(*) AS cc_count
	FROM business b
	INNER JOIN category c ON b.id = c.business_id
	GROUP BY city
		,category
	ORDER BY cc_count DESC LIMIT 10;

	-- +-----------+---------------+----------+
	-- | city      | category      | cc_count |
	-- +-----------+---------------+----------+
	-- | Toronto   | Restaurants   |     7149 |
	-- | Las Vegas | Restaurants   |     5902 |
	-- | Las Vegas | Shopping      |     4563 |
	-- | Phoenix   | Restaurants   |     3647 |
	-- | Toronto   | Food          |     3479 |
	-- | Montreal  | Restaurants   |     3469 |
	-- | Las Vegas | Home Services |     3155 |
	-- | Las Vegas | Beauty & Spas |     2942 |
	-- | Las Vegas | Food          |     2872 |
	-- | Phoenix   | Shopping      |     2833 |
	-- +-----------+---------------+----------+
	
	
	-- i.	Do the two groups you chose to analyze have a different distribution of hours?
	
	-- 	No idea how to do this question.

	
	-- ii.	Do the two groups you chose to analyze have a different number of reviews?

	-- 	No. 4-5 stars group has more reviews.

		SELECT CASE 
				WHEN stars BETWEEN 2
						AND 3
					THEN '2-3 stars'
				WHEN stars BETWEEN 4
						AND 5
					THEN '4-5 stars'
				END 'starlevel'
			,AVG(review_count) AS reviews
		FROM business b
		INNER JOIN category c ON b.id = c.business_id
		WHERE (city = 'Toronto')
			AND (category = 'Restaurants')
		GROUP BY starlevel
		HAVING starlevel IN (
				'2-3 stars'
				,'4-5 stars'
				)
		ORDER BY starlevel ASC;

		-- +-----------+---------+
		-- | starlevel | reviews |
		-- +-----------+---------+
		-- | 2-3 stars | 27.6258 |
		-- | 4-5 stars | 51.4765 |
		-- +-----------+---------+


	
	-- iii. Are you able to infer anything from the location data provided between these two
	-- 	groups? Explain.

	-- 	Only look at restaurants in all cities. Most of the 2-3 stars restaurants are in Toronto,
	-- 	Las Vegas and Phoenix while 4-5 stars are in Toronto, Las Vegas, Montréal.

		SELECT CASE 
				WHEN stars BETWEEN 2
						AND 3
					THEN '2-3 stars'
				WHEN stars BETWEEN 4
						AND 5
					THEN '4-5 stars'
				END 'starlevel'
			,city
			,COUNT(*) AS city_count
		FROM business b
		INNER JOIN category c ON b.id = c.business_id
		WHERE category = 'Restaurants'
		GROUP BY starlevel
			,city
		HAVING starlevel IN (
				'2-3 stars'
				,'4-5 stars'
				)
			AND city_count > 500
		ORDER BY starlevel
			,city_count DESC;

		-- +-----------+-------------+------------+
		-- | starlevel | city        | city_count |
		-- +-----------+-------------+------------+
		-- | 2-3 stars | Toronto     |       2512 |
		-- | 2-3 stars | Las Vegas   |       1964 |
		-- | 2-3 stars | Phoenix     |       1247 |
		-- | 2-3 stars | Charlotte   |        876 |
		-- | 2-3 stars | Montreal    |        818 |
		-- | 2-3 stars | Pittsburgh  |        682 |
		-- | 2-3 stars | Mississauga |        507 |
		-- | 4-5 stars | Toronto     |       2537 |
		-- | 4-5 stars | Las Vegas   |       2370 |
		-- | 4-5 stars | Montréal    |       1833 |
		-- | 4-5 stars | Phoenix     |       1456 |
		-- | 4-5 stars | Pittsburgh  |        896 |
		-- | 4-5 stars | Edinburgh   |        893 |
		-- | 4-5 stars | Charlotte   |        879 |
		-- | 4-5 stars | Scottsdale  |        677 |
		-- | 4-5 stars | Cleveland   |        580 |
		-- | 4-5 stars | Stuttgart   |        566 |
		-- +-----------+-------------+------------+
	

		
		
-- 2.	Group business based on the ones that are open and the ones that are closed. What
-- 	differences can you find between the ones that are still open and the ones that are
-- 	closed? List at least two differences and the SQL code you used to arrive at your
-- 	answer.
		
-- 	i. 	Difference 1: business quality

-- 	Most of the restaurants in the dataset are still open and they have more reviews than 
-- 	the closed restaurants. But there is no big difference in stars.


	SELECT is_open, AVG(review_count) AS reviews, AVG(stars) AS starlevel, COUNT(*) AS counts
	FROM business
	GROUP BY is_open

	-- +---------+---------+--------------------+
	-- | is_open | reviews | starlevel          |
	-- +---------+---------+--------------------+
	-- |       1 | 31.6508 | 3.6548547395400197 |
	-- |       0 | 22.1675 |  3.512901489323524 |
	-- +---------+---------+--------------------+
		
	
-- ii.	Difference 2: location and category:

-- Most of the open businesses are restaurants in Toronto, Las Vagas and shopping malls 
-- Las Vagas, while closed businesses are restaurants in Toronto, Las Vegas and Phoenix.

	SELECT 
	CASE WHEN is_open = 1 THEN 'open'
		 ELSE 'closed'
		 END 'status'
		 , city
		 , category
		 , COUNT(*) AS counts
	FROM business b INNER JOIN category c
	ON b.id = c.business_id
	GROUP BY status, city, category
	HAVING counts > 1000
	ORDER BY status DESC, counts DESC;

		-- +--------+-------------+---------------------------+--------+
		-- | status | city        | category                  | counts |
		-- +--------+-------------+---------------------------+--------+
		-- | open   | Toronto     | Restaurants               |   4969 |
		-- | open   | Las Vegas   | Restaurants               |   3991 |
		-- | open   | Las Vegas   | Shopping                  |   3799 |
		-- | open   | Las Vegas   | Home Services             |   2991 |
		-- | open   | Toronto     | Food                      |   2704 |
		-- | open   | Montréal    | Restaurants               |   2699 |
		-- | open   | Phoenix     | Home Services             |   2576 |
		-- | open   | Phoenix     | Restaurants               |   2571 |
		-- | open   | Las Vegas   | Health & Medical          |   2518 |
		-- | open   | Las Vegas   | Beauty & Spas             |   2482 |
		-- | open   | Toronto     | Shopping                  |   2355 |
		-- | open   | Phoenix     | Shopping                  |   2330 |
		-- | open   | Las Vegas   | Food                      |   2158 |
		-- | open   | Las Vegas   | Local Services            |   1896 |
		-- | open   | Charlotte   | Restaurants               |   1860 |
		-- | open   | Phoenix     | Health & Medical          |   1720 |
		-- | open   | Las Vegas   | Automotive                |   1683 |
		-- | open   | Pittsburgh  | Restaurants               |   1601 |
		-- | open   | Phoenix     | Local Services            |   1510 |
		-- | open   | Toronto     | Beauty & Spas             |   1503 |
		-- | open   | Las Vegas   | Event Planning & Services |   1417 |
		-- | open   | Phoenix     | Food                      |   1388 |
		-- | open   | Phoenix     | Automotive                |   1373 |
		-- | open   | Las Vegas   | Nightlife                 |   1369 |
		-- | open   | Phoenix     | Beauty & Spas             |   1277 |
		-- | open   | Charlotte   | Shopping                  |   1230 |
		-- | open   | Scottsdale  | Shopping                  |   1221 |
		-- | open   | Scottsdale  | Health & Medical          |   1219 |
		-- | open   | Montréal    | Food                      |   1181 |
		-- | open   | Las Vegas   | Professional Services     |   1160 |
		-- | open   | Edinburgh   | Restaurants               |   1126 |
		-- | open   | Las Vegas   | Active Life               |   1119 |
		-- | open   | Toronto     | Nightlife                 |   1104 |
		-- | open   | Las Vegas   | Fashion                   |   1102 |
		-- | open   | Las Vegas   | Arts & Entertainment      |   1082 |
		-- | open   | Scottsdale  | Beauty & Spas             |   1080 |
		-- | open   | Mississauga | Restaurants               |   1060 |
		-- | open   | Las Vegas   | Real Estate               |   1041 |
		-- | open   | Scottsdale  | Home Services             |   1031 |
		-- | open   | Cleveland   | Restaurants               |   1025 |
		-- | open   | Las Vegas   | Bars                      |   1004 |
		-- | closed | Toronto     | Restaurants               |   2180 |
		-- | closed | Las Vegas   | Restaurants               |   1911 |
		-- | closed | Phoenix     | Restaurants               |   1076 |
		-- +--------+-------------+---------------------------+--------+



	
-- 3. 	For this last part of your analysis, you are going to choose the type of analysis you
-- 	want to conduct on the Yelp dataset and are going to prepare the data for analysis.
	
-- 	Ideas for analysis include: Parsing out keywords and business attributes for sentiment 
-- 	analysis, clustering businesses to find commonalities or anomalies between them, 
-- 	predicting the overall star rating for a business, predicting the number of fans a 
-- 	user will have, and so on. These are just a few examples to get you started, so feel 
-- 	free to be creative and come up with your own problem you want to solve. Provide
-- 	answers, in-line, to all of the following:
	
-- 	i. 	Indicate the type of analysis you chose to do:
	
-- 		Parsing out keywords and business attributes for sentiment analysis
	
	ii.	Write 1-2 brief paragraphs on the type of data you will need for your analysis
		and why you chose that data:

		I will categorize business by the text of their reviews. And look at how the attributes
		of restaurants influence 
		

		
	iii.	Output of your finished dataset:


	iv. 	Provide the SQL code you used to create your final dataset:
	
