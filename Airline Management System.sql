create database airline_management_system;
use airline_management_system;

CREATE TABLE Passenger (
    passengerid INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phonenumber VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    sourcefrom VARCHAR(50),      
    destinationto VARCHAR(50),   
    address TEXT,
    dob DATE,
    passportno VARCHAR(20) UNIQUE,
    city VARCHAR(50),
    locality VARCHAR(100),
    caste VARCHAR(50),            
    gender VARCHAR(10)
);

CREATE TABLE Airport (
    airportid INT PRIMARY KEY AUTO_INCREMENT,
    airportname VARCHAR(100) NOT NULL,
    airportlocation VARCHAR(100),
    airportcountry VARCHAR(50),
    airportcode VARCHAR(10) UNIQUE,
    flightarrivalcount INT,     
    flightdeparturecount INT    
);

CREATE TABLE Aircraft (
    aircraftid INT PRIMARY KEY AUTO_INCREMENT,
    aircraftname VARCHAR(100) NOT NULL,
    passengercapacity INT,
    totalseats INT,
    model VARCHAR(50)
);

CREATE TABLE Flights (
    flightnumber VARCHAR(20) PRIMARY KEY,
    aircraftid INT,
    flightstatus VARCHAR(50),
    sourceairportid INT,      
    destinationairportid INT, 
    departuredatetime DATETIME,
    arrivaldatetime DATETIME,
    economyprice DECIMAL(10, 2),
    businessprice DECIMAL(10, 2),
    FOREIGN KEY (aircraftid) REFERENCES Aircraft(aircraftid),
    FOREIGN KEY (sourceairportid) REFERENCES Airport(airportid),
    FOREIGN KEY (destinationairportid) REFERENCES Airport(airportid)
);

CREATE TABLE Booking (
    bookingid INT PRIMARY KEY AUTO_INCREMENT,
    passengerid INT,           
    passengername VARCHAR(100),
    passengermailid VARCHAR(100),
    seatno VARCHAR(10),
    seatclass VARCHAR(20),
    bookingdate DATETIME,
    bookingstatus VARCHAR(50),
    flightid VARCHAR(20),
    FOREIGN KEY (passengerid) REFERENCES Passenger(passengerid),
    FOREIGN KEY (flightid) REFERENCES Flights(flightnumber)
);

CREATE TABLE Tickets (
    transactionid INT PRIMARY key,
    ticketno VARCHAR(50) UNIQUE, 
    issuedate DATETIME,
    seatno VARCHAR(10),
    entrygateno VARCHAR(10),
    bookingid INT,
    boardingtime DATETIME,
    flightdeparturetime DATETIME,
    FOREIGN KEY (bookingid) REFERENCES Booking(bookingid)
);

CREATE TABLE Payments (
    paymentid INT PRIMARY KEY,
    ticketno VARCHAR(50),
    amount DECIMAL(10, 2),
    bookingid INT,
    paymentdate DATETIME,
    paymentmethod VARCHAR(50),
    paymentstatus VARCHAR(50),
    FOREIGN KEY (bookingid) REFERENCES Booking(bookingid),
    FOREIGN KEY (ticketno) REFERENCES Tickets(ticketno)
);
INSERT INTO Passenger (passengerid, name, phonenumber, email, sourcefrom, destinationto, address, dob, passportno, city, locality, caste, gender) VALUES
(101, 'Amit Sharma', '9876543210', 'amit.sharma@email.com', 'Delhi', 'Mumbai', '12, MG Road', '1990-05-14', 'A1234567', 'Delhi', 'Connaught Place', 'General', 'Male'),
(102, 'Priya Singh', '9876543211', 'priya.singh@email.com', 'Mumbai', 'Bangalore', '34, Link Road', '1992-08-21', 'B2345678', 'Mumbai', 'Andheri', 'General', 'Female'),
(103, 'Rahul Verma', '9876543212', 'rahul.verma@email.com', 'Bangalore', 'Chennai', '56, Brigade Road', '1988-11-02', 'C3456789', 'Bangalore', 'Indiranagar', 'OBC', 'Male'),
(104, 'Neha Gupta', '9876543213', 'neha.gupta@email.com', 'Chennai', 'Kolkata', '78, Anna Salai', '1995-02-18', 'D4567890', 'Chennai', 'T Nagar', 'General', 'Female'),
(105, 'Vikram Yadav', '9876543214', 'vikram.yadav@email.com', 'Kolkata', 'Hyderabad', '90, Park Street', '1985-07-25', 'E5678901', 'Kolkata', 'Salt Lake', 'OBC', 'Male'),
(106, 'Pooja Reddy', '9876543215', 'pooja.reddy@email.com', 'Hyderabad', 'Pune', '12, Jubilee Hills', '1993-09-12', 'F6789012', 'Hyderabad', 'Banjara Hills', 'General', 'Female'),
(107, 'Ankit Patel', '9876543216', 'ankit.patel@email.com', 'Pune', 'Ahmedabad', '34, FC Road', '1991-04-30', 'G7890123', 'Pune', 'Deccan', 'General', 'Male'),
(108, 'Sneha Joshi', '9876543217', 'sneha.joshi@email.com', 'Ahmedabad', 'Jaipur', '56, CG Road', '1994-12-05', 'H8901234', 'Ahmedabad', 'Navrangpura', 'General', 'Female'),
(109, 'Rohan Das', '9876543218', 'rohan.das@email.com', 'Jaipur', 'Lucknow', '78, MI Road', '1989-03-22', 'I9012345', 'Jaipur', 'Malviya Nagar', 'SC', 'Male'),
(110, 'Kavita Mishra', '9876543219', 'kavita.mishra@email.com', 'Lucknow', 'Delhi', '90, Hazratganj', '1996-06-10', 'J0123456', 'Lucknow', 'Gomti Nagar', 'General', 'Female');

