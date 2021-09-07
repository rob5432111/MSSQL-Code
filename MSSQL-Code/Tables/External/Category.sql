CREATE TABLE [External].[Category]
(
	[CategoryId]			INT				NOT NULL IDENTITY(1,1),
	[CategoryName]			VARCHAR(50)		NOT NULL,
	[CategoryDescription]	VARCHAR(250)	NULL,
	[CategoryEditUser]		VARCHAR(250)	NULL,				
	[AuditStartDate]		DATETIME2(3)	GENERATED ALWAYS AS ROW START CONSTRAINT DF_Salary_AuditStartDate DEFAULT GETDATE(),
	[AuditEndDate]			DATETIME2(3)	GENERATED ALWAYS AS ROW END,
	CONSTRAINT PK_Category	PRIMARY KEY (CategoryId),		
	PERIOD FOR SYSTEM_TIME (AuditStartDate, AuditEndDate),	
) WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE = [External].CategoryHistory));
GO

--CREATE TRIGGER Ins_Upd_Del_Category
--ON [External].[Category]
--INSTEAD OF INSERT, UPDATE, DELETE
--AS
--BEGIN
--	DECLARE @ActionType CHAR(1);

	
--	-- Get the type of the action performed
--	IF  EXISTS (SELECT TOP 1 'Exists' FROM Inserted ) AND EXISTS (SELECT TOP 1 'Exists' FROM Deleted)
--		   SET @ActionType = 'U'          --update
--	ELSE IF EXISTS (SELECT TOP 1 'Exists' FROM Inserted)
--		   SET @ActionType = 'I'          --insert
--	ELSE IF EXISTS (SELECT TOP 1 'Exists' FROM Deleted)  
--		   SET @ActionType = 'D';  --delete
	
--	IF @ActionType = 'I'
--	BEGIN
--		INSERT INTO [External].Category ( 
--		[CategoryName]
--		,[CategoryDescription]
--		,[CategoryEditUser])
--		SELECT 
--		[CategoryName]
--		,[CategoryDescription]
--		, ORIGINAL_LOGIN() --Insert the original login for the action
--		FROM inserted		
--	END
--	ELSE IF @ActionType = 'U'
--	BEGIN 
--		UPDATE Tgt
--		SET [CategoryName] = [CategoryName]  
--		,[CategoryDescription] = [CategoryDescription] 
--		,[CategoryEditUser] = ORIGINAL_LOGIN()
--		FROM [External].Category Tgt
--		JOIN inserted i ON Tgt.CategoryId = i.CategoryId
--	END
--	ELSE IF @ActionType = 'D'
--	BEGIN
--		UPDATE Tgt
--		SET [CategoryName] = [CategoryName]  
--		,[CategoryDescription] = [CategoryDescription] 
--		,[CategoryEditUser] = ORIGINAL_LOGIN()
--		FROM [External].Category Tgt
--		JOIN deleted d ON Tgt.CategoryId = d.CategoryId

--		DELETE Tgt 
--		FROM [External].Category Tgt
--		JOIN deleted d ON Tgt.CategoryId = d.CategoryId
--	END
--END
--GO
