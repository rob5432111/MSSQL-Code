
--rpozo 07/07/2021: Login created with password for testing purposes, should use Active Directory (Windows Authentication)..
CREATE LOGIN [External_Login] WITH PASSWORD=N'TestExternal', DEFAULT_DATABASE=[$(DatabaseName)], DEFAULT_LANGUAGE=[us_english];
GO