INSERT INTO Airport (airportid, airportname, airportlocation, airportcountry, airportcode, flightarrivalcount, flightdeparturecount) VALUES
(1, 'Indira Gandhi International', 'Delhi', 'India', 'DEL', 500, 510),
(2, 'Chhatrapati Shivaji Maharaj', 'Mumbai', 'India', 'BOM', 450, 460),
(3, 'Kempegowda International', 'Bangalore', 'India', 'BLR', 300, 305),
(4, 'Chennai International', 'Chennai', 'India', 'MAA', 200, 210),
(5, 'Netaji Subhas Chandra Bose', 'Kolkata', 'India', 'CCU', 150, 155),
(6, 'Rajiv Gandhi International', 'Hyderabad', 'India', 'HYD', 250, 245),
(7, 'Pune International Airport', 'Pune', 'India', 'PNQ', 100, 105),
(8, 'Sardar Vallabhbhai Patel', 'Ahmedabad', 'India', 'AMD', 120, 125),
(9, 'Jaipur International Airport', 'Jaipur', 'India', 'JAI', 80, 85),
(10, 'Chaudhary Charan Singh', 'Lucknow', 'India', 'LKO', 60, 65);

INSERT INTO Aircraft (aircraftid, aircraftname, passengercapacity, totalseats, model) VALUES
(1, 'Boeing 737 Max', 180, 180, '737-800'),
(2, 'Airbus A320neo', 195, 195, 'A320'),
(3, 'Boeing 777', 350, 350, '777-300ER'),
(4, 'Airbus A350', 300, 300, 'A350-900'),
(5, 'Boeing 787 Dreamliner', 250, 250, '787-9'),
(6, 'ATR 72', 78, 78, '72-600'),
(7, 'Bombardier Q400', 90, 90, 'Q400'),
(8, 'Embraer E190', 114, 114, 'E190'),
(9, 'Airbus A380', 525, 525, 'A380-800'),
(10, 'Boeing 747', 416, 416, '747-8');


INSERT INTO Flights (flightnumber, aircraftid, flightstatus, sourceairportid, destinationairportid, departuredatetime, arrivaldatetime, economyprice, businessprice) VALUES
('AI101', 1, 'Scheduled', 1, 2, '2026-09-10 08:00:00', '2026-09-10 10:15:00', 4500.00, 15000.00),
('6E202', 2, 'On Time', 2, 3, '2026-09-11 09:30:00', '2026-09-11 11:15:00', 3500.00, 12000.00),
('SG303', 6, 'Delayed', 3, 4, '2026-09-12 14:00:00', '2026-09-12 15:30:00', 2500.00, 8000.00),
('UK404', 3, 'Scheduled', 4, 5, '2026-09-13 18:45:00', '2026-09-13 21:00:00', 5500.00, 18000.00),
('QP505', 4, 'Scheduled', 5, 6, '2026-09-14 06:15:00', '2026-09-14 08:20:00', 4000.00, 14000.00),
('AI606', 5, 'On Time', 6, 7, '2026-09-15 11:00:00', '2026-09-15 12:20:00', 3000.00, 10000.00),
('6E707', 2, 'Scheduled', 7, 8, '2026-09-16 16:30:00', '2026-09-16 17:45:00', 2800.00, 9500.00),
('SG808', 7, 'Scheduled', 8, 9, '2026-09-17 19:00:00', '2026-09-17 20:10:00', 2200.00, 7500.00),
('UK909', 1, 'Scheduled', 9, 10, '2026-09-18 07:30:00', '2026-09-18 08:40:00', 2600.00, 8500.00),
('QP110', 8, 'Scheduled', 10, 1, '2026-09-19 21:00:00', '2026-09-19 22:15:00', 3200.00, 11000.00);


