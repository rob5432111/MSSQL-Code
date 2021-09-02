
--rpozo 07/07/2021: User created for the Internal Login
CREATE USER [Internal_User] FOR LOGIN [Internal_Login];
GO

--Connection permission
GRANT CONNECT TO [Internal_User];
GO

--Ensure role membership is correct
EXEC sp_addrolemember N'Internal_Role', N'Internal_User'
GO