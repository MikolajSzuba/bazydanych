WITH StoreRevenue AS (
	SELECT StoreID, SUM(TotalDue) AS Revenue
	FROM Sales.Customer AS s1
	INNER JOIN Sales.SalesOrderHeader AS s2
		ON s1.CustomerID = s2.CustomerID
	GROUP BY StoreID
),
StoreContacts AS (
	SELECT 
		CONCAT(s.Name, ' (', FirstName,' ', LastName, ')') AS ContactName,
		p2.BusinessEntityID AS StoreID
	FROM Person.Person AS p1
	INNER JOIN Person.BusinessEntityContact AS p2
		ON p1.BusinessEntityID = p2.PersonID
	INNER JOIN Sales.Store AS s
		ON p2.BusinessEntityID = s.BusinessEntityID
	WHERE PersonType = 'SC'
)

SELECT ContactName, Revenue
FROM StoreContacts AS sc
INNER JOIN StoreRevenue AS sr
	ON sc.StoreID = sr.StoreID
ORDER BY ContactName
