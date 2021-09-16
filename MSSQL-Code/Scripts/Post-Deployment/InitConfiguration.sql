-----------------------------------------------------------------------------------------------
--------------------------------Testing values for the new tables------------------------------
-----------------------------------------------------------------------------------------------
GO

-----------------------------------------Categories--------------------------------------------
IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Category WHERE CategoryName = 'Smartphone')
BEGIN
	INSERT INTO [External].Category (CategoryName, CategoryDescription) 
	VALUES ('Smartphone', 'All kinds of smartphones')	
END

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Category WHERE CategoryName = 'Electronic')
BEGIN
	INSERT INTO [External].Category (CategoryName, CategoryDescription) 
	VALUES ('Electronic', 'All kinds of electronic devices');
END

-------------------------------------------Products-------------------------------------------

DECLARE @ProductName VARCHAR(50),
		@CategoryId INT,
		@Status VARCHAR(25) = 'Active';

--Examples of products within the category Food
SELECT @ProductName = 'iPhone X', @CategoryId = CategoryId
FROM [External].Category
WHERE CategoryName = 'Smartphone';
	

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product WHERE ProductName = @ProductName )
BEGIN
	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES (@ProductName, '1000.5', @CategoryId, @Status);	
END

SET @ProductName = 'Samsung S20';

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product WHERE ProductName = @ProductName )
BEGIN
	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES (@ProductName, '900.75', @CategoryId, @Status)	
END

--Examples of products within the category Electronics
SELECT @CategoryId = CategoryId
FROM [External].Category
WHERE CategoryName = 'Electronic';

SET @ProductName = 'Monitor HD'

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product WHERE ProductName = @ProductName )
BEGIN
	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES (@ProductName, '250.05', @CategoryId, @Status);	
END

SET @ProductName = 'Keyboard';

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product WHERE ProductName = @ProductName )
BEGIN
	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES (@ProductName, '10.25', @CategoryId, @Status)	
END

SET @ProductName = 'Mouse';

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product WHERE ProductName = @ProductName )
BEGIN
	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES (@ProductName, '5', @CategoryId, @Status)	
END

SET @ProductName = 'Monitor SD';

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product WHERE ProductName = @ProductName )
BEGIN
	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES (@ProductName, '120.75', @CategoryId, @Status)	
END

-----------------------------------------App Users--------------------------------------------

DECLARE @Password VARCHAR(50) = 'Password';

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [Internal].AppUser WHERE AppUserName = 'Admin 1')
BEGIN
	INSERT INTO [Internal].AppUser(AppUserName, PasswordHash, AppUserType, AppUserCountry) 
	VALUES ('Admin 1', 0xD, 'Admin', 'USA')
END

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [Internal].AppUser WHERE AppUserName = 'Saler 1')
BEGIN
	INSERT INTO [Internal].AppUser(AppUserName, PasswordHash, AppUserType, AppUserCountry) 
	VALUES ('Saler 1', 0xD, 'Saler', 'Equateur')
END

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [Internal].AppUser WHERE AppUserName = 'Saler 2')
BEGIN
	INSERT INTO [Internal].AppUser(AppUserName, PasswordHash, AppUserType, AppUserCountry) 
	VALUES ('Saler 2', 0xD, 'Saler', 'USA')
END

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [Internal].AppUser WHERE AppUserName = 'Manager 1')
BEGIN
	INSERT INTO [Internal].AppUser(AppUserName, PasswordHash, AppUserType, AppUserCountry) 
	VALUES ('Manager 1', 0xD, 'Manager', 'Canada')
END
GO

-----------------------------------------Customers--------------------------------------------
IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Customer WHERE CustomerFirstName = 'Customer 1')
BEGIN
	INSERT INTO [External].Customer(CustomerFirstName, CustomerLastName, CustomerIdType, CustomerOutsourceId) 
	VALUES ('Customer 1', 'LastName 1', 'Passport', 'C000001')
END
GO

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Customer WHERE CustomerFirstName = 'Customer 2')
BEGIN
	INSERT INTO [External].Customer(CustomerFirstName, CustomerLastName, CustomerIdType, CustomerOutsourceId) 
	VALUES ('Customer 2', 'LastName 2', 'Passport', 'C000002')
END
GO

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Customer WHERE CustomerFirstName = 'Customer 3')
BEGIN
	INSERT INTO [External].Customer(CustomerFirstName, CustomerLastName, CustomerIdType, CustomerOutsourceId) 
	VALUES ('Customer 3', 'LastName 3', 'Passport', 'C000003')
END
GO

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Customer WHERE CustomerFirstName = 'Customer 4')
BEGIN
	INSERT INTO [External].Customer(CustomerFirstName, CustomerLastName, CustomerIdType, CustomerOutsourceId) 
	VALUES ('Customer 4', 'LastName 4', 'Passport', 'C000004')
END
GO

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Customer WHERE CustomerFirstName = 'Customer 5')
BEGIN
	INSERT INTO [External].Customer(CustomerFirstName, CustomerLastName, CustomerIdType, CustomerOutsourceId) 
	VALUES ('Customer 5', 'LastName 5', 'Passport', 'C000005')
END
GO