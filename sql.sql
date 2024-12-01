/*
tables --> 
Musician:
Attributes: ID, Name, Address (Street, City), Phone Number.
Instrument:
Attributes: Name (unique), Musical Key.
Album:
Attributes: Title (unique), Copyright Date, Album Identifier.
Song:
Attributes: Title (unique), Author.
Producer:
Attributes: Same as Musician (since a musician can also be a producer).

relationship--> 
 musician & instruments (many-to-many).
 album & song (one-to-many).
 song & musicians (many-to-many).
 album &  producer (one-to-many).
*/

--create database 
CREATE DATABASE musicana; 


--create tables
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    SupplierName TEXT NOT NULL,
    ContactNumber TEXT NOT NULL
);

CREATE TABLE Products (
    ProductID INT AUTO_INCREMENT PRIMARY KEY,
    ProductName TEXT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL,
    SupplierID INT,
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE Sales (
    SaleID INT AUTO_INCREMENT PRIMARY KEY,
    ProductID INT,
    QuantitySold INT NOT NULL,
    SaleDate DATE NOT NULL,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--alter table 
ALTER TABLE Products ADD COLUMN Category TEXT;

--delete table 
DROP TABLE Sales;


--insert new supplier
INSERT INTO Suppliers (SupplierName, ContactNumber) 
VALUES ('Tech Supplies Co.', '123-456-7890');


--insert new product
INSERT INTO Products (ProductName, Price, StockQuantity, SupplierID) 
VALUES ('Smartphone', 299.99, 50, 1);

--update price
UPDATE Products 
SET Price = 349.99 
WHERE ProductName = 'Smartphone';

--query for total
SELECT 
    P.ProductID, 
    P.ProductName, 
    SUM(S.QuantitySold) AS TotalQuantitySold, 
    SUM(S.QuantitySold * P.Price) AS TotalRevenue
FROM Products P
JOIN Sales S ON P.ProductID = S.ProductID
GROUP BY P.ProductID, P.ProductName;


--total suppliers
SELECT COUNT(*) AS TotalSuppliers FROM Suppliers;

