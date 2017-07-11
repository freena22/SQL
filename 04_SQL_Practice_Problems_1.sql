# <<SQL Practice Problems>> 
# Introductory Problems -- 19 Questions

# not equal: <> OR !=
# contain strings: LIKE '%string%'

# No. 11 Showing only the date with a datetime field

SELECT FirstName, LastName, Title, DateOnlyBirthDate = convert(date, BirthDate)
FROM Employees
Order BY BirthDate;

# No. 12 Employees full name (Use + OR concat())

SELECT FirstName, LastName,Fullname = FirstName + ' ' + LastName
FROM Employees;

# No.13 OrderDetails amount per line item

SELECT OrderID, ProductID, UnitPrice, Quantity, TotalPrice = UnitPrice*Quantity
FROM OrderDetails
ORDER BY OrderID, ProductID;
# OR:  UnitPrice*Quantity AS TotalPrice

# No.15 When was the first order?
SELECT MIN(OrderDate) AS FirstOrder FROM Orders;

# No.16 Countries where there are customers
SELECT Country FROM Customers GROUP BY Country;


# !!! No.17 Contact title for customers
SELECT ContactTitle, COUNT(ContactTitle) AS TotalContactTitle 
FROM Customers
GROUP BY ContactTitle
ORDER BY TotalContactTitle DESC;

# No.18 Products with associated supplier names (basic inner join)

SELECT ProductID, ProductName, CompanyName FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID
ORDER BY ProductID;

# Add Alias 
SELECT ProductID, ProductName, CompanyName FROM Products P
JOIN Suppliers S ON P.SupplierID = S.SupplierID
ORDER BY ProductID;

# No.19 Orders and the Shipper that was used
SELECT OrderID, CONVERT(date,OrderDate) AS OrderDate, CompanyName FROM Orders
JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
WHERE OrderID < 10300
ORDER BY OrderID;

# Add Table Name to SupploerID to avoid the error (Ambigous column name SupplierID)
SELECT ProductID, ProductName, CompanyName, Suppliers.SupplierID
FROM Products
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;