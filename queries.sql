/* 1.  sum of all fine amounts */
SELECT SUM(fineAmount)
FROM ticket;

/* 2.  count the number of customer who buys a yearly pass*/
SELECT COUNT(passNumber) AS 'num of yearly pass owner'
FROM regularPass
WHERE passType = 'yearly';

/* 3. employee who distributed the highest number of tickets*/
CREATE VIEW employeeTicket AS
SELECT employeeID, COUNT(ticketNumber) AS 'TotalNumOfTicket'
FROM ticket_issuedby_employee
GROUP BY employeeID;

/* 4. */
SELECT employeeID
FROM employeeTicket
WHERE TotalNumOfTicket = (SELECT MAX(TotalNumOfTicket) FROM employeeTicket);

/* 5. num of block in each of the parking lot*/
SELECT P.lotID, COUNT(blockCode)
FROM parkingLot P, Block B
WHERE P.lotID = B.lotID
GROUP BY lotID
ORDER BY COUNT(blockCode);

/* 6. num of stall in each of the parking lot*/
SELECT P.lotID, COUNT(stallNumber)
FROM parkingLot P, Block B, Stall S
WHERE P.lotID = B.lotID AND (B.lotID, B.blockCode) = (S.lotID, S.blockCode)
GROUP BY lotID
ORDER BY COUNT(stallNumber) DESC;

/* 7. minumun fine amount we get*/
SELECT MIN(fineAmount)
FROM ticket;

/* 8. total number of disabled stall*/
SELECT COUNT(stallNumber) AS 'disabled stall'
FROM stall
WHERE stallType = 'disabled' AND stallSize > 250;

/* 9. total pricetag in selling pass */
SELECT SUM(cost)
FROM pass;

/* 10. number of times that a customer parks in our company's parking stall with his/her regular pass type */
SELECT C.customerID, passType, COUNT(stallNumber) AS 'Number of times parks in our parking lot'
FROM Pass P, regularPass R, customer_parksin_stall C
WHERE  P.customerID = C.customerID AND P.passNumber = R.passNumber
GROUP BY customerID;

/* 11.  pass type which has a ticket*/
SELECT ticketNumber, passType
FROM ((ticket CROSS JOIN customer_has_ticket C) LEFT JOIN pass P ON P.customerID = C.customerID) LEFT JOIN regularPass R ON R.passNumber = P.passNumber;

/* 12 . num of customers we have since 2005-09-01*/
SELECT COUNT(C.customerID) AS 'num of customers'
FROM customer C, pass P
WHERE C.customerID = P.customerID AND startDate > 20050901;

/* 13. License plate of a Customer */
SELECT LicensePlateNumber, CustomerID
FROM Vehicle
WHERE CustomerID IS NOT NULL;

/* 14. Check in time of a parking stall*/
SELECT Pass.CheckInTime, Customer_parksIn_stall.StallNumber
FROM Pass CROSS JOIN Customer_parksIn_stall 
WHERE Pass.CustomerID = Customer_parksIn_stall.CustomerID;

/* 15. Number of vehicles a Customer has */
SELECT Customer.CustomerID, COUNT(Vehicle.LicensePlateNumber) AS 'number of cars'
FROM Customer CROSS JOIN Vehicle
WHERE Customer.CustomerID = Vehicle.CustomerID;

/* 16. Customers Fines of over 100 dollars for employees that have a year pass */
SELECT Customer_has_ticket.CustomerID, SUM(Ticket.FineAmount)
FROM Customer_has_ticket, Ticket
WHERE Customer_has_ticket.TicketNumber = Ticket.TicketNumber
AND SUM(Ticket.FineAmount) > 100;

/* 17. How many green cars were in each stall from (insert date) to (insert date)*/
SELECT StallNumber
FROM ((Customer_parksIn_stall CROSS JOIN VEHICLE V) INNER JOIN VehicleColour
ON V.LicensePlateNumber = VehicleColour.LicensePlateNumber)
WHERE VehicleColour.Colour = 'Green';

/* 18. How many tickets were given on (insert this date)*/
SELECT DISTINCT TDate, Count(TicketNumber)
FROM Ticket;

/* 19. Stalls that have Toyota make cars in them in them for at least a year*/
SELECT StallNumber
FROM (Customer_parksIn_stall INNER JOIN Vehicle
ON Customer_parksIn_stall.CustomerID = VEHICLE.CustomerID) 
WHERE VEHICLE.Make = 'Toyota';

/* 20. Parking lot that has at least 3 teslas in there  */
SELECT Stall.LotId
FROM ((Stall CROSS JOIN Customer C) INNER JOIN Vehicle
ON C.CustomerID = Vehicle.CustomerID )
WHERE( Vehicle.Make = 'tesla');

/* 21. Disabled stalls which has day passes  */
SELECT Stall.type, DayPass.PassNumber
FROM Stall CROSS JOIN DayPass;

/* 22. Vehicles that are not white which dont have tickets */
SELECT Vehicle.Make, VehicleColour.Color
FROM (Vehicle CROSS JOIN VehicleColour ) INNER JOIN Ticket
ON COUNT(TicketNumber) = 0;