USE master;
GO
  
-- Drop and recreate the 'DataWarehouse' database
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
  ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
  DROP DATABASE DataWarehouse;
END;
GO

-- Create the 'DataWarehouse' database
CREATE DATABASE DataWarehouse

USE DataWarehouse;

-- Create Schemas

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO -- separate batches when working with multiple SQL statements
CREATE SCHEMA gold;
