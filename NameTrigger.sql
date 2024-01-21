SE AdventureWorks2022
GO

IF OBJECT_ID('namesUpper', 'T') IS NOT NULL
	DROP TRIGGER namesUpper;
GO

CREATE TRIGGER namesUpper
ON Person.Person
AFTER INSERT
AS 
	BEGIN
		UPDATE Person.Person
		SET LastName = UPPER(Person.LastName)
		FROM inserted
		WHERE Person.BusinessEntityID = inserted.BusinessEntityID
	END
GO

