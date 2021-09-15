CREATE PROCEDURE [dbo].[sp_DeadLockExample_Update]	
@col2 INT
AS
BEGIN
	UPDATE DeadLockTable
	SET col2 = col2 + 1 
	WHERE col1 = @col2;

	UPDATE DeadLockTable
	SET col2 = col2 - 1
	WHERE col1 = @col2	
END
