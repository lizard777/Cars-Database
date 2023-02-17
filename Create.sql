
CREATE DATABASE PK_Tit;
USE PK_Tit;

CREATE TABLE ParkingLot (
	LotID CHAR(5) PRIMARY KEY
);

CREATE TABLE Block (
	BlockCode CHAR(3) NOT NULL,
    LotID CHAR(5),
    PRIMARY KEY (BlockCode, LotID),
    FOREIGN KEY (LotID) REFERENCES ParkingLot(LotID) ON DELETE CASCADE
);

CREATE TABLE Stall (
	StallNumber NUMERIC,
    CarSize INT CHECK(CarSize > 10), 
    CarType VARCHAR(10),
    LotID CHAR(5),
    BlockCode CHAR(3),
    CONSTRAINT PK_Stall PRIMARY KEY (StallNumber, LotID, BlockCode),
	FOREIGN KEY (LotID) REFERENCES ParkingLot(LotID) ON DELETE CASCADE,
	FOREIGN KEY (BlockCode) REFERENCES Block(BlockCode) ON DELETE CASCADE
);

CREATE TABLE Customer  (
	CustomerID CHAR(5) PRIMARY KEY
);

CREATE TABLE Employee (
	EmployeeID CHAR(5) PRIMARY KEY
);

CREATE TABLE Vehicle (
	LicensePlateNumber VARCHAR(6) PRIMARY KEY,
    Make VARCHAR(30),
    CustomerID CHAR(5), 
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE SET NULL
);

CREATE TABLE VehicleColour (
	Colour VARCHAR(10),
    LicensePlateNumber VARCHAR(6),
    PRIMARY KEY (Colour, LicensePlateNumber),
    FOREIGN KEY (LicensePlateNumber) REFERENCES Vehicle(LicensePlateNumber) ON DELETE CASCADE
);

CREATE TABLE Customer_parksIn_stall (
	StallNumber NUMERIC CHECK(StallNumber > 0), 
    CustomerID CHAR(5),
    PRIMARY KEY (StallNumber, CustomerID),
    FOREIGN KEY (StallNumber) REFERENCES Stall(StallNumber) ON DELETE CASCADE, 
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

CREATE TABLE Ticket (
	TicketNumber NUMERIC CHECK(TicketNumber > 0) PRIMARY KEY,
    TDate DATE, 
    TTime TIME, 
    FineAmount NUMERIC(5,2) CHECK(FineAmount > 0), 
    StallNumber NUMERIC CHECK(StallNumber > 0), 
    LicensePlateNumber VARCHAR(6),
    EmployeeID CHAR(5),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE SET NULL,
    FOREIGN KEY (LicensePlateNumber) REFERENCES Vehicle(LicensePlateNumber) ON DELETE SET NULL
);

CREATE TABLE Ticket_issuedBy_employee (
	TicketNumber NUMERIC CHECK(TicketNumber > 0) PRIMARY KEY, 
    EmployeeID CHAR(5),
    FOREIGN KEY (TicketNumber) REFERENCES Ticket(TicketNumber) ON DELETE CASCADE,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE
);

CREATE TABLE Customer_has_ticket (
	TicketNumber NUMERIC CHECK(TicketNumber > 0) PRIMARY KEY,
    CustomerID CHAR(5),
    FOREIGN KEY (TicketNumber) REFERENCES Ticket(TicketNumber) ON DELETE CASCADE,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

CREATE TABLE Pass (
	PassNumber NUMERIC CHECK(PassNumber > 0) PRIMARY KEY,
    Cost NUMERIC(5,2) CHECK(Cost > 0), 
    Startdate DATE, 
    Enddate DATE,
    CheckInTime TIME,
    CustomerID CHAR(5),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE
);

CREATE TABLE RegularPass (
	PassNumber NUMERIC CHECK(PassNumber > 0) PRIMARY KEY,
    PassType CHAR(10),
    FOREIGN KEY (PassNumber) REFERENCES Pass(PassNumber) ON DELETE CASCADE
);

CREATE TABLE DayPass (
	PassNumber NUMERIC CHECK(PassNumber > 0) PRIMARY KEY,
    FOREIGN KEY (PassNumber) REFERENCES Pass(PassNumber) ON DELETE CASCADE
);

CREATE TABLE Vehicle_ownes_day  (
	PassNumber NUMERIC CHECK(PassNumber > 0) PRIMARY KEY, 
    LicensePlateNumber VARCHAR(6),
    FOREIGN KEY (PassNumber) REFERENCES Pass(PassNumber) ON DELETE CASCADE,
    FOREIGN KEY (LicensePlateNumber) REFERENCES Vehicle(LicensePlateNumber) ON DELETE CASCADE
);


DROP TABLE Vehicle_ownes_day;
DROP TABLE Customer_has_ticket ;
DROP TABLE Ticket_issuedBy_employee ;
DROP TABLE Customer_parksIn_stall ;
DROP TABLE VehicleColour ;
DROP TABLE RegularPass ;
DROP TABLE DayPass ;
DROP TABLE Pass ;
DROP TABLE Ticket ;
DROP TABLE Employee ;
DROP TABLE Vehicle ;
DROP TABLE Customer ;
DROP TABLE Stall ;
DROP TABLE Block ;
DROP TABLE ParkingLot ;
DROP DATABASE PK_Tit;