INSERT INTO Booking (bookingid, passengerid, passengername, passengermailid, seatno, seatclass, bookingdate, bookingstatus, flightid) VALUES
(1, 101, 'Amit Sharma', 'amit.sharma@email.com', '12A', 'Economy', '2026-09-01 10:00:00', 'Confirmed', 'AI101'),
(2, 102, 'Priya Singh', 'priya.singh@email.com', '1A', 'Business', '2026-09-02 11:30:00', 'Confirmed', '6E202'),
(3, 103, 'Rahul Verma', 'rahul.verma@email.com', '14C', 'Economy', '2026-09-03 14:15:00', 'Confirmed', 'SG303'),
(4, 104, 'Neha Gupta', 'neha.gupta@email.com', '2B', 'Business', '2026-09-04 09:45:00', 'Confirmed', 'UK404'),
(5, 105, 'Vikram Yadav', 'vikram.yadav@email.com', '18F', 'Economy', '2026-09-05 16:20:00', 'Confirmed', 'QP505'),
(6, 106, 'Pooja Reddy', 'pooja.reddy@email.com', '3C', 'Business', '2026-09-06 12:10:00', 'Confirmed', 'AI606'),
(7, 107, 'Ankit Patel', 'ankit.patel@email.com', '22D', 'Economy', '2026-09-07 08:05:00', 'Confirmed', '6E707'),
(8, 108, 'Sneha Joshi', 'sneha.joshi@email.com', '5A', 'Economy', '2026-09-08 19:30:00', 'Confirmed', 'SG808'),
(9, 109, 'Rohan Das', 'rohan.das@email.com', '4D', 'Business', '2026-09-09 21:15:00', 'Confirmed', 'UK909'),
(10, 110, 'Kavita Mishra', 'kavita.mishra@email.com', '15B', 'Economy', '2026-09-10 22:45:00', 'Confirmed', 'QP110');

-- 6. Tickets Table Entries
INSERT INTO Tickets (transactionid, ticketno, issuedate, seatno, entrygateno, bookingid, boardingtime, flightdeparturetime) VALUES
(1001, 'TKT001', '2026-09-01 10:05:00', '12A', 'G1', 1, '2026-09-10 07:15:00', '2026-09-10 08:00:00'),
(1002, 'TKT002', '2026-09-02 11:35:00', '1A', 'G2', 2, '2026-09-11 08:45:00', '2026-09-11 09:30:00'),
(1003, 'TKT003', '2026-09-03 14:20:00', '14C', 'G3', 3, '2026-09-12 13:15:00', '2026-09-12 14:00:00'),
(1004, 'TKT004', '2026-09-04 09:50:00', '2B', 'G4', 4, '2026-09-13 18:00:00', '2026-09-13 18:45:00'),
(1005, 'TKT005', '2026-09-05 16:25:00', '18F', 'G5', 5, '2026-09-14 05:30:00', '2026-09-14 06:15:00'),
(1006, 'TKT006', '2026-09-06 12:15:00', '3C', 'G6', 6, '2026-09-15 10:15:00', '2026-09-15 11:00:00'),
(1007, 'TKT007', '2026-09-07 08:10:00', '22D', 'G7', 7, '2026-09-16 15:45:00', '2026-09-16 16:30:00'),
(1008, 'TKT008', '2026-09-08 19:35:00', '5A', 'G8', 8, '2026-09-17 18:15:00', '2026-09-17 19:00:00'),
(1009, 'TKT009', '2026-09-09 21:20:00', '4D', 'G9', 9, '2026-09-18 06:45:00', '2026-09-18 07:30:00'),
(1010, 'TKT010', '2026-09-10 22:50:00', '15B', 'G10', 10, '2026-09-19 20:15:00', '2026-09-19 21:00:00');


