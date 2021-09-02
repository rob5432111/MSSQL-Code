CREATE ROLE [Internal_Role] AUTHORIZATION [dbo]
GO

--GRANT DATABASE WIDE PERMISSION
GRANT SHOWPLAN TO [Internal_Role];
GO
GRANT REFERENCES ON SCHEMA::[Internal] TO [Internal_Role];
GO
GRANT VIEW DATABASE STATE TO [Internal_Role];
GO
GRANT ALTER ON SCHEMA::[Internal] TO [Internal_Role]
GO
GRANT CONTROL ON SCHEMA::[Internal] TO [Internal_Role]
GO
GRANT SELECT ON SCHEMA::[Internal] TO [Internal_Role]
GO
GRANT INSERT ON SCHEMA::[Internal] TO [Internal_Role]
GO
GRANT DELETE ON SCHEMA::[Internal] TO [Internal_Role]
GO
--The permission to create table cannot be assigned to the schema, but since Internal_Role
--only has access to Internal Schema it cannot create tables under other schemas.
GRANT CREATE TABLE TO [Internal_Role]
GO