--============================================================================================================
/*
	Samples of basic queries like JOIN, LEFT JOIN, CROSS APPLY, SUBQUERIES, ETC...

	Sample Call: 
					DECLARE @OutputParameter INT
					EXEC [External].[sp_BasicExamples] @ParameterExample = 2, @OutputExample = @OutputParameter OUTPUT
					SELECT @OutputParameter
*/
--============================================================================================================
CREATE PROCEDURE [External].[sp_BasicExamples]
	@ParameterExample INT = 0, --Default Value
	@OutputExample INT OUTPUT
AS
BEGIN
--------------------------------------------------JOIN EXAMPLE----------------------------------------------

	--Get all the Sales from the User: Saler 1 from January
	--Order them by Date from newest to oldest
	SELECT AU.AppUserName
	, SaleYear = YEAR(S.SaleDate)
	, SaleMonth = DATENAME(MONTH,S.SaleDate)
	, SaleDay = DATEPART(DAY, S.SaleDate)
	FROM Sale S 
	JOIN AppUser AU 
		ON AU.AppUserID = S.AppUserId
	WHERE AU.AppUserName = 'Saler 1'
	AND S.SaleDate >= '2021-01-01'
	AND S.SaleDate < '2021-02-01'
	ORDER BY S.SaleDate DESC
	
----------------------------------------LEFT JOIN EXAMPLE (ON CONDITION)------------------------------------
	--Get ALL the users from USA, and the salary only if it's less or equal than 1000
	
	--Wrong query	
	SELECT AU.AppUserName, AU.AppUserCountry, S.SalaryAmount 
	FROM [Internal].AppUser AU 
	LEFT JOIN [Internal].Salary S 
		ON S.AppUserId = AU.AppUserId 	
	WHERE AU.AppUserCountry = 'USA'
	AND S.SalaryAmount <= 1000 --The condition here evaluates all the SalaryAmounts from the returned JOIN so NULL is excluded

	--Correct query
	SELECT AU.AppUserName, AU.AppUserCountry, S.SalaryAmount 
	FROM [Internal].AppUser AU 
	LEFT JOIN [Internal].Salary S 
		ON S.AppUserId = AU.AppUserId 
		AND S.SalaryAmount <= 1000 --The condition in the ON clause evaluates only the values in the LEFT table
	WHERE AU.AppUserCountry = 'USA'

--------------------------------------------CROSS APPLY EXAMPLE----------------------------------------------
	
	--Get the Sales where the TotalSold is greater than 2000 
	SELECT S.SaleId, S.SaleDate, CA.SaleDetailTotal
	FROM [External].Sale S
	CROSS APPLY (	SELECT SaleId, SaleDetailTotal = SUM(SaleDetailSubTotal) 
					FROM [External].SaleDetail  SD
					WHERE S.SaleId = SD.SaleId
					GROUP BY SaleId
				) CA
	WHERE CA.SaleDetailTotal > 2000

--------------------------------------------SUBQUERY EXAMPLE----------------------------------------------
	
	--Get the Sales from March and the TotalSold only if the units sold is greater than 2
	SELECT S.SaleId, S.SaleDate
	FROM [External].Sale S	
	WHERE S.SaleId IN (		SELECT SD.SaleID
							FROM [External].SaleDetail  SD														
							GROUP BY SaleId
							HAVING SUM(SD.SaleDetailQuantity) > 2
						) 
	AND S.SaleDate >= '2021-03-01'
	AND S.SaleDate < '2021-04-01'

	   
---------------------------------------------OUTPUT PARAMETER------------------------------------------------
	SELECT @OutputExample = COUNT(*) FROM Product

END
GO
