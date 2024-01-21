USE AdventureWorks2022
GO

IF OBJECT_ID('taxMonitor', 'T') IS NOT NULL
	DROP TRIGGER taxMonitor;
GO

CREATE TRIGGER taxMonitor
ON Sales.SalesTaxRate
AFTER UPDATE
AS
	BEGIN
		IF UPDATE(TaxRate)
		BEGIN
			DECLARE @oldRate DECIMAL(8, 4);
			DECLARE @newRate DECIMAL(8, 4);

			SELECT @oldRate = TaxRate FROM deleted;
			SELECT @newRate = TaxRate FROM inserted;
			IF @newRate > @oldRate * 1.3
			BEGIN
				RAISERROR('Update Error! TaxRate cant be raised by more than 30% at a time.', 16, 1);
				ROLLBACK;
				RETURN;
			END;
		END;
	END;



