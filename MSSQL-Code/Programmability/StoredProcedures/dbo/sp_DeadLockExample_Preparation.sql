CREATE PROCEDURE [dbo].[sp_DeadLockExample_Preparation]	
AS
BEGIN		
	TRUNCATE TABLE DeadLockTable;
	DECLARE @i INT = 1;

	WHILE (@i <= 1000)
	BEGIN
		INSERT INTO DeadLockTable VALUES (@i, @i, @i,@i)
		SET @i = @i + 1;
	END	
END
