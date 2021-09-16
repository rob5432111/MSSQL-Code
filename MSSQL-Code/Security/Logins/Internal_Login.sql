
--rpozo 07/07/2021: Login created with password for testing purposes, should use Active Directory (Windows Authentication).
CREATE LOGIN [Internal_Login] WITH PASSWORD=N'123456', DEFAULT_DATABASE=[$(DatabaseName)], DEFAULT_LANGUAGE=[us_english];
GO
