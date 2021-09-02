CREATE TABLE [External].[Category]
(
	[CategoryId]			INT				NOT NULL IDENTITY(1,1),
	[CategoryName]			VARCHAR(50)		NOT NULL,
	[CategoryDescription]	VARCHAR(250)	NULL,
	CONSTRAINT PK_Category	PRIMARY KEY (CategoryId)
)
GO