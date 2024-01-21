USE AdventureWorks2022
GO

-- zakladam ze imie i nazwisko to wystarczajace dane, jesli potrzeba by bylo wiecej 
-- to wystarczyloby inner join po businessentityid do potrzebnych tabel
WITH EmployeeRateInfo AS (
	SELECT FirstName, LastName, Rate AS PayRate
	FROM Person.Person AS p
	INNER JOIN HumanResources.EmployeePayHistory AS r
		ON p.BusinessEntityID = r.BusinessEntityID
	WHERE PersonType IN ('EM','SP') AND r.ModifiedDate = (
				SELECT MAX(ModifiedDate)
				FROM HumanResources.EmployeePayHistory
				WHERE BusinessEntityID = p.BusinessEntityID
			)
)

SELECT *
INTO #TempEmployeeInfo
FROM EmployeeRateInfo;
	
SELECT * FROM #TempEmployeeInfo;

DROP TABLE #TempEmployeeInfo;
