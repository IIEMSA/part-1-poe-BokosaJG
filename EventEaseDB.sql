USE master;

-- Drop database if it exists
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'EventEaseDB')
BEGIN
    ALTER DATABASE EventEaseDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE EventEaseDB;
END

-- Create the new database
CREATE DATABASE EventEaseDB;

-- Switch to the new database
USE EventEaseDB;

CREATE TABLE Booking (
    BookingID INT IDENTITY(1,1) PRIMARY KEY,
    EventID INT NOT NULL,
    VenueID INT NOT NULL,
    BookingDate DATE NOT NULL,
    CONSTRAINT UQ_Booking UNIQUE (EventID, VenueID)
);

-- Insert booking data (reference existing EventID 1 and VenueID 1)
INSERT INTO Booking (EventID, VenueID, BookingDate)
VALUES (1, 3, '2025-05-10');
-- Venue Table
CREATE TABLE Venue (
    VenueID INT IDENTITY(1,1) PRIMARY KEY,
    VenueName VARCHAR(350) NOT NULL,
    Location VARCHAR(350) NOT NULL,
    Capacity INT NOT NULL,
    Image_Url VARCHAR(500)
);

-- Insert venue data
INSERT INTO Venue (VenueName, Location, Capacity, Image_Url)
VALUES ('Anfield', 'London', 50000, 'http://example.com/venue-image.jpg');

-- Event Table
CREATE TABLE Event (
    EventID INT IDENTITY(1,1) PRIMARY KEY,
    EventName VARCHAR(350) NOT NULL,
    EventDate DATE NOT NULL,
    Description VARCHAR(MAX),
    VenueID INT NULL,
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID)
);

-- Insert event data (note: using VenueID 1 which we just inserted)
INSERT INTO Event (EventName, EventDate, Description, VenueID)
VALUES ('Gods Tour', '2025-10-11', 'Yessir', 1);

-- Booking Table


-- Verify all data
SELECT * FROM Booking;
SELECT * FROM Venue;
SELECT * FROM Event;
