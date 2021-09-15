
--Example values for the sales area

IF NOT EXISTS (SELECT 'Exists' FROM [External].Sale)
BEGIN
	-------------------------------------------Sales-----------------------------------------------

	DECLARE @SalerId INT,
			@CustomerId INT,
			@SaleId INT;

	------------------------------------------Saler 1----------------------------------------------

	SELECT @SalerId = AppUserId 
	FROM [Internal].AppUser
	WHERE AppUserName = 'Saler 1';

	----------------------------------------Customer 1---------------------------------------------

	SELECT @CustomerId = CustomerId
	FROM [External].Customer
	WHERE CustomerFirstName = 'Customer 1';

	-------------------------------------------2021------------------------------------------------
	--------------------------------------January Sales--------------------------------------------

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210101 14:00', @CustomerId, @SalerId, 'Active');

		SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 3, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;


	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210102 14:00', @CustomerId, @SalerId, 'Active');
	
		SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 5, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	----------------------------------------February Sales-----------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210201 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210202 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 5, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;

	----------------------------------------April Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210301 14:00', @CustomerId, @SalerId, 'Active')

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210302 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

	------------------------------------------May Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210401 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210402 14:00', @CustomerId, @SalerId, 'Active');

		SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

	----------------------------------------Customer 2---------------------------------------------

	SELECT @CustomerId = CustomerId
	FROM [External].Customer
	WHERE CustomerFirstName = 'Customer 2';

	-------------------------------------------2021------------------------------------------------
	--------------------------------------January Sales--------------------------------------------

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210104 00:00', @CustomerId, @SalerId, 'Active');


	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 3, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 10, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210106 16:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 11, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------February Sales-----------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210204 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210207 14:00', @CustomerId, @SalerId, 'Active');
		
	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;

	----------------------------------------April Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210313 23:59:59.001', @CustomerId, @SalerId, 'Active');
	
	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;	
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;	
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;	
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210320 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


	------------------------------------------May Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210415 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 3, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210430 23:59', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

	----------------------------------------Customer 3---------------------------------------------

	SELECT @CustomerId = CustomerId
	FROM [External].Customer
	WHERE CustomerFirstName = 'Customer 3';

	-------------------------------------------2021------------------------------------------------
	--------------------------------------January Sales--------------------------------------------

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210121 00:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 3, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 5, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210111 16:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;
		

	----------------------------------------February Sales-----------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210201 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 3, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210224 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 20, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------April Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210313 23:59:59.001', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210320 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


	------------------------------------------May Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210415 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 4 ROWS ONLY;
		

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES  ('20210430 23:59', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

	------------------------------------------Saler 2----------------------------------------------

	SELECT @SalerId = AppUserId 
	FROM [Internal].AppUser
	WHERE AppUserName = 'Saler 2';

	----------------------------------------Customer 1---------------------------------------------

	SELECT @CustomerId = CustomerId
	FROM [External].Customer
	WHERE CustomerFirstName = 'Customer 1';

	-------------------------------------------2021------------------------------------------------
	--------------------------------------January Sales--------------------------------------------

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210112 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;


	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210112 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------February Sales-----------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210211 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210212 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------April Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210311 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210312 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;


	------------------------------------------May Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210411 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210412 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------Customer 4---------------------------------------------

	SELECT @CustomerId = CustomerId
	FROM [External].Customer
	WHERE CustomerFirstName = 'Customer 4';

	-------------------------------------------2021------------------------------------------------
	--------------------------------------January Sales--------------------------------------------

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210104 00:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;
		
		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210106 16:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------February Sales-----------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210204 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 3, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210207 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------April Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210313 23:59:59.001', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210320 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;


	------------------------------------------May Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210415 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210430 23:59', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 3 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------Customer 5---------------------------------------------

	SELECT @CustomerId = CustomerId
	FROM [External].Customer
	WHERE CustomerFirstName = 'Customer 5';

	-------------------------------------------2021------------------------------------------------
	--------------------------------------January Sales--------------------------------------------

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210122 00:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 1, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210112 16:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 5, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;


	----------------------------------------February Sales-----------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210201 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 5, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210224 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 5 ROWS FETCH NEXT 1 ROWS ONLY;

	----------------------------------------April Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210313 23:59:59.001', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210320 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

	------------------------------------------May Sales-------------------------------------------
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210415 14:00', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;
		
	INSERT INTO [External].Sale (SaleDate, CustomerId, AppUserId, SaleStatus) 
	VALUES ('20210430 23:59', @CustomerId, @SalerId, 'Active');

	SET @SaleId = SCOPE_IDENTITY();

		INSERT INTO [External].SaleDetail (SaleId, ProductId, SaleDetailQuantity, SaleDetailUnitPrice)
		SELECT @SaleId, ProductId, 2, ProductPrice
		FROM [External].Product
		ORDER BY ProductPrice DESC, ProductId
		OFFSET 4 ROWS FETCH NEXT 1 ROWS ONLY;

END


