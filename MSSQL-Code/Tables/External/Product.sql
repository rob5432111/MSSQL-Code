CREATE TABLE [External].[Product]
(
	[ProductId]			INT				NOT NULL	IDENTITY(1,1), 
    [ProductName]		VARCHAR(50)		NOT NULL,
	[ProductPrice]		DECIMAL(9,2)	NULL,
	[CategoryId]		INT				NULL,
	[ProductStatus]		VARCHAR(25)		NOT NULL CONSTRAINT DF_Product_ProductStatus DEFAULT ('Inactive'),
	[AuditStartDate]	DATETIME2(3)	GENERATED ALWAYS AS ROW START,
	[AuditEndDate]		DATETIME2(3)	GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (AuditStartDate, AuditEndDate),	
	CONSTRAINT PK_Product PRIMARY KEY (ProductId),
	CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryId) REFERENCES [External].Category(CategoryId)	
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [External].ProductHistory));
GO


--Unique index to avoid duplicates in Product Names, include the product status and price
CREATE UNIQUE NONCLUSTERED INDEX UNC_Product_ProductName ON [External].Product
(
	ProductName
)
INCLUDE
(
	ProductStatus,
	ProductPrice
)
GO

