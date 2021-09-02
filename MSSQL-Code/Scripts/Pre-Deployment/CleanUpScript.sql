--Clean the db before initializing the configuration for TESTING
--DO NOT EXECUTE ON PRODUCTION

--External Schema
TRUNCATE TABLE [External].[SaleDetail]
TRUNCATE TABLE [External].[Sale]
TRUNCATE TABLE [External].[Product]
TRUNCATE TABLE [External].[Customer]

--Internal Schema
TRUNCATE TABLE [Internal].[Salary]
TRUNCATE TABLE [Internal].[AppUser]


