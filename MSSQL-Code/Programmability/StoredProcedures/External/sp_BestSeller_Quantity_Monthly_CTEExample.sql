CREATE PROCEDURE [External].[sp_BestSeller_Quantity_Monthly_CTEExample]
@StartDate DATE = NULL
, @EndDate DATE = NULL
AS
BEGIN	

	DECLARE @EndDatePlusOne DATE = (SELECT DATEADD(DAY, 1, @EndDate ))
	
	;WITH CTE_ProductSoldCount
	AS 
	(
		SELECT SD.ProductId, EndOfMonth = EOMONTH(S.SaleDate), TotalProductsSold = SUM(SD.SaleDetailQuantity) 
		--Numerate the qty of products sold ordered descending and product id in case of a tie
		, RN = ROW_NUMBER() OVER(PARTITION BY EOMONTH(S.SaleDate) 
									ORDER BY SUM(SD.SaleDetailQuantity) DESC
											, SD.ProductId) --Tie Breaker
		FROM Sale S
		JOIN SaleDetail SD ON SD.SaleId = S.SaleId
		WHERE (@StartDate IS NULL OR S.SaleDate >= @StartDate)
		AND (@EndDate IS NULL OR S.SaleDate < @EndDatePlusOne)
		GROUP BY SD.ProductId, EOMONTH(S.SaleDate)
	)

	SELECT [Year] = YEAR(CTE.EndOfMonth), [Month] = DATENAME(MONTH, CTE.EndOfMonth),C.CategoryName, P.ProductName, CTE.TotalProductsSold
	FROM CTE_ProductSoldCount CTE 
	JOIN Product P ON P.ProductId = CTE.ProductId
	LEFT JOIN Category C ON C.CategoryId = P.CategoryId
	WHERE RN = 1; --Select only the top 1 selling products

END
GO
