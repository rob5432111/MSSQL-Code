CREATE PROCEDURE [dbo].[sp_DeadLockExample_Select]
@col2 INT
AS
BEGIN
	SELECT col2, col3
	FROM DeadLockTable
	WHERE col2 BETWEEN @col2 AND @col2 + 1
END
GO

	
