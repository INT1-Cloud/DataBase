
INSERT INTO Ports (PortName, Country, DockingFee) VALUES
('Alexandria','Egypt',5000.00),
('Port Said','Egypt',4500.00),
('Jeddah','Saudi Arabia',7000.00),
('Dubai','UAE',9000.00),
('Barcelona','Spain',8500.00),

INSERT INTO Voyages (VoyageCode,DepartureDate,ReturnDate,VoyageStatus,DeparturePortID) VALUES
('CR001','2026-12-10','2026-12-17','Scheduled',1),
('CR002','2026-12-20','2026-12-27','Scheduled',2),
('CR003','2027-01-05','2027-01-12','Scheduled',3),
('CR004','2026-10-01','2026-10-08','Completed',4),
('CR005','2026-09-15','2026-09-22','Completed',5),
('CR006','2027-02-01','2027-02-10','Scheduled',6),
('CR007','2027-03-10','2027-03-18','Scheduled',7),


INSERT INTO Cabins (CabinNumber,CabinType,PricePerNight,VoyageID) VALUES
('A101','Inside',1200.00,1),
('A102','OceanView',1800.00,1),
('A103','Balcony',2500.00,1),
('A104','Suite',5000.00,1),
('B201','Inside',1300.00,2),
('B202','Balcony',2700.00,2),
('B203','Suite',5500.00,2),
('C301','OceanView',1900.00,3),
('C302','Balcony',2800.00,3),
('D401','Inside',1100.00,4),
('D402','Suite',4800.00,4),

-- Synthetic examples only; not real passenger identities.
INSERT INTO Passengers (First_name,Last_name,Email,PassportNo,CabinID) VALUES
('Ahmed','Hassan','ahmed.hassan@example.com','EG100001',1),
('Omar','Ali','omar.ali@example.com','EG100002',2),
('Mohamed','Ibrahim','mohamed.i@example.com','EG100003',3),
('Youssef','Khaled','youssef.k@example.com','EG100004',4),
('Sara','Ahmed','sara.ahmed@example.com','EG100005',5),
('Mariam','Mahmoud','mariam.m@example.com','EG100006',6),
('Nour','Samir','nour.samir@example.com','EG100007',7),
('Ali','Mostafa','ali.mostafa@example.com','EG100008',8),


INSERT INTO Crew (FullName,RoleTitle,Salary,HireDate,VoyageID) VALUES
('Will Smith','Captain',25000.00,'2020-01-15',1),
('Ahmed Fathy','First Officer',18000.00,'2021-03-20',1),
('Omar Nabil','Engineer',15000.00,'2022-06-10',1),
('Sarah Johnson','Captain',26000.00,'2019-05-12',2),
('Mohamed Adel','Chef',12000.00,'2023-02-01',2),
('David Wilson','Captain',27000.00,'2018-09-25',3),
('Ali Hassan','Security Officer',9000.00,'2024-04-14',3),
('Mariam Samir','Nurse',11000.00,'2022-11-05',4),

INSERT INTO Activities (ActivityName,LocationOnDeck,Cost) VALUES
('Swimming Pool','Deck 5',0.00),
('Gym','Deck 6',0.00),
('Scuba Diving','Deck 2',1200.00),
('Live Concert','Deck 4',300.00),
('Cooking Class','Deck 8',250.00),
('Kids Club','Deck 3',0.00),
('Dining','Deck 9',750.00);

INSERT INTO Passenger_Activities (PassengerID,ActivityID,TicketsCount) VALUES
(1,1,2),(1,2,1),(1,5,1),(2,1,1),(2,4,2),
(3,3,1),(3,6,2),(4,2,2),(4,10,1),(5,7,1),
(6,8,2),(7,4,1),(8,5,2),(9,6,1),(10,9,3),
(11,10,2),(12,3,1),(13,7,2),(14,8,1),(15,1,2);
