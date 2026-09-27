/* Using Sales DB, Retrive a list of all orders, along with the related Customer, Product & Employee details. 
   For each order dispaly */

SELECT 
	o.OrderID,
	COALESCE(NULLIF (TRIM(CONCAT(c.FirstName,' ',c.LastName)),''),'UNKNOWN') AS Customer_Name,
	p.Product AS ProductName,
	p.Price,
	COALESCE(NULLIF (TRIM(CONCAT(e.FirstName,' ',e.LastName)),''),'UNKNOWN') AS Employee_Name,
	o.OrderDate,
	ISNULL(o.ShipAddress, 'HIDE') AS Address
FROM Sales.Orders o
LEFT JOIN Sales.Customers c
ON o.OrderID = c.CustomerID
LEFT JOIN Sales.Products p
ON o.ProductID = p.ProductID
LEFT JOIN Sales.Employees e
ON o.OrderID = e.EmployeeID