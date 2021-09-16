CREATE ROLE [DW_Role] AUTHORIZATION [dbo]
GO

--GRANT DATABASE WIDE PERMISSION
GRANT SHOWPLAN TO [DW_Role];
GO
GRANT REFERENCES ON SCHEMA::[DW] TO [DW_Role];
GO
GRANT VIEW DATABASE STATE TO [DW_Role];
GO
GRANT ALTER ON SCHEMA::[DW] TO [DW_Role]
GO
GRANT CONTROL ON SCHEMA::[DW] TO [DW_Role]
GO
GRANT SELECT ON SCHEMA::[DW] TO [DW_Role]
GO
GRANT INSERT ON SCHEMA::[DW] TO [DW_Role]
GO
GRANT DELETE ON SCHEMA::[DW] TO [DW_Role]
GO
--The permission to create table cannot be assigned to the schema, but since DW_Role
--only has access to DW Schema it cannot create tables under other schemas.
GRANT CREATE TABLE TO [DW_Role]
GO