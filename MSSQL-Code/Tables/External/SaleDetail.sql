CREATE TABLE [External].[SaleDetail]
(
	SaleDetailId	INT IDENTITY(1,1) NOT NULL,
	SaleId			INT NOT NULL,
	ProductId		INT NOT NULL,
	Quantity		INT NOT NULL,
	SubTotal		DECIMAL(9,2) NOT NULL
	CONSTRAINT 
)
GO