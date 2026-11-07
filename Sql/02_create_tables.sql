-- Run AFTER 01_create_database.sql.
USE CruiseShipDB;

-- 1. Ports: parent of Voyages
CREATE TABLE Ports (
    PortID INT IDENTITY(1,1) NOT NULL,
    PortName VARCHAR(100) NOT NULL,
    Country VARCHAR(100) NOT NULL,
    DockingFee DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_Ports PRIMARY KEY (PortID),
    CONSTRAINT UQ_Ports_PortName UNIQUE (PortName),
    CONSTRAINT CK_Ports_DockingFee CHECK (DockingFee >= 0)
);

-- 2. Voyages: each voyage shows a departure port
CREATE TABLE Voyages (
    VoyageID INT IDENTITY(1,1) NOT NULL,
    VoyageCode VARCHAR(20) NOT NULL,
    DepartureDate DATE NOT NULL,
    ReturnDate DATE NOT NULL,
    VoyageStatus VARCHAR(20) NOT NULL CONSTRAINT DF_Voyages_Status DEFAULT ('Scheduled'),
    DeparturePortID INT NOT NULL,
    CONSTRAINT PK_Voyages PRIMARY KEY (VoyageID),
    CONSTRAINT UQ_Voyages_VoyageCode UNIQUE (VoyageCode),
    CONSTRAINT CK_Voyages_Status CHECK (VoyageStatus IN ('Scheduled','Active','Completed','Cancelled')),
    CONSTRAINT FK_Voyages_Ports FOREIGN KEY (DeparturePortID) REFERENCES Ports(PortID)
);

-- 3. Cabins: each cabin record references a voyage
CREATE TABLE Cabins (
    CabinID INT IDENTITY(1,1) NOT NULL,
    CabinNumber VARCHAR(10) NOT NULL,
    CabinType VARCHAR(20) NOT NULL,
    PricePerNight DECIMAL(10,2) NOT NULL,
    VoyageID INT NOT NULL,
    CONSTRAINT PK_Cabins PRIMARY KEY (CabinID),
    CONSTRAINT UQ_Cabins_CabinNumber UNIQUE (CabinNumber),
    CONSTRAINT CK_Cabins_Type CHECK (CabinType IN ('Inside','OceanView','Balcony','Suite')),
    CONSTRAINT CK_Cabins_Price CHECK (PricePerNight > 0),
    CONSTRAINT FK_Cabins_Voyages FOREIGN KEY (VoyageID) REFERENCES Voyages(VoyageID)
);

-- 4. Passengers: each passenger references a cabin
CREATE TABLE Passengers (
    PassengerID INT IDENTITY(1,1) NOT NULL,
    First_name VARCHAR(50) NOT NULL,
    Last_name VARCHAR(50) NOT NULL,
    Reg_date DATE NOT NULL CONSTRAINT DF_Passengers_RegDate DEFAULT (GETDATE()),
    Email VARCHAR(150) NOT NULL,
    PassportNo VARCHAR(30) NOT NULL,
    CabinID INT NOT NULL,
    CONSTRAINT PK_Passengers PRIMARY KEY (PassengerID),
    CONSTRAINT UQ_Passengers_Email UNIQUE (Email),
    CONSTRAINT UQ_Passengers_Passport UNIQUE (PassportNo),
    CONSTRAINT FK_Passengers_Cabins FOREIGN KEY (CabinID) REFERENCES Cabins(CabinID)
);

-- 5. Crew: assigned to a voyage
CREATE TABLE Crew (
    CrewID INT IDENTITY(1,1) NOT NULL,
    FullName VARCHAR(100) NOT NULL,
    RoleTitle VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL,
    HireDate DATE NOT NULL,
    VoyageID INT NOT NULL,
    CONSTRAINT PK_Crew PRIMARY KEY (CrewID),
    CONSTRAINT CK_Crew_Salary CHECK (Salary > 0),
    CONSTRAINT FK_Crew_Voyages FOREIGN KEY (VoyageID) REFERENCES Voyages(VoyageID)
);

-- 6. Activities: parent of Passenger_Activities
CREATE TABLE Activities (
    ActivityID INT IDENTITY(1,1) NOT NULL,
    ActivityName VARCHAR(100) NOT NULL,
    LocationOnDeck VARCHAR(50) NOT NULL,
    Cost DECIMAL(8,2) NOT NULL CONSTRAINT DF_Activities_Cost DEFAULT (0.00),
    CONSTRAINT PK_Activities PRIMARY KEY (ActivityID),
    CONSTRAINT CK_Activities_Cost CHECK (Cost >= 0)
);

-- 7. Passenger_Activities: M:N junction / booking table
CREATE TABLE Passenger_Activities (
    BookingID INT IDENTITY(1,1) NOT NULL,
    PassengerID INT NOT NULL,
    ActivityID INT NOT NULL,
    BookingDate DATE NOT NULL CONSTRAINT DF_PassAct_Date DEFAULT (GETDATE()),
    TicketsCount INT NOT NULL,
    CONSTRAINT PK_Passenger_Activities PRIMARY KEY (BookingID),
    CONSTRAINT CK_PassAct_Tickets CHECK (TicketsCount >= 1),
    CONSTRAINT FK_PassAct_Passengers FOREIGN KEY (PassengerID) REFERENCES Passengers(PassengerID),
    CONSTRAINT FK_PassAct_Activities FOREIGN KEY (ActivityID) REFERENCES Activities(ActivityID)
);
