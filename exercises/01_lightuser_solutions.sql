/* Training: SQL - Exercises */
-- DESCRIPTION: The purpose of this script is to provide exercises for the trainee to practice what 
--				was covered in the accompanying `training_sql_lightuser.ipynb` notebook.

USE [AdventureWorks];

/* Question 1: FILTER, GROUP BY and COUNT */
-- Q.		Using the [Person].[Address] table and based on the material up to (4.), can you count the number of records for each city
--			in the state province ID of 11, ordering the results by city?
-- A.		Please write your query below here.
SELECT [City]
	,COUNT(*)
FROM [Person].[Address]
WHERE [StateProvinceID] = 11
GROUP BY [City]
ORDER BY [City];


/* Question 2: JOIN-ing tables together */
-- Q.		Using the [Person].[Person] and [Person].[EmailAddress] tables, can you retrieve the top 100 records first names, last names and email addresses?
-- A.		Please write your query below here.
SELECT TOP 100 
	table_person.[FirstName]
	,table_person.[LastName]
	,table_email.[EmailAddress]
FROM [Person].[Person] AS table_person
LEFT JOIN [Person].[EmailAddress] AS table_email
	ON table_person.[BusinessEntityID] = table_email.[BusinessEntityID];


/* Question 3: UNION-ing tables together */
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
SELECT 
    [AddressID]
    ,[AddressLine1]
    ,[City]
    ,[StateProvinceID]
    ,[PostalCode]
FROM [Person].[Address]
WHERE [City] IN ('Phoenix', 'New York');


/* Question 4: CAST-ing columns to a specified datatype */
-- Q.		Using the GETDATE() function to fetch today's date and time, can you cast this to only get the date instead?
-- Note:	A `SELECT` statement need not always end with `FROM <table_name>`
-- A.		Please write your query below here.
SELECT CAST(GETDATE() AS DATE);


/* Question 5: Avoiding long and winding CASE WHEN statements */
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
SELECT 
	table_rate.[FromCurrencyCode]
	,[FromCurrencyName] = table_lookup.[Name]
	,table_rate.[ToCurrencyCode]
	,table_rate.[AverageRate]
	,table_rate.[EndOfDayRate]
FROM [Sales].[CurrencyRate] AS table_rate
LEFT JOIN [Sales].[Currency] AS table_lookup
	ON table_rate.[FromCurrencyCode] = table_lookup.[CurrencyCode];


/* Question 6: Creating a new conditional column */
-- Q.		Using the [Person].[CountryRegion] table, can you classify countries that you think are military regimes under a new column, [MilitaryRegimeFlag]?
-- A.		Please write your query below.
SELECT [CountryRegionCode]
	,[Name]
	,[MilitaryRegimeFlag] = CASE
		WHEN [Name] IN ('North Korea', 'Bolivia', 'Myanmar') THEN 1
		ELSE 0
		END
FROM [Person].[CountryRegion];


/* Question 7: CAST-ing columns so they can be concatenated */
-- Q.		Using the [Sales].[CreditCard] table and the `[ExpMonth]` and `[ExpYear]` columns, 
--			and assuming all expriation dates start on the first of each month, *e.g. 2018/05/01*, 
--			can you create a new column that has the full date of expiry, ensuring that this is of the date datatype?

-- Hint:	This exercise brings together the concepts learnt so far of:
--				- Creating a new column
--				- Casting columns to the right datatype
--				- Using conditional if/else (`CASE WHEN`) statements

--			You will also need to search how to concatenate columns and may possibly need to use the `LEN()` function.

-- Note:	This is actually quite a difficult exercise.
-- A.		Please write your query below here.
SELECT [CardType]
	,[CardNumber]
	,[ExpiryDate] = CASE
		WHEN LEN([ExpMonth]) = 1 THEN CAST(CAST([ExpYear] AS VARCHAR(4)) + '-0' + CAST([ExpMonth] AS VARCHAR(2)) + '-01' AS DATE)
		ELSE CAST(CAST([ExpYear] AS VARCHAR(4)) + '-' + CAST([ExpMonth] AS VARCHAR(2)) + '-01' AS DATE)
		END
FROM [Sales].[CreditCard];


/* Question 8: Returning first non-NULL entry across multiple columns */
-- Q.		Using the COALESCE() function, can you rewrite the below query?
-- Note:	This exercise shows you a shorthand way of creating a new column that 
--			takes the first non-NULL entry across several existing columns.
SELECT [Name]
    ,[ProductNumber]
    ,[ProductSubcategoryID]
    ,[ProductModelID]
    ,[ProductId] = CASE
        WHEN [ProductSubcategoryID] IS NULL THEN [ProductModelID]
        ELSE [ProductSubcategoryID]
        END
FROM [Production].[Product];
-- A.		Please write your query below here.
SELECT [Name]
    ,[ProductNumber]
    ,[ProductSubcategoryID]
    ,[ProductModelID]
    ,[ProductId] = COALESCE([ProductSubcategoryID], [ProductModelID])
FROM [Production].[Product];