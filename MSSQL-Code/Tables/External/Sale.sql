CREATE TABLE [External].[Sale]
(
	SaleId		INT IDENTITY(1,1)	NOT NULL,
	SaleDate	DATETIME			NOT NULL CONSTRAINT DF_Sale_SaleDate DEFAULT GETDATE(),
	CustomerId	INT					NOT NULL,  
	AppUserId	INT					NOT NULL,
	SaleStatus	VARCHAR(25)			NOT NULL,
	CONSTRAINT PK_Sale PRIMARY KEY (SaleId)
) 
GO

CREATE NONCLUSTERED INDEX NC_Sale_SaleDate_Included ON [External].[Sale]
(
	SaleDate,
	CustomerId
)
INCLUDE
(
	SaleStatus
)
GO
