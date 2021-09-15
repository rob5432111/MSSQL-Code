CREATE PROCEDURE [dbo].[sp_DeadLockExample_Transaction1]
AS
BEGIN
	SET NOCOUNT ON;

	WHILE(1=1)
	BEGIN 
		EXEC sp_DeadLockExample_Update 4
	END
END
GO

	
