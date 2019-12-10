/* Training: SQL - Exercises */
-- DESCRIPTION: The purpose of this script is to provide exercises for the trainee to practice what 
--				was covered in the accompanying `training_sql_heavyuser.ipynb` notebook.

USE [AdventureWorks];

/* Question 1: Dynamic SQL querying #1 */
-- Q.			Is there an even more efficient way to perform the same task as in the query below
--				without having to use dynamic SQL querying?
-- Hint:		Consider using System Talbes belong to the [INFORMATION_SCHEMA] database.
-- Note:		This exercise introduces you to some very useful tables that exist in the background which 
--				will be extremely useful for data management tasks. It also shows that dynamic SQL is not always the best option.

-- A.			Please write your answer below.
SELECT
	[SchemaName] = SCHEMA_NAME(table_object.[schema_id])
	,[TableName] = table_object.[Name] 
	,[RowCount] = AVG(table_partition.[rows])
FROM [sys].[objects] AS table_object
INNER JOIN [sys].[partitions] table_partition
	ON table_object.[object_id] = table_partition.[object_id]
WHERE table_object.[type] = 'U'
GROUP BY
	table_object.[schema_id]
	,table_object.[Name];


/* Question 2: Inserting data into tables */
-- Q.			The [Person].[ProductPreference] table has been created for you to work with.
--				Can you complte one row of this table with your preferences?
-- Note:		From the definitions of the [StaffId] and [DateTimeCreation] fields, 
--				there is no need for you to enter these yourselves. Do you know what they do?
-- A.			Please write your answer below.

-- declare variables to use in dynamic sql
DECLARE @cols AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX);
DECLARE @name_schema AS NVARCHAR(25) = 'Person';
DECLARE @name_table AS NVARCHAR(50) = 'ProductPreference';

DECLARE @columns_keep AS NVARCHAR(255) = 'StaffId,StaffUnit';
DECLARE @column_measure AS NVARCHAR(15) = 'MediaType';
DECLARE @column_value AS NVARCHAR(15) = 'MediaSelection';

-- store list of all columns
SET @cols = 
(
	SELECT STRING_AGG([COLUMN_NAME],',') 
	FROM (
		SELECT DISTINCT [COLUMN_NAME] 
		FROM [INFORMATION_SCHEMA].[COLUMNS]
		WHERE [TABLE_NAME] = @name_table
			-- cheated a bit here as this is causing issue
			AND [COLUMN_NAME] NOT IN ('DataTimeCreation')
	) AS t
);

-- remove columns we don't want to unpivot from list of variables
SET @cols = REPLACE(@cols, ',' + @columns_keep, '');

-- dynamic SQL unpivot
set @query = 
'
	SELECT ' + @columns_keep + ',' + @column_measure + ', ' + @column_value + ' 
	FROM
    (
		SELECT *
		FROM [' + @name_schema + '].[' + @name_table + ']
	) AS x
	UNPIVOT
    (' +
		@column_value + '
        FOR ' + @column_measure + ' IN (' + @cols + ')
    ) AS p 
';

-- see dynamic SQL query generated
PRINT @query;

-- execute dynamic SQL query
EXEC sp_executesql @query;
