-- 1. CREACIÓN DE LA BASE DE DATOS
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Northwind_DW')
BEGIN
    CREATE DATABASE Northwind_DW;
END
GO

USE Northwind_DW;
GO

-- 2. DIMENSIONES
CREATE TABLE Dim_Time (
    TimeKey INT PRIMARY KEY,
    FullDate DATE NOT NULL,
    Year INT NOT NULL,
    Quarter INT NOT NULL,
    Month INT NOT NULL,
    MonthName VARCHAR(15) NOT NULL,
    DayOfWeek VARCHAR(15) NOT NULL
);

CREATE TABLE Dim_Customer (
    CustomerKey NCHAR(5) PRIMARY KEY,
    CompanyName NVARCHAR(40) NOT NULL,
    ContactName NVARCHAR(30),
    City NVARCHAR(15),
    Country NVARCHAR(15)
);

CREATE TABLE Dim_Product (
    ProductKey INT PRIMARY KEY,
    ProductName NVARCHAR(40) NOT NULL,
    CategoryName NVARCHAR(15),
    SupplierName NVARCHAR(40)
);

-- 3. TABLA DE HECHOS
CREATE TABLE Fact_Sales (
    SalesKey INT IDENTITY(1,1) PRIMARY KEY,
    TimeKey INT NOT NULL REFERENCES Dim_Time(TimeKey),
    CustomerKey NCHAR(5) NOT NULL REFERENCES Dim_Customer(CustomerKey),
    ProductKey INT NOT NULL REFERENCES Dim_Product(ProductKey),
    UnitPrice MONEY NOT NULL,
    Quantity SMALLINT NOT NULL,
    Discount REAL NOT NULL,
    TotalAmount AS (CAST((UnitPrice * Quantity * (1 - Discount)) AS MONEY)) 
);
GO