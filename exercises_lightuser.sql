/* Training: SQL - Exercises */
-- DESCRIPTION: The purpose of this script is to provide exercises for the trainee to practice what 
--				was covered in the accompanying `training_sql_lightuser.ipynb` notebook.

USE [HEFE-AN-DEV];

/* Question 1: FILTER, GROUP BY and COUNT */
-- Q.		Based on the material up to (4.), can you count the number of records for each city, ordering the results by city?
-- A.		Please write your query below here.


/* Question 2: JOIN-ing tables together */
-- Q.		Using the [Person].[Person] and [Person].[EmailAddress] tables, can you retrieve the top 100 records first names, last names and email addresses?
-- A.		Please write your query below here.


/* Question 1: UNION-ing tables together */
-- Q.		Based on what we covered so far, can you think of an alternative way of writing the below query from (6.)?
SELECT 
    [AddressID]
    ,[AddressLine1]
    ,[City]
    ,[StateProvinceID]
    ,[PostalCode]
FROM [Person].[Address]
WHERE [City] = 'Phoenix'
UNION
SELECT 
    [AddressID]
    ,[AddressLine1]
    ,[City]
    ,[StateProvinceID]
    ,[PostalCode]
FROM [Person].[Address]
WHERE [City] = 'New York';
-- A.		Please write your query below here.


/* Question 2: CAST-ing columns to a specified datatype */
-- Q.		Using the GETDATE() function to fetch today's date and time, can you cast this to only get the date instead?
-- Note:	A `SELECT` statement need not always end with `FROM <table_name>`
-- A.		Please write your query below here.


/* Question 3: Avoiding long and winding CASE WHEN statements */
-- Q.		Using the `[Sales].[Currency]` as your look-up table, find a way to do what you aim to do below in (7.2) but without using `CASE WHEN` statements. 
SELECT 
    [FromCurrencyCode]
    ,[FromCurrencyName] = CASE
        WHEN [FromCurrencyCode] = 'AED' THEN 'Emirati Dirham'
        WHEN [FromCUrrencyCode] = 'AFA' THEN 'Afghani'
        WHEN [FromCurrencyCode] = 'ALL' THEN 'Lek'
        -- and so on....damn, this is really tedious to type out
        ELSE NULL
        END
    ,[ToCurrencyCode]
    ,[AverageRate]
    ,[EndOfDayRate]
FROM [Sales].[CurrencyRate];
-- A.		Please write your query below.


/* Question 4: CAST-ing columns so they can be concatenated */
-- Q.		Using the `[ExpMonth]` and `[ExpYear]` columns in [Sales].[CreditCard], 
--			and assuming all expriation dates start on the first of each month, *e.g. 2018/05/01*, 
--			can you create a new column that has the full date of expiry, ensuring that this is of the date datatype?

-- Hint:	This exercise brings together the concepts learnt so far of:
--				- Creating a new column
--				- Casting columns to the right datatype
--				- Using conditional if/else (`CASE WHEN`) statements

--			You will also need to search how to concatenate columns and may possibly need to use the `LENGTH()` function.

-- Note:	This is actually quite a difficult exercise.
-- A.		Please write your query below here.