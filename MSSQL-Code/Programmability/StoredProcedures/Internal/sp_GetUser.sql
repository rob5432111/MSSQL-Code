CREATE PROCEDURE [Internal].[sp_GetUser]
	@UserName	VARCHAR(25) 
AS
BEGIN
	
	SELECT AppUserName, AppUserType 
	FROM [Internal].AppUser
	WHERE @UserName IS NULL --If the parameter is null then return everything
	OR AppUserName = @UserName	

END
