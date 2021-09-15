CREATE FUNCTION [dbo].[tvf_FindCustomer_BadPracticeExample]
(
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50),
	@OutsourceId VARCHAR(25)
)
RETURNS @Customers TABLE
(
	CustomerId INT
)
AS
BEGIN
	INSERT INTO @Customers(CustomerId)
	SELECT CustomerId 
	FROM Customer
	WHERE (@FirstName IS NULL OR CustomerFirstName LIKE '%' + @FirstName + '%')
	AND (@LastName IS NULL OR CustomerLastName LIKE '%' + @LastName + '%')
	AND (@OutsourceId IS NULL OR CustomerOutsourceId LIKE '%' + @OutsourceId + '%')
	RETURN
END
