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


/* Question 2: Inserting data into tables */
-- Q.			The [Person].[ProductPreference] table has been created for you to work with.
--				Can you complte one row of this table with your preferences?
CREATE TABLE [Person].[ProductPreference]
(
   [StaffId] INT IDENTITY(1,1) PRIMARY KEY
   ,[StaffUnit] NVARCHAR(25)
   ,[BookFavourite] NVARCHAR(100)
   ,[BookAuthor] NVARCHAR(100)
   ,[SongFavourite] NVARCHAR(100)
   ,[SongArtist] NVARCHAR(100)
   ,[FilmFavourite] NVARCHAR(100)
   ,[FilmDirector] NVARCHAR(100)
   ,[DateTimeCreation] DATETIME DEFAULT(GETDATE()) 
);
-- Note:		From the definitions of the [StaffId] and [DateTimeCreation] fields, 
--				there is no need for you to enter these yourselves. Do you know what they do?
-- A.			Please write your answer below.


/* Question 3: Thinking about objects in SQL */
-- Q.			Consider the following discussion questions below:
--				 1. Thinking about the [StaffId] column, do you know what it does?
--				 2. Why might the name of this column be inappropriate for what it actually does?
--				 3. Can you think of a way to improve this?
-- A.			Please write your answer below.


/* Question 4: Dynamic unpivoting*/
--				In actual fact, the table created above, [Person].[ProductPreference] is not in a tidy data form. 
--				As a database manager, this is a personal affront to you as you want to provide analysts with a 
--				formatted table of data that makes their jobs easier.
-- Q.			Can you unpivot the [Person].[ProductPreference] table so that it is in tidy data format? 
--				Try to unpivot it without explicitly referncing the columns you want to unpivot to rows.
-- Note:		This exercise is designed to get you thinking about what makes a good, structured table in SQL 
--				that's helpful to the end-user, the analyst. It brings in concepts covered in (1.) and (2.).

-- A.			Please write your answer below.


/* Question 5: Adding contraint to prevent rogue entries */
-- Q.			In the [Person].[ProductPreference] table, can you add a constraint on 
--				the [FilmFavourite] column to ensure that is must always be completed?
-- A.			Please write your answer below.


/* Question 6: Stored procedures and functions */
-- Q.			From running the stored procedure and function defined above, 
--				what is the difference in how they are prompted to run?
-- A.			Please write your answer below.


/* Question 7: Querying from a big-brother table */
-- Q.			In the [AuditDetails].[vw_DatabaseChangeLog] table, can you query it 
--				to look for changes that you have done to the database?
-- A.			Please write your answer below.