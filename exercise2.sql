-- For all the questions in this practice set, you will be using the Salary by Job Range Table. 
-- This is a single table titled: salary_range_by_job_classification. 
-- This table contains the following columns:

-- SetID
-- Job_Code
-- Eff_Date Sal_End_Date
-- Salary_setID
-- Sal_Plan
-- Grade
-- Step
-- Biweekly_High_Rate
-- Biweekly_Low_Rate
-- Union_Code
-- Extended_Step
-- Pay_Type

-- 2) Find the distinct values for the extended step

SELECT DISTINCT Extended_step
FROM salary_range_by_job_classification;

-- 3) Excluding $0.00, what is the minimum bi-weekly high rate of pay? 

SELECT min(Biweekly_high_Rate)
FROM salary_range_by_job_classification
WHERE Biweekly_high_Rate <> '$0.00'
	AND Biweekly_high_Rate LIKE '$__.00';

-- 4) What is the maximum biweekly high rate of pay?

SELECT Max(Biweekly_high_Rate)
FROM salary_range_by_job_classification;

-- 5) What is the pay type for all the job codes that start with '03'?

SELECT job_code
		,pay_type
FROM salary_range_by_job_classification
WHERE job_code LIKE '03%';

-- 6) Run a query to find the Effective Date (eff_date) and Salary End Date (sal_end_date) for grade Q90H0?

SELECT grade
		,eff_date
		,sal_end_date
FROM salary_range_by_job_classification
WHERE grade = 'Q90H0';

-- 7) Sort the Biweekly low rate in ascending order. 

SELECT Biweekly_Low_Rate
FROM salary_range_by_job_classification
ORDER BY Biweekly_Low_Rate ASC;

-- 8) Write and run a query, with no starter code to answer this question: What Step are Job Codes 0110-0400?

SELECT Job_Code
		,Step
FROM salary_range_by_job_classification
WHERE Job_Code BETWEEN '0110'
				AND '0400'
ORDER BY Job_Code;

-- 9) What is the Biweekly High Rate minus the Biweekly Low Rate for job Code 0170?

SELECT Biweekly_High_Rate - Biweekly_Low_Rate AS Diff
FROM salary_range_by_job_classification
WHERE Job_Code = '0170';

-- 10) What is the step for Union Code 990 and a Set ID of SFMTA or COMMN?

SELECT STEP
	,Union_Code
	,SetID
FROM salary_range_by_job_classification
WHERE Union_Code = '990'
	AND (
		SetID = 'SFMTA'
		OR SetID = 'COMMN'
		);













