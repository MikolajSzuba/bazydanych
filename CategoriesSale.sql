WITH ProductCategories AS (
  SELECT ProductID, ps.Name as CategoryName FROM
  Production.Product p JOIN Production.ProductSubcategory ps
  ON P.PRODUCTSUBCATEGORYID = PS.PRODUCTSUBCATEGORYID
)
-- Nie wiem do konca co to wartosc sprzedazy
-- Jeżeli to suma zarobionych pieniędzy na danej kategorii to tak:
SELECT CategoryName as Category, SUM(OrderQty * (UnitPrice - UnitPriceDiscount)) AS SalesValue
  FROM ProductCategories pc JOIN Sales.SalesOrderDetail s1
    ON s1.ProductID = pc.ProductID JOIN Sales.SalesOrderHeader s2
    ON s1.SalesOrderID = s2.SalesOrderID
GROUP BY CategoryName
ORDER BY CategoryName
