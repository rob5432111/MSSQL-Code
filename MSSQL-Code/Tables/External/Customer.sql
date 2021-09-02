CREATE TABLE [External].[Customer]
(
	[CustomerId]			INT				NOT NULL IDENTITY(1,1),
	[CustomerName]			VARCHAR(250)	NOT NULL,
	[CustomerOutsourceId]	VARCHAR(25)		NULL,
	[CustomerIdType]		VARCHAR(25)		NULL,
	CONSTRAINT PK_Customer PRIMARY KEY (CustomerId)
)
GO

CREATE UNIQUE NONCLUSTERED INDEX UNC_Customer_CustomerOutsourceId_Include
ON [External].Customer
(
	CustomerOutsourceId
)
INCLUDE 
(
	CustomerName
)
--Conditional Index to allow null values
WHERE CustomerOutsourceId IS NOT NULL;
GO


