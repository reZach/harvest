begin transaction

DECLARE @sql NVARCHAR(max) = '' 

-- delete constraints
print N'Deleting constraints'
SELECT @sql = N'ALTER TABLE ' + QUOTENAME(OBJECT_SCHEMA_NAME(parent_object_id)) + '.' + QUOTENAME(OBJECT_NAME(parent_object_id)) + ' DROP CONSTRAINT ' + QUOTENAME(name) + ';'
FROM sys.foreign_keys;

Exec Sp_executesql @sql 

-- drop tables
print N'Dropping tables'
SELECT @sql = N' DROP TABLE ' + QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) + '; '
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE' Exec Sp_executesql @sql 

rollback transaction