---------------------------------------------------
-- Create gold schema (safe to rerun)
---------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'gold')
    EXEC('CREATE SCHEMA gold')
GO

---------------------
-- Create View Calendar
---------------------
DROP VIEW IF EXISTS gold.calendar
GO
CREATE VIEW gold.calendar
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Calendar/part-00000-tid-2640948077124543067-4b03f71f-bc8d-47b5-ae4c-c6c6970e6955-19-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------
-- Create View Customers
---------------------
DROP VIEW IF EXISTS gold.customers
GO
CREATE VIEW gold.customers
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Customers/part-00000-tid-5013125068131754902-665128c9-1603-4c86-8ddf-9344a668fac3-22-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------
-- Create View Products
---------------------
DROP VIEW IF EXISTS gold.products
GO
CREATE VIEW gold.products
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Products/part-00000-tid-2188651214118030700-dc80df5e-8ba9-478b-80e8-77921f4f4340-27-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------
-- Create View Returns
---------------------
DROP VIEW IF EXISTS gold.reutrns
GO
CREATE VIEW gold.reutrns
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Returns/part-00000-tid-7606320239380104754-f731dea4-aca2-4139-90f5-c7ed43dab11b-29-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------
-- Create View Sales
---------------------
DROP VIEW IF EXISTS gold.sales
GO
CREATE VIEW gold.sales
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Sales/part-00000-tid-4378702692931993461-aa565a6d-b13d-4015-9439-ac260d31b773-41-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------
-- Create View Subcategories
---------------------
DROP VIEW IF EXISTS gold.subcategories
GO
CREATE VIEW gold.subcategories
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Subcategories/part-00000-tid-1073284569621554787-5b90bd18-6fff-4338-8fb7-089947fd601f-24-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------
-- Create View Territories
---------------------
DROP VIEW IF EXISTS gold.territories
GO
CREATE VIEW gold.territories
AS
SELECT
*
FROM 
OPENROWSET(
    BULK 'https://awstoragedatalakeprateek.dfs.core.windows.net/silver/AdventureWorks_Territories/part-00000-tid-2263150471449733245-301519a6-fa90-40a2-b5a1-16a3d0a5952a-33-1-c000.snappy.parquet',
    FORMAT = 'PARQUET'
) as Quer1
GO

---------------------------------------------------
-- Verify: list all views created in gold schema
---------------------------------------------------
SELECT TABLE_SCHEMA, TABLE_NAME
FROM INFORMATION_SCHEMA.VIEWS
WHERE TABLE_SCHEMA = 'gold'
GO


