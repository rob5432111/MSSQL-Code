CREATE TABLE [dbo].[DeadLockTable]
(
	col1 INT, 
	col2 INT, 
	col3 INT, 
	col4 char(100)
)
GO

CREATE CLUSTERED INDEX C_DeadLockTable
ON DeadLockTable (col1);
GO

CREATE NONCLUSTERED INDEX NC_DeadLockTable_col2
ON DeadLockTable (col2);	
GO