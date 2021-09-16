
--rpozo 07/07/2021: User created for the External Login
CREATE USER [External_User] FOR LOGIN [External_Login];
GO

--Connection permission
GRANT CONNECT TO [External_User];
GO

--GRANT DATABASE WIDE PERMISSION
GRANT SHOWPLAN TO [External_User];
GO
GRANT REFERENCES TO [External_User];
GO
GRANT VIEW DATABASE STATE TO [External_User];
GO


--GRANT DB ROLE MEMBERSHIP
EXEC sp_addrolemember N'External_Role', [External_User];
GO