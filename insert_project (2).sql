INSERT INTO ParkingLot VALUES ('V3425');
INSERT INTO ParkingLot VALUES ('B8935');
INSERT INTO ParkingLot VALUES ('R7980');

INSERT INTO Block VALUES ('A12', 'V3425');
INSERT INTO Block VALUES ('A32', 'V3425');
INSERT INTO Block VALUES ('B43', 'R7980');
INSERT INTO Block VALUES ('C83', 'B8935');
INSERT INTO Block VALUES ('D13', 'B8935');
INSERT INTO Block VALUES ('A53', 'B8935');

INSERT INTO Stall VALUES (145, 200, 'small', 'V3425','A12');
INSERT INTO Stall VALUES (86, 250, 'large', 'V3425', 'A32');
INSERT INTO Stall VALUES (10, 300, 'disabled', 'R7980', 'B43');
INSERT INTO Stall VALUES (50, 300, 'baby', 'B8935', 'C83');
INSERT INTO Stall VALUES (30, 300, 'disabled', 'R7980', 'B43');
INSERT INTO Stall VALUES (99, 300, 'disabled', 'B8935', 'C83');
INSERT INTO Stall VALUES (201, 220, 'small', 'B8935', 'C83');



INSERT INTO Customer VALUES ('AB5B0');
INSERT INTO Customer VALUES ('B65F3');
INSERT INTO Customer VALUES ('R98G0');
INSERT INTO Customer VALUES ('ZIORZ');
INSERT INTO Customer VALUES ('JQRS6');
INSERT INTO Customer VALUES ('WQF3O');

INSERT INTO Employee VALUES ('A5654');
INSERT INTO Employee VALUES ('G5733');
INSERT INTO Employee VALUES ('A1234');

INSERT INTO Vehicle VALUES ('ISF454', 'Toyota', 'AB5B0');
INSERT INTO Vehicle VALUES ('Q34G34', 'BMW', 'B65F3');
INSERT INTO Vehicle VALUES ('B4F343', 'Tesla', 'R98G0');
INSERT INTO Vehicle VALUES ('P7YEDP','Tesla','ZIORZ');
INSERT INTO Vehicle VALUES ('2SC5AB','Tesla','JQRS6');
INSERT INTO Vehicle VALUES ('7A6P19','Toyota','WQF3O');


INSERT INTO VehicleColour VALUES ('grey','ISF454');
INSERT INTO VehicleColour VALUES ('yellow','Q34G34');
INSERT INTO VehicleColour VALUES ('green','B4F343');
INSERT INTO VehicleColour VALUES ('green','P7YEDP');
INSERT INTO VehicleColour VALUES ('green','2SC5AB');
INSERT INTO VehicleColour VALUES ('yellow','7A6P19');


INSERT INTO customer_parksin_stall VALUES (10, 'AB5B0');
INSERT INTO customer_parksin_stall VALUES (145,'B65F3');
INSERT INTO customer_parksin_stall VALUES (86,'R98G0');
INSERT INTO customer_parksin_stall VALUES (99,'R98G0');
INSERT INTO customer_parksin_stall VALUES (201,'ZIORZ');
INSERT INTO customer_parksin_stall VALUES (30,'JQRS6');
INSERT INTO customer_parksin_stall VALUES (50,'A1234');

INSERT INTO Ticket VALUES(55, 19980829,103345, 35.5, 145,'ISF454','A5654' );
INSERT INTO Ticket VALUES(990, 20000605,081014, 100, 86,'B4F343','G5733' );
INSERT INTO Ticket VALUES(430, 19660328,035559, 154.5, 10, 'Q34G34','A1234' );
INSERT INTO Ticket VALUES(60,20000911,035559,101,'B4F343','A5654');
INSERT INTO Ticket VALUES(88,20070412,035559,300,'B4F343','A5654');
INSERT INTO Ticket VALUES(30,19980829,035559,1000,'B4F343','A5654');



INSERT INTO Ticket_issuedBy_employee VALUES(55,'A5654');
INSERT INTO Ticket_issuedBy_employee VALUES(430,'A1234');
INSERT INTO Ticket_issuedBy_employee VALUES(990,'G5733');
INSERT INTO Ticket_issuedBy_employee VALUES(60,'A5654');
INSERT INTO Ticket_issuedBy_employee VALUES(88,'A5654');
INSERT INTO Ticket_issuedBy_employee VALUES(30,'A5654');

INSERT INTO Customer_has_ticket VALUES(430,'AB5B0');
INSERT INTO Customer_has_ticket VALUES(55,'B65F3' );
INSERT INTO Customer_has_ticket VALUES(990,'R98G0');
INSERT INTO  Customer_has_ticket VALUES(60,'R98G0');
INSERT INTO  Customer_has_ticket VALUES(88,'R98G0');
INSERT INTO Customer_has_ticket VALUES(30,'R98G0');

INSERT INTO Pass VALUES(33, 345,20070822,20071022, 064523,'AB5B0');
INSERT INTO Pass VALUES(11, 50,20051201,20061201, 145634, 'R98G0');
INSERT INTO Pass VALUES(890, 250.45,20020204,20020204,114630, 'B65F3');
INSERT INTO Pass VALUES(60,50,20220922,20230922,064523,'ZIORZ');
INSERT INTO Pass VALUES(80,50,20180929,20190929,064523,'JQRS6');
INSERT INTO Pass VALUES(22,50,20110324,20110424,064523,'A1234');

INSERT INTO RegularPass VALUES(33,'monthly');
INSERT INTO RegularPass VALUES(11,'yearly');
INSERT INTO RegularPass VALUES(60,'yearly');
INSERT INTO RegularPass VALUES(80,'yearly');
INSERT INTO RegularPass VALUES(22,'monthly');


INSERT INTO DayPass VALUES(890);

INSERT INTO Vehicle_ownes_day VALUES(33,'ISF454');
INSERT INTO Vehicle_ownes_day VALUES(11,'Q34G34');
INSERT INTO Vehicle_ownes_day VALUES(890,'B4F343');
INSERT INTO Vehicle_ownes_day VALUES(60,'P7YEDP');
INSERT INTO Vehicle_ownes_day VALUES(80,'2SC5AB');
INSERT INTO Vehicle_owns_day VALUES(22,'7A6P19');

