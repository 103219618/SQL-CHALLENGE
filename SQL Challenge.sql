-- NAME: Syed Asim Razvi
-- STUDENT ID: 103219618

/* RELATIONAL SCHEMA

Tour (TourName, Description)
PRIMARY KEY (TourName)

Client (ClientID, Surname, GivenName, Gender)
PRIMARY KEY (ClientID)

Event (TourName, EventYear, EventMonth, EventDay, Fee)
PRIMARY KEY (TourName, EventYear, EventMonth, EventDay)
FOREIGN KEY (TourName) References Tour

Booking (TourName, ClientID, EventYear, EventMonth, EventDay, DateBooked, Payment)
PRIMARY KEY (TourName, ClientID, EventYear, EventMonth, EventDay)
FOREIGN KEY (TourName, EventYear, EventMonth, EventDay) References Event
FOREIGN KEY (ClientID) References Client

*/

CREATE DATABASE SQLCHALLENGE;

IF OBJECT_ID('TOUR') IS NOT NULL
	DROP TABLE TOUR;
IF OBJECT_ID('CLIENT') IS NOT NULL
	DROP TABLE TOUR;
IF OBJECT_ID('EVENT') IS NOT NULL
	DROP TABLE TOUR;
IF OBJECT_ID('BOOKING') IS NOT NULL
	DROP TABLE TOUR;

GO

USE SQLCHALLENGE;
CREATE TABLE Tour
(
	TourName    NVARCHAR(100),
    Description NVARCHAR(500),
    PRIMARY KEY (TourName)
);

USE SQLCHALLENGE;
CREATE TABLE Client
(
    ClientID    INT,
    Surname     NVARCHAR(100) NOT NULL,
    GivenName   NVARCHAR(100) NOT NULL,
    Gender      NVARCHAR(1) CHECK (Gender in ('M', 'F', 'I')) NULL,
    PRIMARY KEY (ClientID)
);

USE SQLCHALLENGE;
CREATE TABLE Event
(
    TourName    NVARCHAR (100),
    EventYear   INT CHECK (EventYear between 0 and 9999),
    EventMonth  NVARCHAR(3) CHECK (EventMonth in ('Jan','Feb','Mar','Apr','May', 'Jun','Jul','Aug','Sep','Oct','Nov','Dec')),
    EventDay    INT CHECK (EventDay between 1 and 31),
    EventFee    MONEY CHECK (EventFee > 0) NOT NULL,
    PRIMARY KEY (TourName, EventYear, EventMonth, EventDay),
    FOREIGN KEY (TourName) References Tour
);

USE SQLCHALLENGE;
CREATE TABLE Booking
(
    ClientID    INT,
    TourName    NVARCHAR (100),
    EventYear   INT CHECK (EventYear between 0 and 9999),
    EventMonth  NVARCHAR(3) CHECK (EventMonth in ('Jan','Feb','Mar','Apr','May', 'Jun','Jul','Aug','Sep','Oct','Nov','Dec')),
    EventDay    INT CHECK (EventDay between 1 and 31),
    DateBooked  DATE NOT NULL,
    Payment     MONEY CHECK (Payment > 0) NULL,
    PRIMARY KEY (TourName, ClientID, EventYear, EventMonth, EventDay),
    FOREIGN KEY (TourName, EventYear, EventMonth, EventDay) References Event,
    FOREIGN KEY (ClientID) References Client
);


INSERT INTO Tour
    (TourName, Description)
VALUES
    ('North', 'Tour of wineries and outlets of the Bedigo and Castlemaine region'),
    ('South', 'Tour of wineries and outlets of Mornington Penisula'),
    ('West', 'Tour of wineries and outlets of the Geelong and Otways region');

INSERT INTO Client
    (ClientID, Surname, GivenName, Gender)
VALUES
    (4, 'Syed', 'Razvi', 'M')
    (1, 'Price', 'Taylor', 'M'),
    (2,'Gamble', 'Ellyse', 'F'),
    (3, 'Tan', 'Tilly', 'F');

INSERT INTO Event
    (TourName, EventYear, EventMonth, EventDay, EventFee)
VALUES
    ('North', 2016, 'Jan', 9, 200),
    ('North', 2016, 'Feb', 13, 225),
    ('South', 2016, 'Jan', 9, 200),
    ('South', 2016, 'Jan', 16, 200),
    ('West', 2016, 'Jan', 29, 225);

INSERT INTO Booking
    (ClientID, TourName, EventYear, EventMonth, EventDay, DateBooked, Payment)
VALUES
    (1, 'North', 2016, 'Jan', 9, '2015-12-10', 200),
    (2, 'North', 2016, 'Jan', 9, '2015-12-16', 200),
    (1, 'North', 2016, 'Feb', 13, '2016-01-08', 225),
    (2, 'North', 2016, 'Feb', 13, '2016-01-14', 125),
    (3, 'North', 2016, 'Feb', 13, '2016-02-03', 225),
    (1, 'South', 2016, 'Jan', 9, '2015-12-10', 200),
    (2, 'South', 2016, 'Jan', 16, '2015-12-18', 200),
    (3, 'South', 2016, 'Jan', 16, '2016-01-09', 200),
    (2, 'West', 2016, 'Jan', 29, '2015-12-17', 225),
    (3, 'West', 2016, 'Jan', 29, '2015-12-18', 200);





SELECT * FROM [Task 5];
