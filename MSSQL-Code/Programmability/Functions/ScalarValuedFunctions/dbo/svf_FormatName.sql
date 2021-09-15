CREATE FUNCTION [dbo].[svf_FormatName]
(
	@FirstName VARCHAR(50),
	@LastName VARCHAR(50)
)
RETURNS INT
AS
BEGIN
	
	RETURN CONCAT(@LastName + ',', @FirstName);

END
