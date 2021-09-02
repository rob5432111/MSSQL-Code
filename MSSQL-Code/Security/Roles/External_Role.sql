CREATE ROLE [External_Role] AUTHORIZATION [dbo]
GO

--GRANT DATABASE WIDE PERMISSION
GRANT SHOWPLAN TO [External_Role];
GO
GRANT REFERENCES ON SCHEMA::[External] TO [External_Role];
GO
GRANT VIEW DATABASE STATE TO [External_Role];
GO
GRANT ALTER ON SCHEMA::[External] TO [External_Role]
GO
GRANT CONTROL ON SCHEMA::[External] TO [External_Role]
GO
GRANT SELECT ON SCHEMA::[External] TO [External_Role]
GO
GRANT INSERT ON SCHEMA::[External] TO [External_Role]
GO
GRANT DELETE ON SCHEMA::[External] TO [External_Role]
GO
--The permission to create table cannot be assigned to the schema, but since External_Role
--only has access to External Schema it cannot create tables under other schemas.
GRANT CREATE TABLE TO [External_Role]
GO