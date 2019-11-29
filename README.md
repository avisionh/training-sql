# Training: SQL 💻
Welcome to this repository of training materials for querying in SQL.

The training materials will be written in **T-SQL** (Transact-SQL). 📜

## How are the training materials organised? 🗃

They are designed and organised according to level of usage:
- **Light-user 🥉:** For those performing basic querying operations to retrieve lightly-wrangled data from SQL. Topics covered are:
    + Basic relational database theory
    + Basic query to retrieve all records/data from a table
    + Choosing unique records in a column
    + Filtering data from a table
    + Sorting/Arranging/Ordering data from a table
    + Grouping your data to aggregate it
    + Joining data from different tables next to each other
    + Attaching data from similarly structured tables on top of each other
    + Creating new columns in your data
    + Changing columns to a different data type
    + Using conditional if-else statements

- **Medium-user 🥈:** For those performing more advanced querying operations to retrieve heavily wrangled data from SQL. Topics covered are:
    + Advanced filtering of data
    + Ordering records according to their groups by a counter
    + Creating three types of temporary tables for storing data
    + Subquerying data
    + Pivoting data from long to wide shape
    + Unpivoting data from wide to long shape
    + Data matrix/tidy data principles
    + Differences between Tables and Views

- **Heavy-user 🥇:** For those perforrming data management roles to store objects permanently in SQL
    + Dynmaic SQl querying
    + Creating and updating tables
    + Importing data into SQL
    + Indexing columns to improve querying speeds
    + Adding constraints to columns to restrict entries that can go inside it
    + Using stored procedures and functions to do more bespoke operations
    + Version-controlling databases 

## Is there anything I need alongside the files? 👀🧠
The materials exist as interactive notebook-style files so that the user can seamlessly read and interact with SQL queries. For those familiar with Jupyter Notebooks in Python, this is exactly that.

Alongside the files in this repo, you will need to: 

1. Download and install [Azure Data Studio](https://docs.microsoft.com/en-us/sql/azure-data-studio/download?view=sql-server-ver15) 
1. Download and import the [AdventureWorks database](https://docs.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver15) into SQL

It is recommended that you do most of your SQL-related work in Microsoft's **SQL Server Management Studio (SSMS)**, or any other SQL engine (though the relevance of these mateirlas are lower).

This is because SSMS offers a better graphical user interface (GUI) to enable you to easily explore databses, tables, Views, stored procedures etc. whereas the programme we are using in these materials, Azure Data Studio, does not have the same functionality.

## How do I open the notebook files? 📖
To open and use the notebooks:
    
1. Open the software, **Azure Data Studio**
1. Save the `ipynb` file onto your desktop
1. Click on `File` -> `Open File` -> navigate to file titled `training_sql_lightuser.ipynb`


## Who can I contact if I think this material is pants? 👖
Please post it as an [Issue](https://github.com/avisionh/Training-SQL/issues) on the repository. I will then look at it.