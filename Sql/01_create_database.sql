-- SQL Server / T-SQL.
-- IMPORTANT: Run CREATE DATABASE as a standalone batch in SSMS.
-- Connect to master using the database dropdown BEFORE executing.
-- Ensure C:\SQLData exists and the SQL Server service can write there.
-- No GO batch separator is used.
CREATE DATABASE CruiseShipDB
ON PRIMARY
(
    NAME = N'CruiseShipDB_Primary',
    FILENAME = N'C:\SQLData\CruiseShipDB_Primary.mdf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
),
FILEGROUP SecondaryFG
(
    NAME = N'CruiseShipDB_Secondary',
    FILENAME = N'C:\SQLData\CruiseShipDB_Secondary.ndf',
    SIZE = 10MB,
    MAXSIZE = 100MB,
    FILEGROWTH = 5MB
)
LOG ON
(
    NAME = N'CruiseShipDB_Log1',
    FILENAME = N'C:\SQLData\CruiseShipDB_Log1.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
),
(
    NAME = N'CruiseShipDB_Log2',
    FILENAME = N'C:\SQLData\CruiseShipDB_Log2.ldf',
    SIZE = 5MB,
    MAXSIZE = 50MB,
    FILEGROWTH = 5MB
);
