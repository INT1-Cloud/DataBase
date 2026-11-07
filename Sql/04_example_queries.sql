
USE CruiseShipDB;
-- Inspect individual tables
SELECT * FROM Ports;
SELECT * FROM Voyages;
SELECT * FROM Cabins;
SELECT * FROM Passengers;
SELECT * FROM Crew;
SELECT * FROM Activities;
SELECT * FROM Passenger_Activities;

-- Count rows in each table
SELECT 'Ports' AS TableName, COUNT(*) AS Total FROM Ports
UNION ALL SELECT 'Voyages', COUNT(*) FROM Voyages
UNION ALL SELECT 'Cabins', COUNT(*) FROM Cabins
UNION ALL SELECT 'Passengers', COUNT(*) FROM Passengers
UNION ALL SELECT 'Crew', COUNT(*) FROM Crew
UNION ALL SELECT 'Activities', COUNT(*) FROM Activities
UNION ALL SELECT 'Passenger_Activities', COUNT(*) FROM Passenger_Activities;

-- Show foreign key mappings
SELECT fk.name AS ForeignKeyName,
       OBJECT_NAME(fk.parent_object_id) AS ChildTable,
       COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS FKColumn,
       OBJECT_NAME(fk.referenced_object_id) AS ParentTable,
       COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS ReferencedColumn
FROM sys.foreign_keys AS fk
INNER JOIN sys.foreign_key_columns AS fkc ON fk.object_id = fkc.constraint_object_id;
