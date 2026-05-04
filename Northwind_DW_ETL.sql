USE Northwind_DW;
GO

-- Limpiar tablas en orden inverso para evitar errores de llaves foráneas
TRUNCATE TABLE Fact_Sales;
DELETE FROM Dim_Product;
DELETE FROM Dim_Customer;
DELETE FROM Dim_Time;

-- Carga de Clientes
INSERT INTO Dim_Customer (CustomerKey, CompanyName, ContactName, City, Country)
SELECT CustomerID, CompanyName, ContactName, City, Country FROM Northwind.dbo.Customers;

-- Carga de Productos (Denormalización de Categorías y Proveedores)
INSERT INTO Dim_Product (ProductKey, ProductName, CategoryName, SupplierName)
SELECT p.ProductID, p.ProductName, c.CategoryName, s.CompanyName
FROM Northwind.dbo.Products p
JOIN Northwind.dbo.Categories c ON p.CategoryID = c.CategoryID
JOIN Northwind.dbo.Suppliers s ON p.SupplierID = s.SupplierID;

-- Carga de Tiempo
INSERT INTO Dim_Time (TimeKey, FullDate, Year, Quarter, Month, MonthName, DayOfWeek)
SELECT DISTINCT
    (YEAR(OrderDate) * 10000) + (MONTH(OrderDate) * 100) + DAY(OrderDate),
    OrderDate, YEAR(OrderDate), DATEPART(QUARTER, OrderDate),
    MONTH(OrderDate), DATENAME(MONTH, OrderDate), DATENAME(WEEKDAY, OrderDate)
FROM Northwind.dbo.Orders;

-- Carga de Hechos de Ventas
INSERT INTO Fact_Sales (TimeKey, CustomerKey, ProductKey, UnitPrice, Quantity, Discount)
SELECT 
    (YEAR(o.OrderDate) * 10000) + (MONTH(o.OrderDate) * 100) + DAY(o.OrderDate),
    o.CustomerID, od.ProductID, od.UnitPrice, od.Quantity, od.Discount
FROM Northwind.dbo.Orders o
JOIN Northwind.dbo.OrderDetails od ON o.OrderID = od.OrderID;