INSERT INTO Payments (paymentid, ticketno, amount, bookingid, paymentdate, paymentmethod, paymentstatus) VALUES
(5001, 'TKT001', 4500.00, 1, '2026-09-01 10:02:00', 'Credit Card', 'Completed'),
(5002, 'TKT002', 12000.00, 2, '2026-09-02 11:32:00', 'UPI', 'Completed'),
(5003, 'TKT003', 2500.00, 3, '2026-09-03 14:17:00', 'Debit Card', 'Completed'),
(5004, 'TKT004', 18000.00, 4, '2026-09-04 09:47:00', 'Net Banking', 'Completed'),
(5005, 'TKT005', 4000.00, 5, '2026-09-05 16:22:00', 'Credit Card', 'Completed'),
(5006, 'TKT006', 10000.00, 6, '2026-09-06 12:12:00', 'UPI', 'Completed'),
(5007, 'TKT007', 2800.00, 7, '2026-09-07 08:07:00', 'Debit Card', 'Completed'),
(5008, 'TKT008', 2200.00, 8, '2026-09-08 19:32:00', 'UPI', 'Completed'),
(5009, 'TKT009', 8500.00, 9, '2026-09-09 21:17:00', 'Credit Card', 'Completed'),
(5010, 'TKT010', 3200.00, 10, '2026-09-10 22:47:00', 'Net Banking', 'Completed');

-- Display the details of all passengers.
SELECT * FROM Passenger;

-- Display all flights
SELECT * FROM Flights;

-- Find flights departing only from delhi 
SELECT Flights.* FROM Flights JOIN Airport ON Flights.sourceairportid = Airport.airportid
WHERE Airport.airportlocation = 'Delhi';

-- Find flights with an economy price of less than ₹5,000.
SELECT * FROM Flights WHERE economyprice < 5000;

-- Display all confirm bookings
select * from booking where bookingstatus = 'confirmed';

-- Display all cancelled bookings
select * from booking where bookingstatus = 'cancelled';

-- Display all business-class bookings.
SELECT * FROM Booking WHERE seatclass = 'Business';

-- Display all passengers who have a password 
SELECT * FROM Passenger WHERE passportno IS NOT NULL AND passportno != '';

-- How many total passengers are there 
SELECT COUNT(*) AS TotalPassengers FROM Passenger;

-- How many total flights are there 
select count(*) AS Totalflights from Flights;

-- Find the average economy ticket price 
select avg(economyprice) as AverageEconomyPrice from Flights;

-- Find maximum business ticket price
select max(businessprice) as MaximumBusinessPrice from Flights;

-- Find minimum economy ticket price
select min(economyprice) as MinimumEconomyPrice from Flights;

-- Find the total number of booking
SELECT COUNT(*) AS TotalBookings FROM Booking;

-- Find the total payment amount.
SELECT SUM(amount) AS TotalPaymentAmount FROM Payments;

-- Find the total number of bookings for each flight.
SELECT flightid, COUNT(*) AS TotalBookings FROM Booking GROUP BY flightid;

-- Find how many flights departed from each airport.
SELECT Airport.airportname, COUNT(Flights.flightnumber) AS TotalDepartures
FROM Airport JOIN Flights ON Airport.airportid = Flights.sourceairportid GROUP BY Airport.airportname;

-- 	Find the total number of flights for each airline 
SELECT LEFT(flightnumber, 2) AS AirlineCode, COUNT(flightnumber) AS TotalFlights
FROM Flights
GROUP BY LEFT(flightnumber, 2);

-- Find the number of bookings in each seat class.
SELECT seatclass, COUNT(bookingid) AS TotalBookings
FROM Booking
GROUP BY seatclass;

-- Display flights that have more than 5 bookings.
SELECT flightid, COUNT(bookingid) AS TotalBookings
FROM Booking GROUP BY flightid HAVING COUNT(bookingid) > 1;

-- Display Flight number and passenger name 
SELECT Passenger.name, Booking.flightid
FROM Passenger
JOIN Booking ON Passenger.passengerid = Booking.passengerid;

-- Display Flight number, passenger name and booking status 
SELECT passengername, flightid, bookingstatus FROM Booking;

