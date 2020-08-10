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


