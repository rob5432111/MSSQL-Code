--Examples for the salary table

IF NOT EXISTS (SELECT 'Exists' FROM [Internal].Salary)
BEGIN
	INSERT INTO [Internal].Salary (AppUserId, SalaryStartDate, SalaryEndDate, SalaryAmount )
	SELECT AppUserId, SalaryStartDate = GETDATE(), NULL	
	, SalaryAmount = CASE WHEN AppUserType = 'Manager' THEN 1500 ELSE 1000 END
	FROM [Internal].AppUser
	WHERE AppUserType IN ('Saler', 'Manager');
END