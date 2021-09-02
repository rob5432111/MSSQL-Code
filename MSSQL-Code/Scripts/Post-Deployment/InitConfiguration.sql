--Initial configuration for the new tables
GO
IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Category)
BEGIN
	INSERT INTO [External].Category (CategoryName, CategoryDescription) 
	VALUES ('Food', 'All kinds of food')
	, ('Electronic', 'All kinds of electronic devices');
END

IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [External].Product)
BEGIN
	
	DECLARE @CategoryId INT,
			@Status VARCHAR(25) = 'Active';

	--Examples of products within the category Food
	SELECT @CategoryId = CategoryId
	FROM [External].Category
	WHERE CategoryName = 'Food';

	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES ('Apple', '0.5', @CategoryId, @Status)
	, ('Orange', '0.75', @CategoryId, @Status)

	--Examples of products within the category Electronics
	SELECT @CategoryId = CategoryId
	FROM [External].Category
	WHERE CategoryName = 'Electronic';

	INSERT INTO [External].Product (ProductName, ProductPrice, CategoryId, ProductStatus)
	VALUES ('SmartPhone M5', '250.05', @CategoryId, @Status)
	, ('Keyboard', '10', @CategoryId, @Status)
	, ('Mouse', '5', @CategoryId, @Status)
	, ('Monitor', '120.75', @CategoryId, @Status)
END

GO
IF NOT EXISTS(SELECT TOP 1 'Exists' FROM [Internal].AppUser)
BEGIN
	INSERT INTO [Internal].AppUser VALUES ('User 1', 0xD), ('User 2', 0xD)
END