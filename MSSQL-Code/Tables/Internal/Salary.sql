CREATE TABLE [Internal].[Salary]
(
	[SalaryId]				INT				NOT NULL IDENTITY(1,1),
	[AppUserId]				INT				NOT NULL,
	[SalaryAmount]			DECIMAL(9,1)	NOT NULL,
	[SalaryStartDate]		DATETIME2(3)	NOT NULL CONSTRAINT DF_Salary_SalaryStartDate DEFAULT GETDATE()  ,
	[SalaryEndDate]			DATETIME2(3)	NULL,
	[AuditStartDate]		DATETIME2(3)	GENERATED ALWAYS AS ROW START,
	[AuditEndDate]			DATETIME2(3)	GENERATED ALWAYS AS ROW END,
	PERIOD FOR SYSTEM_TIME (AuditStartDate, AuditEndDate),
	CONSTRAINT PK_Salary PRIMARY KEY (SalaryId),
	CONSTRAINT FK_Salary_AppUser FOREIGN KEY (AppUserId) REFERENCES [Internal].AppUser(AppUserId)
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Internal].SalaryHistory));
GO

