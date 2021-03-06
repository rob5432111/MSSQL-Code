
--rpozo 07/07/2021: User created for the DW Login
CREATE USER [DW_User] FOR LOGIN [DW_Login];
GO

--Connection permission
GRANT CONNECT TO [DW_User];
GO

--GRANT DATABASE WIDE PERMISSION
GRANT SHOWPLAN TO [DW_User];
GO
GRANT REFERENCES TO [DW_User];
GO
GRANT VIEW DATABASE STATE TO [DW_User];
GO


--GRANT DB ROLE MEMBERSHIP
EXEC sp_addrolemember N'db_owner', [DW_User];
GO

EXEC sp_addrolemember N'DW_Role', [DW_User];
GO