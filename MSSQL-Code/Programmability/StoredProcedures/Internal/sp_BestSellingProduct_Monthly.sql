CREATE PROCEDURE [External].[sp_BestSellingProduct_Monthly]
	@Category VARCHAR(50)
AS
BEGIN	
	SELECT * 
	FROM [External].Sale S
	JOIN [External].SaleDetail SD ON SD.SaleId = S.SaleId
	JOIN [External].Product P ON P.ProductId = SD.ProductId
	LEFT JOIN [External].Category C ON C.CategoryId = P.CategoryId
	WHERE (@Category IS NULL OR  C.CategoryName = @Category)



END
GO