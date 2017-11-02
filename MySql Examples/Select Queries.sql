use NorthWind;
SELECT *
FROM Products;

SELECT *
FROM Products WHERE ProductName = 'Queso Cabrales';

SELECT ProductName as 'Product Name', UnitsInStock as 'Units In Stock'
FROM Products WHERE ProductName in ('Laughing Lumberjack Lager', 'Outback Lager', 'Ravioli Angelo');

SELECT *
FROM Orders WHERE CustomerId = 'QUEDE';

SELECT *
FROM Orders WHERE Freight > 100.00;

SELECT *
FROM Orders WHERE ShipCountry ='USA' AND Freight BETWEEN 10 AND 13;

SELECT CompanyName as 'Company Name', ContactTitle as 'Contact Title'
FROM suppliers WHERE ContactTitle LIKE 'Sales%'