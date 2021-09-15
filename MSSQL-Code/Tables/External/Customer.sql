CREATE TABLE [External].[Customer]
(
	[CustomerId]			INT				NOT NULL IDENTITY(1,1),
	[CustomerFirstName]		VARCHAR(50)		NOT NULL,
	[CustomerLastName]		VARCHAR(50)		NOT NULL,
	[CustomerIdType]		VARCHAR(25)		NULL,
	[CustomerOutsourceId]	VARCHAR(25)		NULL,	
	CONSTRAINT PK_Customer PRIMARY KEY (CustomerId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX UNC_Nulls_Customer_CustomerOutsourceId_Include
ON [External].Customer
(
	CustomerOutsourceId
)
INCLUDE 
(
	CustomerFirstName,
	CustomerLastName
)
--Conditional Index to allow null values
WHERE CustomerOutsourceId IS NOT NULL;
GO


