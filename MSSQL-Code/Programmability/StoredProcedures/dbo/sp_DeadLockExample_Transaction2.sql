CREATE PROCEDURE [dbo].[sp_DeadLockExample_Transaction2]
AS 
BEGIN
	SET NOCOUNT ON;
	IF OBJECT_ID('tempdb..#table2') IS NOT NULL
		DROP TABLE #table2

	CREATE TABLE #table2 (col2 INT, col3 INT)

	WHILE (1=1)
	BEGIN
		INSERT INTO #table2 EXEC sp_DeadLockExample_Select 4
		TRUNCATE TABLE #table2
	END
END
