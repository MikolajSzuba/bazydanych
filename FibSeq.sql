IF OBJECT_ID('dbo.FibSeq', 'FN') IS NOT NULL
    DROP FUNCTION dbo.FibSeq;
GO

IF OBJECT_ID('dbo.PrintFibSeq', 'P') IS NOT NULL
    DROP PROCEDURE dbo.PrintFibSeq;
GO

CREATE FUNCTION dbo.FibSeq(@n INT)
RETURNS @FibTbl TABLE (nFib INT) AS
	BEGIN
		DECLARE @x INT = 0, @y INT = 1, @i INT = 1;
		WHILE @i < @n
		BEGIN
			INSERT INTO @FibTbl VALUES (@x);
			SET @x = @x + @y;
			SET @y = @x - @y;
			SET @i = @i + 1;
		END
		RETURN;
	END;
GO

CREATE PROCEDURE dbo.PrintFibSeq(@n INT) AS
	BEGIN
		DECLARE @FibTbl TABLE(nFib INT);
		
		INSERT INTO @FibTbl 
			SELECT nFib FROM dbo.FibSeq(@n);

		SELECT nFib
		FROM @FibTbl
	END;
GO

EXEC dbo.PrintFibSeq @n = 33;
