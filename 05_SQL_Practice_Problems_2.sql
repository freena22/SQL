# <<SQL Practice Problems>> 
# Intermediate Problems -- 11 Questions

# No.20 Categories, and the total products in each category
SELECT CategoryName, TotalProducts = COUNT(ProductID)
FROM Products JOIN Categories ON Products.CategoryID = Categories.CategoryID
GROUP BY CategoryName
ORDER BY TotalProducts DESC;

# No.21 Total customers per country/city
SELECT Country, City, COUNT(*) AS TotalCustomers FROM Customers
GROUP BY Country, City
Order BY TotalCustomers DESC;
# Once GROUP BY, every field appears in SELECT needs to either in GROUP BY or have aggregate function on it

# No.23 Calculate products that need reordering
SELECT ProductID, ProductName, UnitsInStock, ReorderLevel,Discontinued FROM Products
WHERE UnitsInStock + UnitsOnOrder <= ReorderLevel AND Discontinued = 0;

# No.24 Customer list by region - sorted by region with null values in the end
SELECT CustomerID, CompanyName, Region FROM Customers
ORDER BY CASE WHEN Region is null then 1 else 0 END, Region;

# OR alias and no need to repeat the CASE statement in the ORDER BY
SELECT CustomerID, CompanyName, Region, RegionOrder = CASE WHEN region is null then 1 ELSE 0 END
FROM Customers
ORDER BY RegionOrder, Region,CustomerID;