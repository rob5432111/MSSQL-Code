CREATE PROCEDURE [External].[sp_BestSeller_Money_Monthly_TempTablesExample]
@StartDate DATE = NULL
, @EndDate DATE = NULL
AS
BEGIN	

	DECLARE @EndDatePlusOne DATE = (SELECT DATEADD(DAY, 1, @EndDate ))
	
	--Prevent error for the creation of the same table name
	IF (OBJECT_ID('tempdb..#tmpSumTotalSold') IS NOT NULL)
		DROP TABLE #tmpSumTotalSold;

	SELECT SD.ProductId, EndOfMonth = EOMONTH(S.SaleDate), TotalProductsSold = SUM(SD.SaleDetailSubTotal) 
	--Numerate the qty of products sold ordered descending and product id in case of a tie
	, RN = ROW_NUMBER() OVER(PARTITION BY EOMONTH(S.SaleDate) 
								ORDER BY SUM(SD.SaleDetailSubTotal) DESC
										, SD.ProductId) --Tie Breaker
	
	INTO #tmpSumTotalSold --Create a temporal table to store results

	FROM Sale S
	JOIN SaleDetail SD ON SD.SaleId = S.SaleId
	WHERE (@StartDate IS NULL OR S.SaleDate >= @StartDate)
	AND (@EndDate IS NULL OR S.SaleDate < @EndDatePlusOne)
	GROUP BY SD.ProductId, EOMONTH(S.SaleDate)
	
	--Return the results
	SELECT [Year] = YEAR(tmp.EndOfMonth), [Month] = DATENAME(MONTH, tmp.EndOfMonth),C.CategoryName, P.ProductName, tmp.TotalProductsSold
	FROM #tmpSumTotalSold tmp 
	JOIN Product P ON P.ProductId = tmp.ProductId
	LEFT JOIN Category C ON C.CategoryId = P.CategoryId 
	WHERE RN = 1; --Select only the top 1 selling products

END
GO