-- Display the flight number along with the source and destination cities.
SELECT Flights.flightnumber, SourceAirport.airportlocation AS SourceCity, DestinationAirport.airportlocation AS DestinationCity
FROM Flights JOIN Airport AS SourceAirport ON Flights.sourceairportid = SourceAirport.airportid
JOIN Airport AS DestinationAirport ON Flights.destinationairportid = DestinationAirport.airportid;
    
-- Display passenger name, seat no. and seat class
SELECT passengername, seatno, seatclass
FROM Booking;

-- Display the passenger name and ticket number.
SELECT Passenger.name, Tickets.ticketno
FROM Passenger
JOIN Booking ON Passenger.passengerid = Booking.passengerid
JOIN Tickets ON Booking.bookingid = Tickets.bookingid;

-- Display the passenger name and payment amount.
SELECT Passenger.name, Payments.amount
FROM Passenger
JOIN Booking ON Passenger.passengerid = Booking.passengerid
JOIN Payments ON Booking.bookingid = Payments.bookingid;

-- Display the flight number, aircraft model, and total seats.
SELECT Flights.flightnumber, Aircraft.model, Aircraft.totalseats
FROM Flights
JOIN Aircraft ON Flights.aircraftid = Aircraft.aircraftid;

-- Display the source airport and destination airport for all flights.
SELECT Flights.flightnumber, SourceAirport.airportname AS SourceAirport, DestinationAirport.airportname AS DestinationAirport
FROM Flights JOIN Airport AS SourceAirport ON Flights.sourceairportid = SourceAirport.airportid
JOIN Airport AS DestinationAirport ON Flights.destinationairportid = DestinationAirport.airportid;

-- Find the flight with the highest number of bookings.
SELECT flightid, COUNT(bookingid) AS TotalBookings
FROM Booking GROUP BY flightid ORDER BY TotalBookings DESC LIMIT 1;

-- Find the most expensive economy flight.
SELECT * FROM Flights ORDER BY economyprice DESC LIMIT 1;

-- Find passengers who have booked more than one flight.
SELECT passengerid, passengername, COUNT(bookingid) AS TotalBookings
FROM Booking
GROUP BY passengerid, passengername
HAVING COUNT(bookingid) > 1;

-- Find passengers who have not made any booking yet.
SELECT passengerid, name FROM Passenger WHERE passengerid NOT IN (SELECT passengerid FROM Booking);

-- Find flights that have no bookings.
SELECT flightnumber FROM Flights WHERE flightnumber NOT IN (SELECT flightid FROM Booking);

-- Find the total payment made by each passenger.
SELECT Passenger.passengerid, Passenger.name, SUM(Payments.amount) AS TotalPaymentMade
FROM Passenger JOIN Booking ON Passenger.passengerid = Booking.passengerid JOIN Payments 
ON Booking.bookingid = Payments.bookingid GROUP BY Passenger.passengerid, Passenger.name;

-- Find the total revenue generated by each flight.
SELECT Booking.flightid, 
SUM(Payments.amount) AS TotalRevenue FROM Booking JOIN Payments ON Booking.bookingid = Payments.bookingid GROUP BY Booking.flightid;

-- Find the flight with the highest revenue.
SELECT Booking.flightid, SUM(Payments.amount) AS TotalRevenue
FROM Booking JOIN Payments ON Booking.bookingid = Payments.bookingid GROUP BY Booking.flightid ORDER BY TotalRevenue DESC LIMIT 1;

-- Find the passenger with the highest number of bookings.
SELECT passengerid, passengername, COUNT(bookingid) AS TotalBookings
FROM Booking GROUP BY passengerid, passengername ORDER BY TotalBookings DESC LIMIT 1;

-- Find flights whose economy price is higher than the average economy price.
SELECT flightnumber, economyprice FROM Flights WHERE economyprice > (SELECT AVG(economyprice) FROM Flights);

  -- Find passengers who have booked a flight from Delhi to Mumbai.
  select Passenger.name from Passenger join Booking On Passenger.passengerid = Booking.passengerid Join Flights On Booking.flightid = Flights.flightnumber 
  join Airport as SourceAirport on Flights.sourceairportid = SourceAirport.airportid Join Airport As DestinationAirport On 
  Flights.destinationairportid = DestinationAirport.airportid
  where SourceAirport.airportlocation = 'Delhi'
  And DestinationAirport.airportlocation = 'Mumbai';