CREATE TABLE [External].[SaleDetail]
(
	SaleDetailId			INT IDENTITY(1,1) NOT NULL,
	SaleId					INT NOT NULL,
	ProductId				INT NOT NULL,
	SaleDetailQuantity		INT NOT NULL,
	SaleDetailUnitPrice		DECIMAL(9,2) NOT NULL,
	--Computed column
	SaleDetailSubTotal		AS SaleDetailQuantity * SaleDetailUnitPrice,
	CONSTRAINT PK_SaleDetail PRIMARY KEY (SaleDetailId),
	CONSTRAINT FK_SaleDetail_Sale FOREIGN KEY (SaleId) REFERENCES [External].Sale(SaleId),
	CONSTRAINT FK_SaleDetail_Product FOREIGN KEY (ProductId) REFERENCES [External].Product(ProductId)
)
GO

