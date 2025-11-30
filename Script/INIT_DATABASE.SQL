/*
=============================================================
Create Database and Schemas
=============================================================

Script Purpose:
    - Checks if the 'DataWarehouse' database already exists.
    - If it exists:
        • Forces the database into SINGLE_USER mode.
        • Rolls back active connections immediately.
        • Drops the database completely.
    - Creates a fresh 'DataWarehouse' database.
    - Adds the required schemas:
        • bronze  → Raw data layer
        • silver  → Cleaned/standardized data layer
        • gold    → Business-ready analytics layer

WARNING:
    - This script will PERMANENTLY DELETE the 'DataWarehouse' database if it exists.
    - All data, tables, procedures, and objects will be lost.
    - Ensure backups are taken before executing this script.
*/


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
CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

-- Create Schemas
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
