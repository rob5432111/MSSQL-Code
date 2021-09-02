CREATE TABLE [Internal].[AppUser]
(
	[AppUserId]		INT IDENTITY(1,1)	NOT NULL,
	[AppUserName]	VARCHAR(25)			NOT NULL,
	[PasswordHash]	VARBINARY			NOT NULL,
	CONSTRAINT PK_AppUser PRIMARY KEY (AppUserId)
)
GO
